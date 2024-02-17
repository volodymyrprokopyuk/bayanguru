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

func keyTitStuCom(piece cat.Piece) string {
  if piece.Gnr == "stu" {
    com := []rune(piece.Com)
    if len(com) > 3 {
      return string(com[3:])
    }
  }
  return piece.Tit
}

func sortGroups(groups PieceGroups) {
  collator := collate.New(language.Und)
  for _, pieces := range groups {
    slices.SortStableFunc(pieces, func(a, b cat.Piece) int {
      return collator.CompareString(keyTitStuCom(a), keyTitStuCom(b))
    })
  }
}

type Link struct{
  URL, Title string
  Disabled bool
}

type CatalogData struct {
  GroupLinks []Link
  Title string
  AlphaLinks []Link
  Pieces []cat.Piece
  PageLinks []Link
}

func makeGroupLinks(groupNames []string, currentGroup, groupURL string) []Link {
  links := make([]Link, 0, len(groupNames))
  for _, groupName := range groupNames {
    link := Link{
      URL: filepath.Join(groupURL, groupName, "1"),
      Title: tr[groupName],
      Disabled: groupName == currentGroup,
    }
    links = append(links, link)
  }
  return links
}

func makePageLinks(
  groups PieceGroups, currentGroup, currentPage, groupURL string,
) []Link {
  currPage, _ := strconv.Atoi(currentPage)
  page := currPage - 2 // start page
  if page < 1 {
    page = 1
  }
  links := make([]Link, 0, 5)
  for range 5 { // at most 5 pages
    if _, in := groups[fmt.Sprintf("%v/%v", currentGroup, page)]; !in {
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

func publishGroups(
  tpl *template.Template, groups PieceGroups, groupNames []string,
  groupDir, groupURL string,
) error {
  for key, pieces := range groups {
    slc := strings.Split(key, "/")
    currentGroup, currentPage := slc[0], slc[1]
    catalogDir := filepath.Join(groupDir, currentGroup)
    groupLinks := makeGroupLinks(groupNames, currentGroup, groupURL)
    pageLinks := makePageLinks(groups, currentGroup, currentPage, groupURL)
    catalogData := CatalogData{
      GroupLinks: groupLinks,
      Title: tr[currentGroup],
      AlphaLinks: nil,
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
  case "pol", "cze", "svk", "lva", "mda":
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
  groups := []string{
    "ukrainian", "russian", "belarusian", "hungarian", "extra", "european",
  }
  piecesByOrg := groupPieces(pieces, keyByOrg)
  sortGroups(piecesByOrg)
  piecesByOrg = pageGroups(piecesByOrg, pc.PageSize)
  return publishGroups(tpl, piecesByOrg, groups, groupDir, groupURL)
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
  case "gop", "koz", "mrc", "plk", "tng", "vls":
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
