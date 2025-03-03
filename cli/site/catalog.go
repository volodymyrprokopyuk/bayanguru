package site

import (
	"bytes"
	"fmt"
	"os"
	"path/filepath"
	"slices"
	"strconv"
	"strings"
	"text/template"

	"github.com/volodymyrprokopyuk/bayanguru/cli/catalog"
	"golang.org/x/text/collate"
	"golang.org/x/text/language"
)

type Link struct {
  Tit, URL string
  Disabled bool
}

type Section struct {
  Name string
  Tit string
  Query func(piece catalog.Piece) bool
  Sort func(piece catalog.Piece) string
  Sub []Section
}

func formQuery(form, query []string) bool {
  return slices.ContainsFunc(form, func(frm string) bool {
    return slices.Contains(query, frm)
  })
}

var (
  secOrg = Section{
    Name: "origin", Tit: "Origin | Країна",
    Query: func(piece catalog.Piece) bool {
      return true
    },
    Sort: sortByTit,
    Sub: []Section{
      {
        Name: "ukrainian", Tit: "Ukrainian | Українські",
        Query: func(piece catalog.Piece) bool {
          return piece.Org == "ukr"
        },
      }, {
        Name: "russian", Tit: "Russian | Російські",
        Query: func(piece catalog.Piece) bool {
          return piece.Org == "rus"
        },
      }, {
        Name: "belarusian", Tit: "Belarusian | Білоруські",
        Query: func(piece catalog.Piece) bool {
          return piece.Org == "blr"
        },
      }, {
        Name: "hungarian", Tit: "Hungarian | Угорські",
        Query: func(piece catalog.Piece) bool {
          return piece.Org == "hun"
        },
      }, {
        Name: "extra", Tit: "Extra | Різне",
        Query: func(piece catalog.Piece) bool {
          ext := []string{"mda", "pol", "cze", "svk", "svn", "lva", "est"}
          return slices.Contains(ext, piece.Org)
        },
      }, {
        Name: "european", Tit: "European | Європейські",
        Query: func(piece catalog.Piece) bool {
          eur := []string{"aut", "deu", "dnk", "fra", "swe"}
          return slices.Contains(eur, piece.Org)
        },
      },
    },
  }
  secSty = Section{
    Name: "style", Tit: "Style | Стиль",
    Query: func(piece catalog.Piece) bool {
      return true
    },
    Sort: sortByTit,
    Sub: []Section{
      {
        Name: "folk", Tit: "Folk | Фолькльор",
        Query: func(piece catalog.Piece) bool {
          return piece.Sty == "flk"
        },
      }, {
        Name: "custom", Tit: "Custom | Авторська",
        Query: func(piece catalog.Piece) bool {
          return piece.Sty == "cus"
        },
      }, {
        Name: "classic", Tit: "Classic | Класика",
        Query: func(piece catalog.Piece) bool {
          return piece.Sty == "cls"
        },
      },
    },
  }
  secGnr = Section{
    Name: "genre", Tit: "Genre | Жанр",
    Query: func(piece catalog.Piece) bool {
      return piece.Gnr != "stu"
    },
    Sort: sortByTit,
    Sub: []Section{
      {
        Name: "song", Tit: "Song | Пісня",
        Query: func(piece catalog.Piece) bool {
          sng := []string{
            "sng", "chd", "lul", "ves", "kol", "pry", "rmc", "mil",
          }
          return slices.Contains(sng, piece.Gnr)
        },
      }, {
        Name: "dance", Tit: "Dance | Танець",
        Query: func(piece catalog.Piece) bool {
          dnc := []string{
            "dnc", "plk", "mzr", "qdr", "men", "koz", "gop", "vls", "tng", "mrc",
          }
          return slices.Contains(dnc, piece.Gnr)
        },
      }, {
        Name: "piece", Tit: "Piece | П'єса",
        Query: func(piece catalog.Piece) bool {
          pie := []string{"pie", "inv", "can", "pre", "gyp"}
          return slices.Contains(pie, piece.Gnr)
        },
      },
    },
  }
  secCom = Section{
    Name: "composer", Tit: "Composer | Композитор",
    Query: func(piece catalog.Piece) bool {
      return len(piece.Com) > 0 || len(piece.Arr) > 0
    },
    Sort: sortByCom,
    Sub: []Section{
      {
        Name: "composer", Tit: "Composer | Композитор",
        Query: func(piece catalog.Piece) bool {
          return true
        },
      },
    },
  }
  secStb = Section{
    Name: "study-stb", Tit: "Study | Етюди stb",
    Query: func(piece catalog.Piece) bool {
      bss := []string{"stb", "pub"}
      return piece.Gnr == "stu" && formQuery(piece.Bss, bss)
    },
    Sort: sortByCom,
    Sub: []Section{
      {
        Name: "scale", Tit: "Scale | Гами",
        Query: func(piece catalog.Piece) bool {
          scl := []string{"scl", "seq", "cro"}
          return formQuery(piece.Frm, scl)
        },
      }, {
        Name: "arpeggio", Tit: "Arpeggio | Арпеджіо",
        Query: func(piece catalog.Piece) bool {
          arp := []string{"arp", "lng", "srt", "brk"}
          return formQuery(piece.Frm, arp)
        },
      }, {
        Name: "interval", Tit: "Interval | Інтревали",
        Query: func(piece catalog.Piece) bool {
          inv := []string{"in3", "in4", "in5", "in6", "in7", "in8"}
          return formQuery(piece.Frm, inv)
        },
      }, {
        Name: "chord", Tit: "Chord | Акорди",
        Query: func(piece catalog.Piece) bool {
          crd := []string{"cr5", "cr7"}
          return formQuery(piece.Frm, crd)
        },
      }, {
        Name: "polyphony", Tit: "Polyphony | Поліфонія",
        Query: func(piece catalog.Piece) bool {
          pph := []string{"vo2", "vo3"}
          return formQuery(piece.Frm, pph)
        },
      }, {
        Name: "polyrhythm", Tit: "Polyrhythm | Поліритмія",
        Query: func(piece catalog.Piece) bool {
          prh := []string{"syn", "tu3", "tu5", "tu6"}
          return formQuery(piece.Frm, prh)
        },
      }, {
        Name: "left-hand", Tit: "Left hand | Ліва рука",
        Query: func(piece catalog.Piece) bool {
          return slices.Contains(piece.Bss, "pub")
        },
      },
    },
  }
  secFrb = Section{
    Name: "study-frb", Tit: "Study | Етюди frb",
    Query: func(piece catalog.Piece) bool {
      return piece.Gnr == "stu" && slices.Contains(piece.Bss, "frb")
    },
    Sort: sortByCom,
    Sub: []Section{
      {
        Name: "scale", Tit: "Scale | Гами",
        Query: func(piece catalog.Piece) bool {
          scl := []string{"scl", "seq", "cro"}
          return formQuery(piece.Bss, scl)
        },
      }, {
        Name: "arpeggio", Tit: "Arpeggio | Арпеджіо",
        Query: func(piece catalog.Piece) bool {
          arp := []string{"arp", "lng", "srt", "brk"}
          return formQuery(piece.Bss, arp)
        },
      }, {
        Name: "interval", Tit: "Interval | Інтревали",
        Query: func(piece catalog.Piece) bool {
          inv := []string{"in3", "in4", "in5", "in6", "in7", "in8"}
          return formQuery(piece.Bss, inv)
        },
      }, {
        Name: "chord", Tit: "Chord | Акорди",
        Query: func(piece catalog.Piece) bool {
          crd := []string{"cr5", "cr7"}
          return formQuery(piece.Bss, crd)
        },
      }, {
        Name: "polyphony", Tit: "Polyphony | Поліфонія",
        Query: func(piece catalog.Piece) bool {
          pph := []string{"vo2", "vo3"}
          return formQuery(piece.Bss, pph)
        },
      }, {
        Name: "polyrhythm", Tit: "Polyrhythm | Поліритмія",
        Query: func(piece catalog.Piece) bool {
          prh := []string{"syn", "tu3", "tu5", "tu6"}
          return formQuery(piece.Bss, prh)
        },
      },
    },
  }
  secBss = Section{
    Name: "bass", Tit: "Bass | Бас",
    Query: func(piece catalog.Piece) bool {
      return true
    },
    Sort: sortByTit,
    Sub: []Section{
      {
        Name: "standard-bass", Tit: "Standard bass | Готовий аккорд",
        Query: func(piece catalog.Piece) bool {
          return slices.Contains(piece.Bss, "stb")
        },
      }, {
        Name: "pure-bass", Tit: "Pure bass | Чистий бас",
        Query: func(piece catalog.Piece) bool {
          return slices.Contains(piece.Bss, "pub")
        },
      }, {
        Name: "free-bass", Tit: "Free bass | Виборна система",
        Query: func(piece catalog.Piece) bool {
          return slices.Contains(piece.Bss, "frb")
        },
      },
    },
  }
  secLvl = Section{
    Name: "level", Tit: "Level | Рівень",
    Query: func(piece catalog.Piece) bool {
      return true
    },
    Sort: sortByTit,
    Sub: []Section{
      {
        Name: "elementary-a", Tit: "Elementary | Простий A",
        Query: func(piece catalog.Piece) bool {
          return piece.Lvl == "ela"
        },
      }, {
        Name: "elementary-b", Tit: "Elementary | Простий B",
        Query: func(piece catalog.Piece) bool {
          return piece.Lvl == "elb"
        },
      }, {
        Name: "elementary-c", Tit: "Elementary | Простий C",
        Query: func(piece catalog.Piece) bool {
          return piece.Lvl == "elc"
        },
      },
    },
  }
  secLyr = Section{
    Name: "lyrics", Tit: "Lyrics | Пісні",
    Query: func(piece catalog.Piece) bool {
      return piece.Lyr == "lyr"
    },
    Sort: sortByTit,
    Sub: []Section{
      {
        Name: "lyrics", Tit: "Lyrics | Пісні",
        Query: func(piece catalog.Piece) bool {
          return true
        },
      },
    },
  }
  sections2 = []Section{
    secOrg, secSty, secGnr, secCom, secStb, secFrb, secBss, secLvl, secLyr,
  }
)

