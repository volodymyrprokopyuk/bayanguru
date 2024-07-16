package catalog

import (
	"fmt"
	"math/rand"
	"os"
	"os/exec"
	"path/filepath"
	"regexp"
	"strings"

	sty "github.com/volodymyrprokopyuk/bayanguru/internal/style"
)

type PieceQueries map[string]string

type PlayCommand struct {
  CatalogDir, BookFile, PieceDir, BookDir string
  Catalog string
  All, Book bool
  Random, List bool
  Pieces, Books []string
  Queries PieceQueries
}

var cleanTit = regexp.MustCompile(`[^- \pL\d]+`)

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

func arrangePieces(pieceLen int, random bool) []int {
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
  bookFile string, cmdBookIDs []string, book, all bool,
) ([]Piece, []Book, int, error) {
  pieceMap, pieceIDs, err := readPieces(catDir, catQuery)
  if err != nil {
    return nil, nil, 0, err
  }
  // read books
  if book {
    books, err := readBooks(catDir, bookFile, cmdBookIDs, all, pieceMap)
    if err != nil {
      return nil, nil, 0, err
    }
    pieces := make([]Piece, 0, 1000)
    for _, book := range books {
      pieces = append(pieces, book.Pieces...)
    }
    return pieces, books, len(pieceMap), nil
  }
  // read pieces
  if !all {
    pieceIDs = cmdPieceIDs
  }
  pieces := make([]Piece, 0, len(pieceIDs))
  for _, pieceID := range pieceIDs {
    if piece, exists := pieceMap[pieceID]; exists {
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
    pc.CatalogDir, pc.Catalog, pc.Pieces,
    pc.BookFile, pc.Books, pc.Book, pc.All,
  )
  if err != nil {
    return catError("%v", err)
  }
  if len(pc.Queries) > 0 {
    pieces, err = QueryPieces(pieces, pc.Queries)
    if err != nil {
      return catError("%v", err)
    }
  }
  PrintStat(catLen, len(pieces))
  indices := arrangePieces(len(pieces), pc.Random)
  for _, i := range indices {
    piece := pieces[i]
    PrintPiece(os.Stdout, piece)
    if !pc.List {
      err := openPiece(pc.PieceDir, piece)
      if err != nil {
        return catError("%v", err)
      }
    }
  }
  return nil
}
