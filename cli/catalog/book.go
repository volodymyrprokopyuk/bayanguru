package catalog

import (
	"fmt"
	"io"
	"path/filepath"
	"slices"
	"strings"
	"text/template"

	"gopkg.in/yaml.v3"
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

func (b *Book) PtrPieces() func(yield func(i int, piece *Piece) bool) {
  if len(b.Sections) > 0 {
    return func(yield func(i int, piece *Piece) bool) {
      k := 0
      sections: for i := range b.Sections {
        sec := b.Sections[i]
        for j := range sec.Pieces {
          piece := &sec.Pieces[j]
          if !yield(k, piece) {
            break sections
          }
          k++
        }
      }
    }
  }
  return func(yield func(i int, piece *Piece) bool) {
    for i := range b.Pieces {
      piece := &b.Pieces[i]
      if !yield(i, piece) {
        break
      }
    }
  }
}

func PrintBook(w io.Writer, book Book) {
  fmt.Fprintf(
    w, "%s %s %s\n",
    GreenTit(book.ID), YellowTit(book.Tit),
    RedSub("%d pieces", len(book.Pieces)),
  )
}

func makeQuerySort(pieceMap map[string]Piece) func(queries ...string) string {
  return func(queries ...string) string {
    // Parse query
    if len(queries) % 2 != 0 {
      return "query: odd number of queries"
    }
    queryMap := make(map[string]string, len(queries) / 2)
    sortBy := ""
    for i := 0; i < len(queries) - 1; i += 2 {
      key, value := queries[i], queries[i + 1]
      if key == "sort" {
        if !slices.Contains(SortKeys, value) {
          return fmt.Sprintf("query: invalid sort key %s", value)
        }
        sortBy = value
        continue
      }
      queryMap[key] = value
    }
    // Query pieces
    match, err := makeMatchPiece(queryMap)
    if err != nil {
      return err.Error()
    }
    pieces := make([]Piece, 0, len(pieceMap))
    for _, piece := range pieceMap {
      if match(piece) {
        pieces = append(pieces, piece)
      }
    }
    // Sort pieces
    if len(sortBy) > 0 {
      SortPieces(pieces, SortKey[sortBy])
    }
    pieceIDs := make([]string, 0, len(pieces))
    for _, piece := range pieces {
      pieceIDs = append(pieceIDs, piece.ID)
    }
    return strings.Join(pieceIDs, ", ")
  }
}

func readBookFile(
  catDir, bookFile string, pieceMap map[string]Piece,
) ([]RawBook, error) {
  tpl := template.New("book")
  tpl.Funcs(template.FuncMap{"query": makeQuerySort(pieceMap)})
  _, err := tpl.ParseFiles(filepath.Join(catDir, bookFile))
  if err != nil {
    return nil, err
  }
  var books strings.Builder
  err = tpl.ExecuteTemplate(&books, bookFile, nil)
  if err != nil {
    return nil, err
  }
  var rbooks struct { Books []RawBook `yaml:"books"` }
  err = yaml.NewDecoder(strings.NewReader(books.String())).Decode(&rbooks)
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
  rbooks, err := readBookFile(catDir, bookFile, pieceMap)
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
