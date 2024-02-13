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

func keyBss(bss []string, ID string) string {
  b := cat.Bss(bss, ID)
  if b == "pub" {
    b = "stb"
  }
  return b
}

func keyByOrg(piece cat.Piece) string {
  org := piece.Org
  switch org {
  case "blr", "hun", "pol", "cze", "svk", "lva", "mda":
    org = "ext"
  case "aut", "deu", "dnk", "fra", "swe":
    org = "eur"
  }
  bss := keyBss(piece.Bss, piece.ID)
  return fmt.Sprintf("%v-%v", org, bss)
}

func keyBySty(piece cat.Piece) string {
  sty := piece.Sty
  bss := keyBss(piece.Bss, piece.ID)
  return fmt.Sprintf("%v-%v", sty, bss)
}

func keyByGnr(piece cat.Piece) string {
  gnr := piece.Gnr
  if gnr == "stu" {
    bss := cat.Bss(piece.Bss, piece.ID)
    if bss == "stb" {
      stu := cat.Stu(piece.Frm, piece.ID)
      return fmt.Sprintf("%v-%v-%v", gnr, bss, stu)
    } else if bss == "pub" {
      return fmt.Sprintf("%v-%v-%v", gnr, "stb", bss)
    } else {
      stu := cat.Stu(piece.Bss, piece.ID)
      return fmt.Sprintf("%v-%v-%v", gnr, bss, stu)
    }
  }
  switch gnr {
  case "chd", "lul", "mil", "pry", "rmc", "ves":
    gnr = "sng"
  case "gop", "koz", "mrc", "plk", "tng", "vls":
    gnr = "dnc"
  case "gyp":
    gnr = "pie"
  }
  bss := keyBss(piece.Bss, piece.ID)
  return fmt.Sprintf("%v-%v", gnr, bss)
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
  // piecesByOrg := groupPieces(pieces, keyByOrg)
  // piecesBySty := groupPieces(pieces, keyBySty)
  piecesByGnr := groupPieces(pieces, keyByGnr)
  for k, v := range piecesByGnr {
    fmt.Println(k, len(v))
  }
  return nil
}
