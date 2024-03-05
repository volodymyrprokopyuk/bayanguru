package site

import (
  "fmt"
  "path/filepath"
  "slices"
  "strconv"
  "strings"
  "text/template"
  "os"

  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
  "golang.org/x/text/collate"
  "golang.org/x/text/language"
)

var tr = map[string]string{
  // org
  "ukrainian": "Ukrainian | Українські",
  "russian": "Russian | Російські",
  "belarusian": "Belarusian | Білоруські",
  "hungaria": "Hungarian | Угорські",
  "extra": "Extra | Різне",
  "european": "European | Європейські",
  // sty
  "folk": "Folk | Фолькльор",
  "custom": "Custom piece | Авторська п'єса",
  "classic": "Classic | Класика",
  // gnr
  "song": "Song | Пісня",
  "dance": "Dance | Танець",
  "piece": "Piece | П'єса",
  // stu
  "scale": "Scale | Гами",
  "arpeggio": "Arpeggio | Арпеджіо",
  "interval": "Interval | Інтревали",
  "chord": "Chord | Акорди",
  "polyphony": "Polyphony | Поліфонія",
  "left-hand": "Left hand | Ліва рука",
  // com
  "composer": "Composer | Композитор",
  "no-composer": "No composer | Без композитора",
  // bss
  "standard-bass": "Standard bass | Готовий аккорд",
  "pure-bass": "Pure bass | Чистий бас",
  "free-bass": "Free bass | Виборна система",
  // lvl
  "elementary-a": "Elementary A | Простий A",
  "elementary-b": "Elementary B | Простий B",
  "elementary-c": "Elementary C | Простий C",
  "intermediary-a": "Intermediary A | Середній A",
}

type PieceGroups map[string][]cat.Piece

