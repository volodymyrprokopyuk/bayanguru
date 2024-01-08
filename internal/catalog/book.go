package catalog

import (
  "fmt"
  "path/filepath"
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
}

func readBookFile(bookDir, bookFile string) ([]RawBook, error) {
  file, err := os.Open(filepath.Join(bookDir, bookFile))
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
    if rawBook, ok := rawBookMap[bookID]; ok {
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

func readBooks(
  bookDir, bookFile string, bookIDs []string, all bool, pieceMap PieceMap,
) ([]Book, error) {
  rawBooks, err := readBookFile(bookDir, bookFile)
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

func PrintBook(book Book) {
  fmt.Printf(
    "%v %v %v\n",
    sty.ID(book.ID), sty.Tit(book.Tit),
    sty.Com("%v pieces", len(book.Pieces)),
  )
}
