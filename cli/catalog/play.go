package catalog

import (
	"bufio"
	"fmt"
	"math/rand"
	"os"
	"os/exec"
	"path/filepath"
)

type playCmd struct {
  catalogDir, bookFile, pieceDir, bookDir, catalog string
  all, book, random, list bool
  pieces, books []string
  queries map[string]string
}

func PrintStat(catalog, selected int) {
  fmt.Printf(
    "%v %v\n%v %v\n",
    RedSub("%10v", "Catalog"), BlueTit("%4v", catalog),
    RedSub("%10v", "Selected"), BlueTit("%4v", selected),
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

func addToPlayed(pieceID string, fileName string) error {
  file, err := os.OpenFile(
    fileName, os.O_CREATE | os.O_WRONLY | os.O_APPEND, 0644,
  )
  if err != nil {
    return err
  }
  defer file.Close()
  _, err = file.WriteString(pieceID + "\n")
  return err
}

func filterPlayed(allPieces []Piece, fileName string) ([]Piece, error) {
  file, err := os.OpenFile(fileName, os.O_CREATE | os.O_RDONLY, 0644)
  if err != nil {
    return nil, err
  }
  defer file.Close()
  played := make(map[string]bool, 100)
  scanner := bufio.NewScanner(file)
  for scanner.Scan() {
    pieceID := scanner.Text()
    played[pieceID] = true
  }
  pieces := make([]Piece, 0, len(allPieces))
  for _, piece := range allPieces {
    if !played[piece.ID] {
      pieces = append(pieces, piece)
    }
  }
  return pieces, nil
}

func catError(format string, args ...any) error {
  return fmt.Errorf("catalog: " + format, args...)
}

func Play(pc playCmd) error {
  pieces, _, catLen, err := ReadPiecesAndBooks(
    pc.catalogDir, pc.catalog, pc.pieces,
    pc.bookFile, pc.books, pc.book, pc.all,
  )
  if err != nil {
    return catError("%v", err)
  }
  if len(pc.queries) > 0 {
    pieces, err = QueryPieces(pieces, pc.queries)
    if err != nil {
      return catError("%v", err)
    }
  }
  played := ".played"
  pieces, err = filterPlayed(pieces, played)
  if err != nil {
    return catError("%v", err)
  }
  PrintStat(catLen, len(pieces))
  indices := arrangePieces(len(pieces), pc.random)
  for _, i := range indices {
    piece := pieces[i]
    PrintPiece(os.Stdout, piece)
    if !pc.list {
      err := openPiece(pc.pieceDir, piece)
      if err != nil {
        return catError("%v", err)
      }
      err = addToPlayed(piece.ID, played)
      if err != nil {
        return catError("%v", err)
      }
    }
  }
  return nil
}
