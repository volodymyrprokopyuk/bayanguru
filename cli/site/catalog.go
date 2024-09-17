package site

import (
	"fmt"
	"os"
	"path/filepath"
	"slices"
	"strconv"
	"strings"
	"text/template"

	"github.com/volodymyrprokopyuk/bayanguru/cli/catalog"
	"github.com/volodymyrprokopyuk/bayanguru/cli/style"
	"golang.org/x/text/collate"
	"golang.org/x/text/language"
)

var tr = map[string]string{
  // org
  "ukrainian": "Ukrainian | Українські",
  "russian": "Russian | Російські",
  "belarusian": "Belarusian | Білоруські",
  "hungarian": "Hungarian | Угорські",
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
  // bss
  "standard-bass": "Standard bass | Готовий аккорд",
  "pure-bass": "Pure bass | Чистий бас",
  "free-bass": "Free bass | Виборна система",
  // lvl
  "elementary-a": "Elementary A | Простий A",
  "elementary-b": "Elementary B | Простий B",
  "elementary-c": "Elementary C | Простий C",
  // ens
  // "lyrics": "Lyrics | Пісні",
}

type PieceGroups map[string][]catalog.Piece

func groupPieces(
  pieces []catalog.Piece, pieceKey func(piece catalog.Piece) []string,
) PieceGroups {
  groups := make(PieceGroups, 20)
  for _, piece := range pieces {
    for _, key := range pieceKey(piece) {
      if _, exists := groups[key]; !exists {
        groups[key] = make([]catalog.Piece, 0, 300)
      }
      groups[key] = append(groups[key], piece)
    }
  }

  return groups
}

func validateGroups(groups PieceGroups, groupNames []string) error {
  for key := range groups {
    groupName := strings.Split(key, "/")[0]
    if slices.Index(groupNames, groupName) == -1 {
      return fmt.Errorf(
        "cannot publish unknown group %v for %v", groupName, groupNames,
      )
    }
  }
  return nil
}

func keyCom(piece catalog.Piece) string {
  var keyCom string
  if len(piece.Com) > 3 {
    keyCom = string([]rune(piece.Com)[3:])
  } else if len(piece.Arr) > 3 {
    keyCom = string([]rune(piece.Arr)[3:])
  }
  return keyCom + piece.Tit
}

func keyTit(piece catalog.Piece) string {
  if piece.Gnr == "stu" {
    return keyCom(piece)
  }
  return piece.Tit + keyCom(piece)
}

var collator = collate.New(language.Und)

