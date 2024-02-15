package site

import (
  "fmt"
  "strings"
  "text/template"
  "path/filepath"
  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
)

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

type Link struct{
  Link, Title string
}

type CatalogData struct {
  GroupLinks []Link // constant
  Title string
  AlphaLinks []Link // constant
  Pieces []cat.Piece
  PageLinks []Link
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
  piecesByOrg := groupPieces(pieces, keyByOrg)
  piecesByOrg = pageGroups(piecesByOrg, pc.PageSize)
  // for k, v := range piecesByOrg {
  //   fmt.Println(k, len(v))
  // }
  for key, pieces := range piecesByOrg {
    slc := strings.Split(key, "/")
    org, catalogFile := slc[0], slc[1]
    catalogDir := filepath.Join(pc.PublicDir, "catalog", "origin", org)
    catalogData := CatalogData{nil, pieces}
    err := publishFile(tpl, catalogDir, catalogFile, catalogData)
    if err != nil {
      return err
    }
  }
  return nil
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
