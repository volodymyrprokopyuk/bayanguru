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
  book, random, list bool
  pieceIDs, bookIDs []string
  queries map[string]string
}

func PrintStat(catalog, selected int) {
  fmt.Printf(
    "%s %s\n%s %s\n",
    YellowSub("%10s", "Catalog"), BlueTit("%4d", catalog),
    YellowSub("%10s", "Selected"), BlueTit("%4d", selected),
  )
}

func ReadPiecesAndBooks(
  catDir, catQuery string, cmdPieceIDs []string,
  book bool, bookFile string, cmdBookIDs []string,
) ([]Piece, []Book, int, error) {
  pieceMap, pieceIDs, err := readPieces(catDir, catQuery)
  if err != nil {
    return nil, nil, 0, err
  }
  // Read books
  if book {
    books, err := readBooks(catDir, bookFile, cmdBookIDs, pieceMap)
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
  if len(cmdPieceIDs) > 0 && cmdPieceIDs[0] != "all" {
    pieceIDs = cmdPieceIDs
  }
  pieces := make([]Piece, 0, len(pieceIDs))
  for _, pieceID := range pieceIDs {
    piece, exists := pieceMap[pieceID]
    if !exists {
      return nil, nil, 0, fmt.Errorf("piece %v not in catalog", pieceID)
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
  pieces, _, catLen, err := ReadPiecesAndBooks(
    pc.catalogDir, pc.catalog, pc.pieceIDs, pc.book, pc.bookFile, pc.bookIDs,
  )
  if err != nil {
    return err
  }
  if len(pc.queries) > 0 {
    pieces, err = QueryPieces(pieces, pc.queries)
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
      err := openPiece(pc.pieceDir, piece)
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
