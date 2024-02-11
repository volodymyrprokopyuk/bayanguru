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

func keyByOrg(piece cat.Piece) string {
  org := piece.Org
  switch org {
  case "rou":
    org = "mda"
  case "cze", "svk", "lva":
    org = "pol"
  case "aut", "deu", "dnk", "fra", "swe":
    org = "eur"
  }
  bss := cat.Bass(piece.Bss)
  if bss == "pub" {
    bss = "stb"
  }
  return fmt.Sprintf("%v-%v", org, bss)
}

func generateCatalog(tpl *template.Template, pc PublishCommand) error {
  // pieces, _, catLen, err := cat.ReadPiecesAndBooks(
  //   pc.CatalogDir, "", nil, pc.BookFile, nil, false, true,
  // )
  pieces, _, catLen, err := cat.ReadPiecesAndBooks(
    pc.CatalogDir, pc.Catalog, pc.Pieces,
    pc.BookFile, pc.Books, pc.Book, pc.All,
  )
  if err != nil {
    return err
  }
  cat.PrintStat(catLen, len(pieces))
  piecesByOrg := groupPieces(pieces, keyByOrg)
  for k, v := range piecesByOrg {
    fmt.Println(k, len(v))
  }
  return nil
}
