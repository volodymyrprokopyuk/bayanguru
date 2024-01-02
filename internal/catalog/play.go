package catalog

import (
  "fmt"
  "strings"
  "math/rand"
  "time"
  sty "github.com/volodymyrprokopyuk/bayan/internal/style"
)

type PieceQueries map[string]string

type PlayCommand struct {
  Catalog string
  Book, Cycle, Random, List, All bool
  Pieces, Books []string
  Queries PieceQueries
}

func printPiece(piece Piece) {
  bassType := func(bss []string) string {
    for _, b := range bss {
      switch b {
      case "stb", "pub", "frb": return b
      default: return "unk"
      }
    }
    return "unk"
  }
  tit := piece.Tit
  com := fmt.Sprintf("%v %v %v", piece.Com, piece.Art, piece.Arr)
  com = strings.TrimSpace(com)
  titLen, comLen := len([]rune(tit)), len([]rune(com))
  maxTit := 53 - comLen
  if titLen > maxTit {
    tit = fmt.Sprintf("%v…", string([]rune(tit)[:maxTit - 1]))
    titLen = maxTit
  }
  spaceLen := 53 - titLen - comLen
  fmt.Printf(
    "%v %v %v %v %v %v %v %v %v\n",
    sty.ID(piece.ID), sty.Tit(tit),
    strings.Repeat(" ", spaceLen), sty.Com(com),
    sty.Org(piece.Org), sty.Org(piece.Sty), sty.Org(piece.Gnr),
    sty.Bss(bassType(piece.Bss)), sty.Lvl(piece.Lvl),
  )
}

func printStat(catalog, selected int) {
  fmt.Printf(
    "%v %v\n%v %v\n",
    sty.Bss("%10v", "Catalog"), sty.Lvl("%4v", catalog),
    sty.Bss("%10v", "Selected"), sty.Lvl("%4v", selected),
  )
}

func makeRange(a, b int) []int {
  slc := make([]int, b - a)
  for i := range slc {
    slc[i] = a + i
  }
  return slc
}

func orderPieces(pieceLen int, random bool) []int {
  idx := makeRange(0, pieceLen)
  if random {
    rand.Seed(time.Now().UnixNano())
    rand.Shuffle(pieceLen, func (i, j int) { idx[i], idx[j] = idx[j], idx[i] })
  }
  return idx
}

func catError(format string, vals ...any) error {
  return fmt.Errorf("catalog: " + format, vals...)
}

func Play(pc PlayCommand) error {
  pieceMap, pieceIDs, err := readPieces("catalog", pc.Catalog)
  if err != nil {
    return catError("%v", err)
  }
  pieces := make([]Piece, 0, 1000)
  if pc.Book { // play books
    books, err := readBooks("meta", "books2.yaml", pc.Books, pc.All, pieceMap)
    if err != nil {
      return catError("%v", err)
    }
    for _, book := range books {
      for _, piece := range book.Pieces {
        pieces = append(pieces, piece)
      }
    }
  } else { // play pieces
    if !pc.All {
      pieceIDs = pc.Pieces
    }
    for _, pieceID := range pieceIDs {
      if piece, ok := pieceMap[pieceID]; ok {
        pieces = append(pieces, piece)
      } else {
        return catError("piece %v not in catalog", pieceID)
      }
    }
  }
  if len(pc.Queries) > 0 {
    pieces, err = queryPieces(pieces, pc.Queries)
    if err != nil {
      return catError("%v", err)
    }
  }
  printStat(len(pieceMap), len(pieces))
  indices := orderPieces(len(pieces), pc.Random)
  for _, i := range indices {
    piece := pieces[i]
    printPiece(piece)
    // if ! pc.List {
    //   openPiece(piece)
    // }
  }
  return nil
}
