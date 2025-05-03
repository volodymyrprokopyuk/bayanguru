package site

import (
	"bytes"
	"fmt"
	"os"
	"path/filepath"
	"slices"
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
    Sort: catalog.SortByTit,
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
    Sort: catalog.SortByTit,
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
    Sort: catalog.SortByTit,
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
    Sort: catalog.SortByCom,
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
    Sort: catalog.SortByCom,
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
    Sort: catalog.SortByCom,
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
      }, /*{
        Name: "polyphony", Tit: "Polyphony | Поліфонія",
        Query: func(piece catalog.Piece) bool {
          pph := []string{"vo2", "vo3"}
          return formQuery(piece.Bss, pph)
        },
      },*/ /*{
        Name: "polyrhythm", Tit: "Polyrhythm | Поліритмія",
        Query: func(piece catalog.Piece) bool {
          prh := []string{"syn", "tu3", "tu5", "tu6"}
          return formQuery(piece.Bss, prh)
        },
      },*/
    },
  }
  secBss = Section{
    Name: "bass", Tit: "Bass | Бас",
    Query: func(piece catalog.Piece) bool {
      return true
    },
    Sort: catalog.SortByTit,
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
    Sort: catalog.SortByTit,
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
      return len(piece.LyricsFile) > 0
    },
    Sort: catalog.SortByTit,
    Sub: []Section{
      {
        Name: "lyrics", Tit: "Lyrics | Пісні",
        Query: func(piece catalog.Piece) bool {
          return true
        },
      },
    },
  }
  sections = []Section{
    secOrg, secSty, secGnr, secCom, secStb, secFrb, secBss, secLvl, secLyr,
  }
)

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

var alphabet = func() []string {
  var alphabet = strings.Split("АБВГҐДЕЄЖЗИІЇЙКЛМНОПРСТУФХЦЧШЩЭЮЯ", "")
  slices.SortStableFunc(alphabet, func(a, b string) int {
    return collator.CompareString(a, b)
  })
  return alphabet
}()

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

func pagePieces(pieces []catalog.Piece, pageSize int) [][]catalog.Piece {
  pages := make([][]catalog.Piece, 0, 20)
  page := make([]catalog.Piece, 0, pageSize)
  for i, piece := range pieces {
    if i % pageSize == 0 && i != 0 {
      pages = append(pages, page)
      page = make([]catalog.Piece, 0, pageSize)
    }
    page = append(page, piece)
  }
  if len(page) > 0 {
    pages = append(pages, page)
  }
  return pages
}

func catalogSectionLinks(sec, cur Section) []Link {
  links := make([]Link, len(sec.Sub))
  for i, sub := range sec.Sub {
    url := filepath.Join("/catalog", sec.Name, sub.Name, "1")
    links[i] = Link{Tit: sub.Tit, URL: url, Disabled: sub.Name == cur.Name}
  }
  return links
}

func catalogAlphaLinks(sec, sub Section, pages [][]catalog.Piece) []Link {
  alphaLink := make(map[string]Link, len(alphabet))
  for pageNum, page := range pages {
    for _, piece := range page {
      key := sec.Sort(piece)
      alpha := string([]rune(key)[0:1])
      _, exists := alphaLink[alpha]
      if !exists {
        frag := fmt.Sprintf("%d#%s", pageNum + 1, alpha)
        url := filepath.Join("/catalog", sec.Name, sub.Name, frag)
        alphaLink[alpha] = Link{Tit: alpha, URL: url}
      }
    }
  }
  links := make([]Link, len(alphabet))
  for i, alpha := range alphabet {
    link, exists := alphaLink[alpha]
    if !exists {
      links[i] = Link{Tit: alpha, Disabled: true}
    } else {
      links[i] = link
    }
  }
  return links
}

func catalogPageLinks(sec, sub Section, curPage, pageTot, n int) []Link {
  l, r := curPage - n / 2, curPage + n / 2
  for l < 1 {
    l++
    if r < pageTot {
      r++
    }
  }
  for r > pageTot {
    r--
    if l > 1 {
      l--
    }
  }
  links := make([]Link, 0, n)
  for i := l; i <= r; i++ {
    pageNum := fmt.Sprintf("%d", i)
    url := filepath.Join("/catalog", sec.Name, sub.Name, pageNum)
    link := Link{Tit: pageNum, URL: url, Disabled: i == curPage}
    links = append(links, link)
  }
  if len(links) == 1 {
    return nil
  }
  return links
}

func publishSubsec(
  tpl *template.Template, sec Section, sub Section,
  pages [][]catalog.Piece, pc publishCommand,
) error {
  catalogDir := filepath.Join(pc.publicDir, "catalog", sec.Name, sub.Name)
  sectionLinks := catalogSectionLinks(sec, sub)
  alphaLinks := catalogAlphaLinks(sec, sub, pages)
  for i, pieces := range pages {
    pageNum := i + 1
    pageFile := fmt.Sprintf("%d", pageNum)
    pageLinks := catalogPageLinks(sec, sub, pageNum, len(pages), 5)
    catalogData := struct {
      Tit string
      SectionLinks []Link
      AlphaLinks []Link
      Pieces []catalog.Piece
      PageLinks []Link
    }{
      Tit: sub.Tit,
      SectionLinks: sectionLinks,
      AlphaLinks: alphaLinks,
      Pieces: pieces,
      PageLinks: pageLinks,
    }
    err := publishFile(os.Stdout, tpl, catalogDir, pageFile, catalogData)
    if err != nil {
      return err
    }
  }
  return nil
}

func publishSection(
  tpl *template.Template, pieces []catalog.Piece, sec Section, pc publishCommand,
) error {
  pieces = queryPieces(pieces, sec.Query)
  for _, sub := range sec.Sub {
    spieces := queryPieces(pieces, sub.Query)
    if len(spieces) == 0 {
      return fmt.Errorf("%s %s has no pieces", sec.Name, sub.Name)
    }
    catalog.SortPieces(spieces, sec.Sort)
    alphaLinkPieces(spieces, sec.Sort)
    pages := pagePieces(spieces, pc.pageSize)
    err := publishSubsec(tpl, sec, sub, pages, pc)
    if err != nil {
      return err
    }
  }
  return nil
}

func publishRobots(pc publishCommand) error {
  file := "robots.txt"
  src := filepath.Join(pc.siteDir, file)
  dst := filepath.Join(pc.publicDir, file)
  fmt.Printf("%s %s\n", catalog.BlueTit("publish"), catalog.BlueSub(dst))
  _, err := copyFile(src, dst)
  return err
}

func publishSitemap(pieces []catalog.Piece, pc publishCommand) error {
  file := "sitemap.txt"
  path := filepath.Join(pc.publicDir, file)
  fmt.Printf("%s %s\n", catalog.BlueTit("publish"), catalog.BlueSub(path))
  catalog.SortPieces(pieces, catalog.SortByTit)
  var buf bytes.Buffer
  for _, piece := range pieces {
    pieceURL := fmt.Sprintf("%s/%s\n", pc.pieceURL, piece.File)
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
  for _, sec := range sections {
    err := publishSection(tpl, pieces, sec, pc)
    if err != nil {
      return err
    }
  }
  err = publishRobots(pc)
  if err != nil {
    return err
  }
  err = publishSitemap(pieces, pc)
  if err != nil {
    return err
  }
  return nil
}
