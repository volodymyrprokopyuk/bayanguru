package catalog

import (
	"bufio"
	"fmt"
	"math/rand"
	"os"
	"os/exec"
	"path/filepath"
)

type BaseCmd struct {
  CatalogDir, BookFile, SourceDir, PieceDir, BookDir, Catalog string
  Book bool
  PieceIDs, BookIDs []string
  Queries map[string]string
}

type playCmd struct {
  BaseCmd
  random, list bool
}

func PrintStat(catalog, selected int) {
  fmt.Printf(
    "%s %s\n%s %s\n",
    YellowSub("%10s", "Catalog"), BlueTit("%4d", catalog),
    YellowSub("%10s", "Selected"), BlueTit("%4d", selected),
  )
}

func ReadPiecesAndBooks(bc BaseCmd) ([]Piece, []Book, int, error) {
  pieceMap, pieceIDs, err := readPieces(bc.CatalogDir, bc.Catalog)
  if err != nil {
    return nil, nil, 0, err
  }
  // Read books
  if bc.Book {
    books, err := readBooks(bc.CatalogDir, bc.BookFile, bc.BookIDs, pieceMap)
    if err != nil {
      return nil, nil, 0, err
    }
    pieces := make([]Piece, 0, 500)
    for _, book := range books {
      pieces = append(pieces, book.Pieces...)
    }
    return pieces, books, len(pieceMap), nil
  }
  // Read pieces
  if len(bc.PieceIDs) > 0 && bc.PieceIDs[0] != "all" {
    pieceIDs = bc.PieceIDs
  }
  pieces := make([]Piece, 0, len(pieceIDs))
  for _, pieceID := range pieceIDs {
    piece, exists := pieceMap[pieceID]
    if !exists {
      return nil, nil, 0, fmt.Errorf("piece %s not in catalog", pieceID)
    }
    pieces = append(pieces, piece)
  }
  return pieces, nil, len(pieceMap), nil
}

func filterPlayed(pieces []Piece, playedFile string) ([]Piece, error) {
  file, err := os.OpenFile(playedFile, os.O_CREATE | os.O_RDONLY, 0644)
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
  nplayed := make([]Piece, 0, len(pieces))
  for _, piece := range pieces {
    if !played[piece.ID] {
      nplayed = append(nplayed, piece)
    }
  }
  return nplayed, nil
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
    rand.Shuffle(pieceLen, func (i, j int) {
      idx[i], idx[j] = idx[j], idx[i]
    })
  }
  return idx
}

func openPiece(pieceDir string, piece Piece) error {
  piecePDF := filepath.Join(pieceDir, piece.File + ".pdf")
  return exec.Command("xdg-open", piecePDF).Run()
}

func addToPlayed(pieceID, fileName string) error {
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

func play(pc playCmd) error {
  pieces, _, catLen, err := ReadPiecesAndBooks(pc.BaseCmd)
  if err != nil {
    return err
  }
  if len(pc.Queries) > 0 {
    pieces, err = QueryPieces(pieces, pc.Queries)
    if err != nil {
      return err
    }
  }
  pieces, err = filterPlayed(pieces, PlayedFile)
  if err != nil {
    return err
  }
  PrintStat(catLen, len(pieces))
  idx := arrangePieces(len(pieces), pc.random)
  for _, i := range idx {
    piece := pieces[i]
    PrintPiece(os.Stdout, piece)
    if !pc.list {
      err := openPiece(pc.PieceDir, piece)
      if err != nil {
        return err
      }
      err = addToPlayed(piece.ID, PlayedFile)
      if err != nil {
        return err
      }
    }
  }
  return nil
}
