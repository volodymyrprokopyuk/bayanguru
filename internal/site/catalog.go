package site

import (
  "fmt"
  "path/filepath"
  "slices"
  "strconv"
  "strings"
  "text/template"

  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
  "golang.org/x/text/collate"
  "golang.org/x/text/language"
)

var tr = map[string]string{
  "ukrainian": "Ukrainian | Українські",
  "russian": "Russian | Російські",
  "belarusian": "Belarusian | Білоруські",
  "hungaria": "Hungarian | Угорські",
  "extra": "Extra | Різне",
  "european": "European | Європейські",
}

type PieceGroups map[string][]cat.Piece

func groupPieces(
  pieces []cat.Piece, pieceKey func(piece cat.Piece) string,
) PieceGroups {
  groups := make(PieceGroups, 20)
  for _, piece := range pieces {
    key := pieceKey(piece)
    if _, in := groups[key]; !in {
      groups[key] = make([]cat.Piece, 0, 300)
    }
    groups[key] = append(groups[key], piece)
  }
  return groups
}

func validateGroups(groups PieceGroups, groupNames []string) error {
  for key := range groups {
    groupName := strings.Split(key, "/")[0]
    if slices.Index(groupNames, groupName) == -1 {
      return fmt.Errorf("cannot publish unknown group %v", groupName)
    }
  }
  return nil
}

func keyTit(piece cat.Piece) string {
  if piece.Gnr == "stu" {
    com := []rune(piece.Com)
    if len(com) > 3 {
      return string(com[3:])
    }
  }
  return piece.Tit
}

var collator = collate.New(language.Und)

func sortGroups(groups PieceGroups) {
  for _, pieces := range groups {
    slices.SortStableFunc(pieces, func(a, b cat.Piece) int {
      return collator.CompareString(keyTit(a), keyTit(b))
    })
  }
}

func makeAlphabet() []string {
  var alphabet = strings.Split("АБВГҐДЕЄЖЗИІЇЙКЛМНОПРСТУФХЦЧШЩЭЮЯ", "")
  slices.SortStableFunc(alphabet, func(a, b string) int {
    return collator.CompareString(a, b)
  })
  return alphabet
}

var alphabet = makeAlphabet()

func markAlphaPieces(groups PieceGroups) {
  for _, pieces := range groups {
    i := 0
    for _, alpha := range alphabet {
      for j := i; j < len(pieces); j++ {
        tit := keyTit(pieces[j])
        if collator.CompareString(string([]rune(tit)[0:1]), alpha) == 0 {
          pieces[j].AlphaLink = alpha
          i = j + 1
          break
        }
      }
    }
  }
}

func pageGroups(groups PieceGroups, pageSize int) PieceGroups {
  pagedGroups := make(PieceGroups, 200)
  for key, group := range groups {
    i := 1
    if len(group) <= pageSize {
      pagedGroups[fmt.Sprintf("%v/%v", key, i)] = group
      continue
    }
    pieces := make([]cat.Piece, 0, pageSize)
    for _, piece := range group {
      pieces = append(pieces, piece)
      if len(pieces) == pageSize {
        pagedGroups[fmt.Sprintf("%v/%v", key, i)] = pieces
        pieces = make([]cat.Piece, 0, pageSize)
        i++
      }
    }
    if len(pieces) > 0 {
      pagedGroups[fmt.Sprintf("%v/%v", key, i)] = pieces
    }
  }
  return pagedGroups
}

type Link struct{
  URL, Title string
  Disabled bool
}

func makeGroupLinksMap(
  groupNames []string, groupURL string,
) map[string][]Link {
  glMap := make(map[string][]Link, len(groupNames))
  for _, currentGroup := range groupNames {
    links := make([]Link, 0, len(groupNames))
    for _, groupName := range groupNames {
      link := Link{
        URL: filepath.Join(groupURL, groupName, "1"),
        Title: tr[groupName],
        Disabled: groupName == currentGroup,
      }
      links = append(links, link)
    }
    glMap[currentGroup] = links
  }
  return glMap
}

func makeAlphaLinksMap(
  groupPages PieceGroups, groupNames []string, groupURL string,
) map[string][]Link {
  alMap := make(map[string][]Link, len(groupNames))
  for _, groupName := range groupNames {
    alphaPage := make(map[string]string, len(alphabet))
    page := 1
    for {
      key := fmt.Sprintf("%v/%v", groupName, page)
      pieces, in := groupPages[key]
      if !in {
        break
      }
      for _, piece := range pieces {
        if len(piece.AlphaLink) > 0 {
          alphaPage[piece.AlphaLink] = key
        }
      }
      page++
    }
    links := make([]Link, 0, len(alphabet))
    for _, alpha := range alphabet {
      var link Link
      if key, in := alphaPage[alpha]; in {
        link = Link{
          URL: filepath.Join(groupURL, key + "#" + alpha),
          Title: alpha,
        }
      } else {
        link = Link{
          Title: alpha,
          Disabled: true,
        }
      }
      links = append(links, link)
    }
    alMap[groupName] = links
  }
  return alMap
}