var sections = map[string][]string{
  "origin": {
    "ukrainian", "russian", "belarusian", "hungarian", "extra", "european",
  },
  "style": {
    "folk", "custom", "classic",
  },
  "genre": {
    "song", "dance", "piece",
  },
  "study-stb": {
    "scale", "arpeggio", "interval", "chord", "polyphony", "left-hand",
  },
  "study-frb": {
    "scale", "arpeggio", "interval", "chord", //"polyphony",
  },
  "composer": {
    "composer",
  },
  "bass": {
    "standard-bass", "pure-bass", "free-bass",
  },
  "level": {
    "elementary-a", "elementary-b", "elementary-c",
  },
  "lyrics": {
    "lyrics",
  },
}

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
  "lyrics": "Lyrics | Пісні",
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

// var collator = collate.New(language.Und)

func sortGroups(groups PieceGroups, sortKey func(piece catalog.Piece) string) {
  for _, pieces := range groups {
    slices.SortStableFunc(pieces, func(a, b catalog.Piece) int {
      return collator.CompareString(sortKey(a), sortKey(b))
    })
  }
}

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

func makeGroupLinksMap(
  groupNames []string, groupURL string,
) map[string][]Link {
  glMap := make(map[string][]Link, len(groupNames))
  for _, currentGroup := range groupNames {
    links := make([]Link, 0, len(groupNames))
    for _, groupName := range groupNames {
      link := Link{
        URL: filepath.Join(groupURL, groupName, "1"),
        Tit: tr[groupName],
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
          Tit: alpha, URL: filepath.Join(groupURL, key + "#" + alpha),
        }
      } else {
        link = Link{Tit: alpha, Disabled: true}
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
      Tit: strPage,
      URL: filepath.Join(groupURL, currentGroup, strPage),
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
    err := publishFile(os.Stdout, tpl, catalogDir, currentPage, catalogData)
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
  group string, groupNames []string, pc publishCommand,
) error {
  groupDir := filepath.Join(pc.publicDir, "catalog", group)
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
  groupPages := pageGroups(groups, pc.pageSize)
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
  case "mda", "pol", "cze", "svk", "svn", "lva", "est":
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
  case "sng", "chd", "lul", "ves", "kol", "pry", "rmc", "mil":
    key = "song"
  case "dnc", "plk", "mzr", "qdr", "men", "koz", "gop", "vls", "tng", "mrc":
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
      case "in3", "in4", "in5", "in6", "in7", "in8":
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

func keyByLyr(_ catalog.Piece) []string {
  return []string{"lyrics"}
}

///////////////////////////////////////////////

func queryPieces(
  pieces []catalog.Piece, query func(piece catalog.Piece) bool,
) []catalog.Piece {
  selected := make([]catalog.Piece, 0, len(pieces))
  for _, piece := range pieces {
    if query(piece) {
      selected = append(selected, piece)
    }
  }
  return selected
}

var collator = collate.New(language.Und)

func makeAlphabet() []string {
  var alphabet = strings.Split("АБВГҐДЕЄЖЗИІЇЙКЛМНОПРСТУФХЦЧШЩЭЮЯ", "")
  slices.SortStableFunc(alphabet, func(a, b string) int {
    return collator.CompareString(a, b)
  })
  return alphabet
}

var alphabet = makeAlphabet()

func sortByTit(piece catalog.Piece) string {
  if piece.Gnr == "stu" {
    return sortByCom(piece) // Sort studies by composer, then by title
  }
  return piece.Tit + sortByCom(piece) // Sort by composer for the same title
}

func sortByCom(piece catalog.Piece) string {
  var sortKey string
  if len(piece.Com) > 3 {
    sortKey = string([]rune(piece.Com)[3:]) // Remove composer initials
  }
  if len(piece.Arr) > 3 {
    sortKey = string([]rune(piece.Arr)[3:]) // Remove arranger initials
  }
  return sortKey + piece.Tit // Sort by title for the same composer
}

func sortPieces(
  pieces []catalog.Piece, sortKey func(piece catalog.Piece) string,
) {
  slices.SortStableFunc(pieces, func(a, b catalog.Piece) int {
    return collator.CompareString(sortKey(a), sortKey(b))
  })
}

func alphaLinkPieces(
  pieces []catalog.Piece, sortKey func(piece catalog.Piece) string,
) {
  i := 0
  for _, alpha := range alphabet {
    for j := i; j < len(pieces); j++ {
      key := sortKey(pieces[j])
      if collator.CompareString(string([]rune(key)[0:1]), alpha) == 0 {
        pieces[j].AlphaLink = alpha
        i = j + 1
        break
      }
    }
  }
}

func publicSection(
  tpl *template.Template, pieces []catalog.Piece, sec Section, pc publishCommand,
) error {
  pieces = queryPieces(pieces, sec.Query)
  for _, sub := range sec.Sub {
    spieces := queryPieces(pieces, sub.Query)
    if len(spieces) == 0 {
      fmt.Printf(
        "%s %s\n", catalog.YellowSub("warning"),
        catalog.RedSub("%s %s has no pieces", sec.Name, sub.Name))
    }
    sortPieces(spieces, sec.Sort)
    alphaLinkPieces(spieces, sec.Sort)
    if sec.Name == "origin" && sub.Name == "belarusian" {
      for _, piece := range spieces {
        fmt.Println(sec.Sort(piece), piece.AlphaLink)
      }
    }
  }
  return nil
}

func publishRobots(pc publishCommand) error {
  file := "robots.txt"
  src := filepath.Join(pc.siteDir, file)
  dst := filepath.Join(pc.publicDir, file)
  fmt.Printf("%v %v\n", catalog.GreenSub("publish"), catalog.BlueSub(dst))
  _, err := copyFile(src, dst)
  return err
}

func publishSitemap(pieces []catalog.Piece, pc publishCommand) error {
  file := "sitemap.txt"
  path := filepath.Join(pc.publicDir, file)
  fmt.Printf("%v %v\n", catalog.GreenSub("publish"), catalog.BlueSub(path))
  slices.SortStableFunc(pieces, func(a, b catalog.Piece) int {
    return collator.CompareString(a.Tit, b.Tit)
  })
  var buf bytes.Buffer
  for _, piece := range pieces {
    pieceURL := fmt.Sprintf("%v/%v\n", pc.pieceURL, piece.File)
    buf.WriteString(pieceURL)
  }
  return os.WriteFile(path, buf.Bytes(), 0644)
}

func publishCatalog(pc publishCommand) error {
  fmt.Printf(
    "%s %s\n", catalog.BlueTit("publish"),
    catalog.BlueSub(pc.publicDir + "/catalog/..."),
  )
  bc := catalog.BaseCmd{CatalogDir: pc.CatalogDir}
  pieces, _, _, err := catalog.ReadPiecesAndBooks(bc)
  if err != nil {
    return err
  }
  queries := make(map[string]string, 1)
  queries["lcs"] = "^cpr"  // Exclude copyrighted pieces from publishing
  pieces, err = catalog.QueryPieces(pieces, queries)
  if err != nil {
    return err
  }
  tpl, err := makeTemplate(pc.templateDir, "catalog.html")
  if err != nil {
    return err
  }

  for _, sec := range sections2 {
    err := publicSection(tpl, pieces, sec, pc)
    if err != nil {
      return err
    }
  }


  // err = publishGroup(
  //   tpl, pieces, keyByOrg, keyTit, "origin", sections["origin"], pc,
  // )
  // if err != nil {
  //   return err
  // }
  // err = publishGroup(
  //   tpl, pieces, keyBySty, keyTit, "style", sections["style"], pc,
  // )
  // if err != nil {
  //   return err
  // }
  // gnrPieces := filterPieces(pieces, func(piece catalog.Piece) bool {
  //   return piece.Gnr != "stu"
  // })
  // err = publishGroup(
  //   tpl, gnrPieces, keyByGnr, keyTit, "genre", sections["genre"], pc,
  // )
  // if err != nil {
  //   return err
  // }
  // stuStbPieces := filterPieces(pieces, func(piece catalog.Piece) bool {
  //   return piece.Gnr == "stu" && slices.ContainsFunc(
  //     piece.Bss, func(bss string) bool {
  //       return bss == "stb" || bss == "pub"
  //     },
  //   )
  // })
  // err = publishGroup(
  //   tpl, stuStbPieces, keyByStu, keyCom, "study-stb", sections["study-stb"], pc,
  // )
  // if err != nil {
  //   return err
  // }
  // stuFrbPieces := filterPieces(pieces, func(piece catalog.Piece) bool {
  //   return piece.Gnr == "stu" && slices.Contains(piece.Bss, "frb")
  // })
  // err = publishGroup(
  //   tpl, stuFrbPieces, keyByStu, keyCom, "study-frb", sections["study-frb"], pc,
  // )
  // if err != nil {
  //   return err
  // }
  // comPieces := filterPieces(pieces, func(piece catalog.Piece) bool {
  //   return len(piece.Com) > 0 || len(piece.Arr) > 0
  // })
  // err = publishGroup(
  //   tpl, comPieces, keyByCom, keyCom, "composer", sections["composer"], pc,
  // )
  // if err != nil {
  //   return err
  // }
  // err = publishGroup(
  //   tpl, pieces, keyByBss, keyTit, "bass", sections["bass"], pc,
  // )
  // if err != nil {
  //   return err
  // }
  // err = publishGroup(
  //   tpl, pieces, keyByLvl, keyTit, "level", sections["level"], pc,
  // )
  // if err != nil {
  //   return err
  // }
  // lyrPieces := filterPieces(pieces, func(piece catalog.Piece) bool {
  //   return piece.Ens == "vc1" || piece.Ens == "vc2" || piece.Lyr == "lyr"
  // })
  // err = publishGroup(
  //   tpl, lyrPieces, keyByLyr, keyTit, "lyrics", sections["lyrics"], pc,
  // )
  // if err != nil {
  //   return err
  // }


  // err = publishRobots(pc)
  // if err != nil {
  //   return err
  // }
  // err = publishSitemap(pieces, pc)
  // if err != nil {
  //   return err
  // }
  return nil
}
