package site

import (
  "fmt"
  "strings"
  "text/template"
  "sort"
  "path/filepath"
  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
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

func sortGroups(groups PieceGroups) {
  keyTitStuCom := func(piece cat.Piece) string {
    if piece.Gnr == "stu" {
      com := []rune(piece.Com)
      if len(com) > 3 {
        return string(com[3:])
      }
    }
    return piece.Tit
  }
  for _, pieces := range groups {
    sort.Slice(pieces, func(i, j int) bool {
      return keyTitStuCom(pieces[i]) < keyTitStuCom(pieces[j])
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

func publishGroups(
  tpl *template.Template, groups PieceGroups, groupNames []string,
  groupDir, groupURL string,
) error {
  for key, pieces := range groups {
    slc := strings.Split(key, "/")
    currentGroup, catalogFile := slc[0], slc[1]
    catalogDir := filepath.Join(groupDir, currentGroup)
    groupLinks := make([]Link, 0, len(groups))
    for _, groupName := range groupNames {
      link := Link{
        URL: filepath.Join(groupURL, groupName, "1"),
        Title: tr[groupName],
        Disabled: groupName == currentGroup,
      }
      groupLinks = append(groupLinks, link)
    }
    catalogData := CatalogData{
      GroupLinks: groupLinks,
      Title: tr[currentGroup],
      AlphaLinks: nil,
      Pieces: pieces,
      PageLinks: nil,
    }
    err := publishFile(tpl, catalogDir, catalogFile, catalogData)
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
