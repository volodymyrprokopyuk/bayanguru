package catalog

import (
  "fmt"
  "path/filepath"
  "io"
  "os"
  "gopkg.in/yaml.v3"
  sty "github.com/volodymyrprokopyuk/bayan/internal/style"
)

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

func readBookFile(catDir, bookFile string) ([]RawBook, error) {
  file, err := os.Open(filepath.Join(catDir, bookFile))
  if err != nil {
    return nil, err
  }
  defer file.Close()
  dec := yaml.NewDecoder(file)
  var books struct { Books []RawBook `yaml:"books"` }
  err = dec.Decode(&books)
  if err != nil {
    return nil, err
  }
  return books.Books, nil
}

func selectRawBooks(rawBooks []RawBook, bookIDs []string) ([]RawBook, error) {
  rawBookMap := make(map[string]RawBook, 50)
  for _, rawBook := range rawBooks {
    rawBookMap[rawBook.ID] = rawBook
  }
  selRawBooks := make([]RawBook, 0, 50)
  for _, bookID := range bookIDs {
    if rawBook, in := rawBookMap[bookID]; in {
      selRawBooks = append(selRawBooks, rawBook)
    } else {
      return nil, fmt.Errorf("invalid book %v", bookID)
    }
  }
  return selRawBooks, nil
}

func addPiecesToBooks(rawBooks []RawBook, pieceMap PieceMap) ([]Book, error) {
  books := make([]Book, 0, 50)
  for _, rawBook := range rawBooks {
    book := Book{ID: rawBook.ID, Tit: rawBook.Tit, Sub: rawBook.Sub}
    book.File = scoreFile(book.Tit, book.ID)
    book.Pieces = make([]Piece, 0, 200)
    if len(rawBook.Sections) > 0 { // book with sections
      book.Sections = make([]Section, 0, 10)
      for _, rawSec := range rawBook.Sections {
        sec := Section{Tit: rawSec.Tit}
        sec.Pieces = make([]Piece, 0, 20)
        for _, pieceID := range rawSec.Pieces {
          if piece, ok := pieceMap[pieceID]; ok {
            sec.Pieces = append(sec.Pieces, piece)
            book.Pieces = append(book.Pieces, piece)
          } else {
            err := fmt.Errorf(
              "piece %v from book %v is not in catalog", pieceID, book.ID,
            )
            return nil, err
          }
        }
        book.Sections = append(book.Sections, sec)
      }
    } else { // book without sections
      for _, pieceID := range rawBook.Pieces {
        if piece, ok := pieceMap[pieceID]; ok {
          book.Pieces = append(book.Pieces, piece)
        } else {
          err := fmt.Errorf(
            "piece %v from book %v is not in catalog", pieceID, book.ID,
          )
          return nil, err
        }
      }
    }
    books = append(books, book)
  }
  return books, nil
}

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

func readBooks(
  catDir, bookFile string, bookIDs []string, all bool, pieceMap PieceMap,
) ([]Book, error) {
  rawBooks, err := readBookFile(catDir, bookFile)
  if err != nil {
    return nil, err
  }
  if !all {
    rawBooks, err = selectRawBooks(rawBooks, bookIDs)
    if err != nil {
      return nil, err
    }
  }
  books, err := addPiecesToBooks(rawBooks, pieceMap)
  if err != nil {
    return nil, err
  }
  return books, nil
}

func PrintBook(w io.Writer, book Book) {
  fmt.Fprintf(
    w, "%v %v %v\n",
    sty.ID(book.ID), sty.Tit(book.Tit),
    sty.Com("%v pieces", len(book.Pieces)),
  )
}