func makePageLinks(
  groupPages PieceGroups, currentGroup, currentPage, groupURL string,
) []Link {
  currPage, _ := strconv.Atoi(currentPage)
  page := currPage - 2 // start page
  if page < 1 {
    page = 1
  }
  links := make([]Link, 0, 5)
  for range 5 { // at most 5 pages
    if _, in := groupPages[fmt.Sprintf("%v/%v", currentGroup, page)]; !in {
      break
    }
    strPage := strconv.Itoa(page)
    link := Link{
      URL: filepath.Join(groupURL, currentGroup, strPage),
      Title: strPage,
      Disabled: page == currPage,
    }
    links = append(links, link)
    page++
  }
  if len(links) == 1 {
    return nil
  }
  return links
}

type CatalogData struct {
  GroupLinks []Link
  Title string
  AlphaLinks []Link
  Pieces []cat.Piece
  PageLinks []Link
}

func publishGroupPages(
  tpl *template.Template, groupPages PieceGroups, groupNames []string,
  groupDir, groupURL string,
) error {
  groupLinksMap := makeGroupLinksMap(groupNames, groupURL)
  alphaLinksMap := makeAlphaLinksMap(groupPages, groupNames, groupURL)
  for key, pieces := range groupPages {
    slc := strings.Split(key, "/")
    currentGroup, currentPage := slc[0], slc[1]
    catalogDir := filepath.Join(groupDir, currentGroup)
    pageLinks := makePageLinks(groupPages, currentGroup, currentPage, groupURL)
    catalogData := CatalogData{
      GroupLinks: groupLinksMap[currentGroup],
      Title: tr[currentGroup],
      AlphaLinks: alphaLinksMap[currentGroup],
      Pieces: pieces,
      PageLinks: pageLinks,
    }
    err := publishFile(tpl, catalogDir, currentPage, catalogData)
    if err != nil {
      return err
    }
  }
  return nil
}

func keyByOrg(piece cat.Piece) string {
  org := piece.Org
  switch org {
  case "ukr":
    org = "ukrainian"
  case "rus":
    org = "russian"
  case "blr":
    org = "belarusian"
  case "hun":
    org = "hungarian"
  case "mda", "pol", "cze", "svk", "lva":
    org = "extra"
  case "aut", "deu", "dnk", "fra", "swe":
    org = "european"
  }
  return org
}

func publishByOrg(
  tpl *template.Template, pieces []cat.Piece, pc PublishCommand,
) error {
  groupDir := filepath.Join(pc.PublicDir, "catalog", "origin")
  groupURL := "/catalog/origin"
  groupNames := []string{
    "ukrainian", "russian", "belarusian", "hungarian", "extra", "european",
  }
  piecesByOrg := groupPieces(pieces, keyByOrg)
  err := validateGroups(piecesByOrg, groupNames)
  if err != nil {
    return err
  }
  sortGroups(piecesByOrg)
  markAlphaPieces(piecesByOrg)
  pagesByOrg := pageGroups(piecesByOrg, pc.PageSize)
  return publishGroupPages(tpl, pagesByOrg, groupNames, groupDir, groupURL)
}

func keyBySty(piece cat.Piece) string {
  return piece.Sty
}

func keyByGnr(piece cat.Piece) string {
  gnr := piece.Gnr
  if gnr == "stu" {
    bss := cat.Bss(piece.Bss, piece.ID)
    var stu string
    if bss == "stb" {
      stu = cat.Stu(piece.Frm, piece.ID)
    } else if bss == "pub" {
      stu = "lft"
    } else {
      stu = cat.Stu(piece.Bss, piece.ID)
    }
    return fmt.Sprintf("%v-%v", gnr, stu)
  }
  switch gnr {
  case "chd", "lul", "mil", "pry", "rmc", "ves":
    gnr = "sng"
  case "gop", "koz", "mrc", "plk", "mzr", "tng", "vls":
    gnr = "dnc"
  case "gyp":
    gnr = "pie"
  }
  return gnr
}

func keyByCom(piece cat.Piece) string {
  com := "noc"
  if len(piece.Com) > 0 {
    com = piece.Com
  } else if len(piece.Arr) > 0 {
    com = piece.Arr
  }
  return com
}

func keyByBss(piece cat.Piece) string {
  return cat.Bss(piece.Bss, piece.ID)
}

func keyByLvl(piece cat.Piece) string {
  return piece.Lvl
}

func publishCatalog(tpl *template.Template, pc PublishCommand) error {
  pieces, _, catLen, err := cat.ReadPiecesAndBooks(
    pc.CatalogDir, "", nil, pc.BookFile, nil, false, true,
  )
  if err != nil {
    return err
  }
  cat.PrintStat(catLen, len(pieces))
  catalogFile := filepath.Join(pc.TemplateDir, "catalog.html")
  _, err = tpl.ParseFiles(catalogFile)
  if err != nil {
    return err
  }
  err = publishByOrg(tpl, pieces, pc)
  if err != nil {
    return err
  }
  // piecesBySty := groupPieces(pieces, keyBySty)
  // piecesByGnr := groupPieces(pieces, keyByGnr)
  // piecesByCom := groupPieces(pieces, keyByCom)
  // piecesByBss := groupPieces(pieces, keyByBss)
  // piecesByLvl := groupPieces(pieces, keyByLvl)
  return nil
}
