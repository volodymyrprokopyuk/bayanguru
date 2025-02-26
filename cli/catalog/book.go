package catalog

import (
	"fmt"
	"io"
	"os"
	"path/filepath"

	"gopkg.in/yaml.v3"
)

// TODO
func SectionPieces(book Book) (next func() bool, value func() *Piece) {
  i, j := 0, 0
  next = func() bool { // check for the next iterator value
    return i < len(book.Sections) && j < len(book.Sections[i].Pieces)
  }
  value = func() *Piece { // return a current iterator value
    if !next() {
      panic("out of bound Section Piece")
    }
    piece := &book.Sections[i].Pieces[j]
    switch {
    case j < len(book.Sections[i].Pieces) - 1:
      j++
    case i < len(book.Sections):
      i++
      j = 0
    default: i++
    }
    return piece
  }
  return next, value
}

type RawSection struct {
  Tit string `yaml:"tit"`
  Pieces []string `yaml:"pieces"`
}

type RawBook struct {
  ID string `yaml:"id"`
  Tit string `yaml:"tit"`
  Sub string `yaml:"sub"`
  Pieces []string `yaml:"pieces"`
  Sections []RawSection `yaml:"sections"`
}

type Section struct {
  Tit string
  Pieces []Piece
}

type Book struct {
  ID string
  Tit string
  Sub string
  Pieces []Piece
  Sections []Section
  File string
  Meta bool
}

func PrintBook(w io.Writer, book Book) {
  fmt.Fprintf(
    w, "%s %s %s\n",
    GreenTit(book.ID), YellowTit(book.Tit),
    RedSub("%v pieces", len(book.Pieces)),
  )
}

func readBookFile(catDir, bookFile string) ([]RawBook, error) {
  file, err := os.Open(filepath.Join(catDir, bookFile))
  if err != nil {
    return nil, err
  }
  defer file.Close()
  var rbooks struct { Books []RawBook `yaml:"books"` }
  err = yaml.NewDecoder(file).Decode(&rbooks)
  if err != nil {
    return nil, err
  }
  return rbooks.Books, nil
}

func queryBooks(rbooks []RawBook, bookIDs []string) ([]RawBook, error) {
  bookMap := make(map[string]RawBook, 50)
  for _, rbook := range rbooks {
    bookMap[rbook.ID] = rbook
  }
  selected := make([]RawBook, 0, 50)
  for _, bookID := range bookIDs {
    rbook, exists := bookMap[bookID]
    if !exists {
      return nil, fmt.Errorf("invalid book %s", bookID)
    }
    selected = append(selected, rbook)
  }
  return selected, nil
}

func addPiecesToBooks(
  rbooks []RawBook, pieceMap map[string]Piece,
) ([]Book, error) {
  books := make([]Book, 0, 50)
  for _, rbook := range rbooks {
    book := Book{ID: rbook.ID, Tit: rbook.Tit, Sub: rbook.Sub}
    book.File = scoreFile(book.Tit, book.ID)
    book.Pieces = make([]Piece, 0, 200)
    if len(rbook.Sections) > 0 { // Book with sections
      book.Sections = make([]Section, 0, 10)
      for _, rsec := range rbook.Sections {
        sec := Section{Tit: rsec.Tit}
        sec.Pieces = make([]Piece, 0, 50)
        for _, pieceID := range rsec.Pieces {
          piece, exists := pieceMap[pieceID]
          if !exists {
            return nil, fmt.Errorf(
              "book %s piece %s is not in catalog", pieceID, book.ID,
            )
          }
          sec.Pieces = append(sec.Pieces, piece)
          book.Pieces = append(book.Pieces, piece)
        }
        book.Sections = append(book.Sections, sec)
      }
    } else { // Book without sections
      for _, pieceID := range rbook.Pieces {
        piece, exists := pieceMap[pieceID]
        if !exists {
          return nil, fmt.Errorf(
            "book %s piece %s is not in catalog", pieceID, book.ID,
          )
        }
        book.Pieces = append(book.Pieces, piece)
      }
    }
    books = append(books, book)
  }
  return books, nil
}

func readBooks(
  catDir, bookFile string, bookIDs []string, pieceMap map[string]Piece,
) ([]Book, error) {
  rbooks, err := readBookFile(catDir, bookFile)
  if err != nil {
    return nil, err
  }
  if len(bookIDs) > 0 && bookIDs[0] != "all" {
    rbooks, err = queryBooks(rbooks, bookIDs)
    if err != nil {
      return nil, err
    }
  }
  return addPiecesToBooks(rbooks, pieceMap)
}