func sortGroups(groups PieceGroups, sortKey func(piece catalog.Piece) string) {
  for _, pieces := range groups {
    slices.SortStableFunc(pieces, func(a, b catalog.Piece) int {
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

func markAlphaPieces(groups PieceGroups, sortKey func(piece catalog.Piece) string) {
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
    pieces := make([]catalog.Piece, 0, pageSize)
    for _, piece := range group {
      pieces = append(pieces, piece)
      if len(pieces) == pageSize {
        pagedGroups[fmt.Sprintf("%v/%v", key, i)] = pieces
        pieces = make([]catalog.Piece, 0, pageSize)
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
  Pieces []catalog.Piece
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
    err := publishDirIndex(os.Stdout, tpl, catalogDir, currentPage, catalogData)
    if err != nil {
      return err
    }
  }
  return nil
}

func filterPieces(
  pieces []catalog.Piece, include func(piece catalog.Piece) bool,
) []catalog.Piece {
  filtered := make([]catalog.Piece, 0, len(pieces))
  for _, piece := range pieces {
    if include(piece) {
      filtered = append(filtered, piece)
    }
  }
  return filtered
}

func publishGroup(
  tpl *template.Template, pieces []catalog.Piece,
  groupKey func(piece catalog.Piece) []string,
  sortKey func(piece catalog.Piece) string,
  group string, groupNames []string, pc PublishCommand,
) error {
  groupDir := filepath.Join(pc.PublicDir, "catalog", group)
  groupURL := "/catalog/" + group
  if len(pieces) == 0 {
    return fmt.Errorf("no pieces for %v", groupURL)
  }
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

func keyByOrg(piece catalog.Piece) []string {
  var key string
  switch piece.Org {
  case "ukr":
    key = "ukrainian"
  case "rus":
    key = "russian"
  case "blr":
    key = "belarusian"
  case "hun":
    key = "hungarian"
  case "mda", "pol", "cze", "svk", "lva":
    key = "extra"
  case "aut", "deu", "dnk", "fra", "swe":
    key = "european"
  default:
    key = piece.Org
  }
  return []string{key}
}

func keyBySty(piece catalog.Piece) []string {
  var key string
  switch piece.Sty {
  case "flk":
    key = "folk"
  case "cus":
    key = "custom"
  case "cls":
    key = "classic"
  default:
    key = piece.Sty
  }
  return []string{key}
}

func keyByGnr(piece catalog.Piece) []string {
  var key string
  switch piece.Gnr {
  case "sng", "chd", "lul", "mil", "pry", "rmc", "ves":
    key = "song"
  case "dnc", "gop", "koz", "mrc", "plk", "mzr", "qdr", "tng", "vls":
    key = "dance"
  case "pie", "pre", "inv", "can", "gyp":
    key = "piece"
  default:
    key = piece.Gnr
  }
  return []string{key}
}

func keyByStu(piece catalog.Piece) []string {
  keys := make(map[string]bool, 5)
  for _, bss := range piece.Bss {
    var stuFrm []string
    switch bss {
    case "stb":
      stuFrm = piece.Frm
    case "pub":
      stuFrm = piece.Frm
      keys["left-hand"] = true
    case "frb":
      stuFrm = piece.Bss
    }
    for _, frm := range stuFrm {
      switch frm {
      case "scl":
        keys["scale"] = true
      case "arp":
        keys["arpeggio"] = true
      case "in3", "in4", "in5", "in6", "in8":
        keys["interval"] = true
      case "cr5", "cr7":
        keys["chord"] = true
      case "vo2", "vo3":
        keys["polyphony"] = true
      }
    }
  }
  if len(keys) == 0 {
    err := fmt.Sprintf(
      "catalog: piece %v missing study type, expected scl, arp, int, crd, voc, pub",
      piece.ID,
    )
    panic(err)
  }
  unique := make([]string, 0, len(keys))
  for key := range keys {
    unique = append(unique, key)
  }
  return unique
}

func keyByCom(piece catalog.Piece) []string {
  return []string{"composer"}
}

func keyByBss(piece catalog.Piece) []string {
  keys := make(map[string]bool, 3)
  for _, bss := range piece.Bss {
    switch bss {
    case "stb":
      keys["standard-bass"] = true
    case "pub":
      keys["pure-bass"] = true
    case "frb":
      keys["free-bass"] = true
    }
  }
  unique := make([]string, 0, len(keys))
  for key := range keys {
    unique = append(unique, key)
  }
  return unique
}

func keyByLvl(piece catalog.Piece) []string {
  var key string
  switch lvl := piece.Lvl; lvl[:2] {
  case "el":
    key = "elementary-" + lvl[2:]
  default:
    key = lvl
  }
  return []string{key}
}

// func keyByLyr(_ catalog.Piece) []string {
//   return []string{"lyrics"}
// }

func publishCatalog(tpl *template.Template, pc PublishCommand) error {
  fmt.Printf(
    "%v %v\n", style.Org("publish"), style.Lvl(pc.PublicDir + "/catalog/..."),
  )
  pieces, _, catLen, err := catalog.ReadPiecesAndBooks(
    pc.CatalogDir, "", nil, pc.BookFile, nil, false, true,
  )
  if err != nil {
    return err
  }
  pc.Queries["lcs"] = "^cpr" // exclude lcs: cpr pieces
  if len(pc.Queries) > 0 {
    pieces, err = catalog.QueryPieces(pieces, pc.Queries)
    if err != nil {
      return err
    }
  }
  catalog.PrintStat(catLen, len(pieces))
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
  gnrPieces := filterPieces(pieces, func(piece catalog.Piece) bool {
    return piece.Gnr != "stu"
  })
  err = publishGroup(
    tpl, gnrPieces, keyByGnr, keyTit, "genre", catGroups["genre"], pc,
  )
  if err != nil {
    return err
  }
  stuStbPieces := filterPieces(pieces, func(piece catalog.Piece) bool {
    return piece.Gnr == "stu" && slices.ContainsFunc(
      piece.Bss, func(bss string) bool {
        return bss == "stb" || bss == "pub"
      },
    )
  })
  err = publishGroup(
    tpl, stuStbPieces, keyByStu, keyCom, "study-stb", catGroups["study-stb"], pc,
  )
  if err != nil {
    return err
  }
  stuFrbPieces := filterPieces(pieces, func(piece catalog.Piece) bool {
    return piece.Gnr == "stu" && slices.Contains(piece.Bss, "frb")
  })
  err = publishGroup(
    tpl, stuFrbPieces, keyByStu, keyCom, "study-frb", catGroups["study-frb"], pc,
  )
  if err != nil {
    return err
  }
  comPieces := filterPieces(pieces, func(piece catalog.Piece) bool {
    return len(piece.Com) > 0 || len(piece.Arr) > 0
  })
  err = publishGroup(
    tpl, comPieces, keyByCom, keyCom, "composer", catGroups["composer"], pc,
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
  // lyrPieces := filterPieces(pieces, func(piece catalog.Piece) bool {
  //   return piece.Ens == "vc1" || piece.Ens == "vc2"
  // })
  // err = publishGroup(
  //   tpl, lyrPieces, keyByLyr, keyTit, "lyrics", catGroups["lyrics"], pc,
  // )
  // if err != nil {
  //   return err
  // }
  return nil
}