func groupPieces(
  pieces []cat.Piece, pieceKey func(piece cat.Piece) string,
) PieceGroups {
  groups := make(PieceGroups, 20)
  for _, piece := range pieces {
    key := pieceKey(piece)
    if _, exists := groups[key]; !exists {
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

func keyCom(piece cat.Piece) string {
  if len(piece.Com) > 3 {
    return string([]rune(piece.Com)[3:])
  }
  if len(piece.Arr) > 3 {
    return string([]rune(piece.Arr)[3:])
  }
  return piece.Tit
}

func keyTit(piece cat.Piece) string {
  if piece.Gnr == "stu" {
    return keyCom(piece)
  }
  return piece.Tit
}

var collator = collate.New(language.Und)

func sortGroups(groups PieceGroups, sortKey func(piece cat.Piece) string) {
  for _, pieces := range groups {
    slices.SortStableFunc(pieces, func(a, b cat.Piece) int {
      return collator.CompareString(sortKey(a), sortKey(b))
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

func markAlphaPieces(groups PieceGroups, sortKey func(piece cat.Piece) string) {
  for _, pieces := range groups {
    i := 0
    for _, alpha := range alphabet {
      for j := i; j < len(pieces); j++ {
        tit := sortKey(pieces[j])
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
      pieces, exists := groupPages[key]
      if !exists {
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
      if key, exists := alphaPage[alpha]; exists {
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
    key := fmt.Sprintf("%v/%v", currentGroup, page)
    if _, exists := groupPages[key]; !exists {
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
    err := publishFile(os.Stdout, tpl, catalogDir, currentPage, catalogData)
    if err != nil {
      return err
    }
  }
  return nil
}

func filterPieces(
  pieces []cat.Piece, include func(piece cat.Piece) bool,
) []cat.Piece {
  filtered := make([]cat.Piece, 0, len(pieces))
  for _, piece := range pieces {
    if include(piece) {
      filtered = append(filtered, piece)
    }
  }
  return filtered
}

func publishGroup(
  tpl *template.Template, pieces []cat.Piece,
  groupKey func(piece cat.Piece) string,
  sortKey func(piece cat.Piece) string,
  group string, groupNames []string, pc PublishCommand,
) error {
  groupDir := filepath.Join(pc.PublicDir, "catalog", group)
  groupURL := "/catalog/" + group
  groups := groupPieces(pieces, groupKey)
  err := validateGroups(groups, groupNames)
  if err != nil {
    return err
  }
  sortGroups(groups, sortKey)
  markAlphaPieces(groups, sortKey)
  groupPages := pageGroups(groups, pc.PageSize)
  return publishGroupPages(tpl, groupPages, groupNames, groupDir, groupURL)
}

func keyByOrg(piece cat.Piece) string {
  switch piece.Org {
  case "ukr":
    return "ukrainian"
  case "rus":
    return "russian"
  case "blr":
    return "belarusian"
  case "hun":
    return "hungarian"
  case "mda", "pol", "cze", "svk", "lva":
    return "extra"
  case "aut", "deu", "dnk", "fra", "swe":
    return "european"
  default:
    return piece.Org
  }
}

func keyBySty(piece cat.Piece) string {
  switch piece.Sty {
  case "flk":
    return "folk"
  case "cus":
    return "custom"
  case "cls":
    return "classic"
  default:
    return piece.Sty
  }
}

func keyByGnr(piece cat.Piece) string {
  switch piece.Gnr {
  case "sng", "chd", "lul", "mil", "pry", "rmc", "ves":
    return "song"
  case "dnc", "gop", "koz", "mrc", "plk", "mzr", "tng", "vls":
    return "dance"
  case "pie", "gyp":
    return "piece"
  default:
    return piece.Gnr
  }
}

func keyByStu(piece cat.Piece) string {
  var frm string
  switch cat.Bss(piece.Bss, piece.ID) {
  case "stb":
    frm = cat.Stu(piece.Frm, piece.ID)
  case "pub":
    frm = "lft"
  case "frb":
    frm = cat.Stu(piece.Bss, piece.ID)
  default:
    frm = "unknown"
  }
  switch frm {
  case "scl":
    return "scale"
  case "arp":
    return "arpeggio"
  case "int":
    return "interval"
  case "crd":
    return "chord"
  case "pph":
    return "polyphony"
  case "lft":
    return "left-hand"
  default:
    return frm
  }
}

func keyByCom(piece cat.Piece) string {
  if len(piece.Com) > 0 || len(piece.Arr) > 0 {
    return "composer"
  }
  return "no-composer"
}

func keyByBss(piece cat.Piece) string {
  switch bss := cat.Bss(piece.Bss, piece.ID); bss {
  case "stb":
    return "standard-bass"
  case "pub":
    return "pure-bass"
  case "frb":
    return "free-bass"
  default:
    return bss
  }
}

func keyByLvl(piece cat.Piece) string {
  switch lvl := piece.Lvl; lvl[:2] {
  case "el":
    return "elementary-" + lvl[2:]
  case "in":
    return "intermediary-" + lvl[2:]
  default:
    return lvl
  }
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
  err = publishGroup(
    tpl, pieces, keyByOrg, keyTit, "origin", catGroups["origin"], pc,
  )
  if err != nil {
    return err
  }
  err = publishGroup(
    tpl, pieces, keyBySty, keyTit, "style", catGroups["style"], pc,
  )
  if err != nil {
    return err
  }
  gnrPieces := filterPieces(pieces, func(piece cat.Piece) bool {
    return piece.Gnr != "stu"
  })
  err = publishGroup(
    tpl, gnrPieces, keyByGnr, keyTit, "genre", catGroups["genre"], pc,
  )
  if err != nil {
    return err
  }
  stuStbPieces := filterPieces(pieces, func(piece cat.Piece) bool {
    bss := cat.Bss(piece.Bss, piece.ID)
    return piece.Gnr == "stu" && (bss == "stb" || bss == "pub")
  })
  err = publishGroup(
    tpl, stuStbPieces, keyByStu, keyCom, "study-stb", catGroups["study-stb"], pc,
  )
  if err != nil {
    return err
  }
  stuFrbPieces := filterPieces(pieces, func(piece cat.Piece) bool {
    bss := cat.Bss(piece.Bss, piece.ID)
    return piece.Gnr == "stu" && bss == "frb"
  })
  err = publishGroup(
    tpl, stuFrbPieces, keyByStu, keyCom, "study-frb", catGroups["study-frb"], pc,
  )
  if err != nil {
    return err
  }
  err = publishGroup(
    tpl, pieces, keyByCom, keyCom, "composer", catGroups["composer"], pc,
  )
  if err != nil {
    return err
  }
  err = publishGroup(
    tpl, pieces, keyByBss, keyTit, "bass", catGroups["bass"], pc,
  )
  if err != nil {
    return err
  }
  err = publishGroup(
    tpl, pieces, keyByLvl, keyTit, "level", catGroups["level"], pc,
  )
  if err != nil {
    return err
  }
  return nil
}
