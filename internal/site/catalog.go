package site

import (
  "fmt"
  "text/template"
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

func keyByOrg(piece cat.Piece) string {
  org := piece.Org
  switch org {
  case "pol", "cze", "svk", "lva", "mda":
    org = "ext"
  case "aut", "deu", "dnk", "fra", "swe":
    org = "eur"
  }
  return org
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

func generateCatalog(tpl *template.Template, pc PublishCommand) error {
  pieces, _, catLen, err := cat.ReadPiecesAndBooks(
    pc.CatalogDir, "", nil, pc.BookFile, nil, false, true,
  )
  // pieces, _, catLen, err := cat.ReadPiecesAndBooks(
  //   pc.CatalogDir, pc.Catalog, pc.Pieces,
  //   pc.BookFile, pc.Books, pc.Book, pc.All,
  // )
  if err != nil {
    return err
  }
  cat.PrintStat(catLen, len(pieces))
  piecesByOrg := groupPieces(pieces, keyByOrg)
  for k, v := range piecesByOrg {
    fmt.Println(k, len(v))
  }
  piecesByOrg = pageGroups(piecesByOrg, pc.PageSize)
  for k, v := range piecesByOrg {
    fmt.Println(k, len(v))
  }
  // piecesBySty := groupPieces(pieces, keyBySty)
  // piecesByGnr := groupPieces(pieces, keyByGnr)
  // piecesByCom := groupPieces(pieces, keyByCom)
  // piecesByBss := groupPieces(pieces, keyByBss)
  // piecesByLvl := groupPieces(pieces, keyByLvl)
  return nil
}
