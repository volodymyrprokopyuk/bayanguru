package catalog

import (
  "fmt"
  "strings"
  "regexp"
  "math/rand"
  "path/filepath"
  "os/exec"
  sty "github.com/volodymyrprokopyuk/bayan/internal/style"
)

type PieceQueries map[string]string

type PlayCommand struct {
  Catalog string
  All, Book bool
  Random, List bool
  Pieces, Books []string
  Queries PieceQueries
}

var cleanTit = regexp.MustCompile(`[',\.!\?]`)

func scoreFile(tit, ID string) string {
  tit = strings.ReplaceAll(cleanTit.ReplaceAllLiteralString(tit, ""), " ", "-")
  return fmt.Sprintf("%v-%v", tit, ID)
}

func PrintStat(catalog, selected int) {
  fmt.Printf(
    "%v %v\n%v %v\n",
    sty.Bss("%10v", "Catalog"), sty.Lvl("%4v", catalog),
    sty.Bss("%10v", "Selected"), sty.Lvl("%4v", selected),
  )
}

func makeRange(start, end int) []int {
  slc := make([]int, end - start)
  for i := range slc {
    slc[i] = start + i
  }
  return slc
}

func orderPieces(pieceLen int, random bool) []int {
  idx := makeRange(0, pieceLen)
  if random {
    rand.Shuffle(pieceLen, func (i, j int) { idx[i], idx[j] = idx[j], idx[i] })
  }
  return idx
}

func openPiece(pieceDir string, piece Piece) error {
  piecePDF := filepath.Join(pieceDir, piece.File + ".pdf")
  return exec.Command("xdg-open", piecePDF).Run()
}

func ReadPiecesAndBooks(
  catDir, catQuery string, cmdPieceIDs []string,
  bookDir, bookFile string, cmdBookIDs []string, book, all bool,
) ([]Piece, []Book, int, error) {
  pieceMap, pieceIDs, err := readPieces(catDir, catQuery)
  if err != nil {
    return nil, nil, 0, err
  }
  // read books
  if book {
    books, err := readBooks(bookDir, bookFile, cmdBookIDs, all, pieceMap)
    if err != nil {
      return nil, nil, 0, err
    }
    pieces := make([]Piece, 0, 1000)
    for _, book := range books {
      for _, piece := range book.Pieces {
        pieces = append(pieces, piece)
      }
    }
    return pieces, books, len(pieceMap), nil
  }
  // read pieces
  if !all {
    pieceIDs = cmdPieceIDs
  }
  pieces := make([]Piece, 0, len(pieceIDs))
  for _, pieceID := range pieceIDs {
    if piece, ok := pieceMap[pieceID]; ok {
      pieces = append(pieces, piece)
    } else {
      return nil, nil, 0, fmt.Errorf("piece %v not in catalog", pieceID)
    }
  }
  return pieces, nil, len(pieceMap), nil
}

func catError(format string, args ...any) error {
  return fmt.Errorf("catalog: " + format, args...)
}

func Play(pc PlayCommand) error {
  pieces, _, catLen, err := ReadPiecesAndBooks(
    "catalog", pc.Catalog, pc.Pieces,
    "meta", "books2.yaml", pc.Books, pc.Book, pc.All,
  )
  if err != nil {
    return catError("%v", err)
  }
  if len(pc.Queries) > 0 {
    pieces, err = queryPieces(pieces, pc.Queries)
    if err != nil {
      return catError("%v", err)
    }
  }
  PrintStat(catLen, len(pieces))
  indices := orderPieces(len(pieces), pc.Random)
  for _, i := range indices {
    piece := pieces[i]
    PrintPiece(piece)
    if ! pc.List {
      err := openPiece("pieces", piece)
      if err != nil {
        return catError("%v", err)
      }
    }
  }
  return nil
}
