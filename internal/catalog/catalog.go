package catalog

import (
  "fmt"
  "strings"
  "regexp"
  "path/filepath"
  "os"
  "github.com/sanity-io/litter"
  "gopkg.in/yaml.v3"
)

var meta = map[string]string{
  // Piece subtitle (sub)
  "ukrfs": "Українська народна пісня",
  "ukrfsvar": "Варіації на тему української народної пісні",
  "ukrfd": "Український народний танець",
  "rusfs": "Російська народна пісня",
  "rusfsvar": "Варіації на тему російської народної пісні",
  "rusfd": "Російський народний танець",
  "blrfs": "Білоруська народна пісня",
  "blrfd": "Білоруський народний танець",
  "hunfs": "Угорська народна пісня",
  "hunfd": "Угорський народний танець",
  "mdafs": "Молдавська народна пісня",
  "mdafd": "Молдавський народний танець",
  "roufs": "Румуньска народна пісня",
  "roufd": "Румунський народний танець",
  "polfs": "Польська народна пісня",
  "polfd": "Польський народний танець",
  "czefs": "Чеська народна пісня",
  "czefd": "Чеський народний танець",
  "svkfs": "Словацька народна пісня",
  "svkfd": "Словацький народний танець",
  // Piece arrangment type (art)
  "arr": "Обр.", // обробка = arrangment (default)
  "ipr": "Пер.", // переклад = interpratation
  "hrm": "Гарм.", // гармонізація = harmonization
}

type StrSlice []string

func (ss *StrSlice) UnmarshalYAML(node *yaml.Node) error {
  var slc []string
  err := node.Decode(&slc) // try a string slice
  if err != nil {
    var str string
    err := node.Decode(&str) // try a single string
    if err != nil {
      return err
    }
    *ss = []string{str} // convert a single string to a string slice
    return nil
  }
  *ss = slc // return a string slice
  return nil
}

type Piece struct {
  ID string `yaml:"id"`
  Tit string `yaml:"tit"`
  Sub string `yaml:"sub"`
  Com string `yaml:"com"`
  Arr string `yaml:"arr"`
  Art string `yaml:"art"`
  Src string `yaml:"src"`
  Org string `yaml:"org"`
  Sty string `yaml:"sty"`
  Gnr string `yaml:"gnr"`
  Ton StrSlice `yaml:"ton"`
  Frm StrSlice `yaml:"frm"`
  Bss StrSlice `yaml:"bss"`
  Lvl string `yaml:"lvl"`
  File string
}

type PieceMap map[string]Piece

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
}

type PieceQueries map[string]string

type PlayCommand struct {
  Catalog string
  Book, Cycle, Random, List, All bool
  Pieces, Books []string
  Queries PieceQueries
}

type MatchStr func(str string) bool

func makeMatchStr(pattern string) (MatchStr, error) {
  isNeg := strings.HasPrefix(pattern, "^")
  pattern = regexp.QuoteMeta(strings.TrimPrefix(pattern, "^"))
  re, err := regexp.Compile(strings.ReplaceAll(pattern, ",", "|"))
  if err != nil {
    return nil, err
  }
  match := func (str string) bool {
    if isNeg {
      return !re.MatchString(str)
    } else {
      return re.MatchString(str)
    }
  }
  return match, nil
}

type MatchPiece func(piece Piece) bool

func makeMatchPiece(queries PieceQueries) (MatchPiece, error) {
  matches := make(map[string]MatchStr, len(queries))
  for opt, query := range queries {
    match, err := makeMatchStr(query)
    if err != nil {
      return nil, err
    }
    matches[opt] = match
  }
  matchSlice := func(slc StrSlice, match MatchStr) bool {
    for _, str := range slc {
      if match(str) {
        return true
      }
    }
    return false
  }
  matchPiece := func(piece Piece) bool {
    for opt, match := range matches {
      switch opt {
      case "org": if !match(piece.Org) { return false }
      case "sty": if !match(piece.Sty) { return false }
      case "gnr": if !match(piece.Gnr) { return false }
      case "ton": if !matchSlice(piece.Ton, match) { return false }
      case "frm": if !matchSlice(piece.Frm, match) { return false }
      case "bss": if !matchSlice(piece.Bss, match) { return false }
      case "lvl": if !match(piece.Lvl) { return false }
      case "tit": if !match(piece.Tit) { return false }
      case "com": if !match(piece.Com) { return false }
      case "arr": if !match(piece.Arr) { return false }
      default: panic(fmt.Sprintf("catalog: unknown query option %v", opt))
      }
    }
    return true
  }
  return matchPiece, nil
}

func listCatalogFiles(catDir, catQuery string) ([]string, error) {
  entries, err := os.ReadDir(catDir)
  if err != nil {
    return nil, err
  }
  match, err := makeMatchStr(catQuery)
  if err != nil {
    return nil, err
  }
  files := make([]string, 0, 50)
  for _, entry := range entries {
    if !entry.IsDir() && strings.HasSuffix(entry.Name(), ".yaml") &&
      match(strings.TrimSuffix(entry.Name(), ".yaml")) {
      files = append(files, entry.Name())
    }
  }
  return files, nil
}

func readCatalogFile(catDir, catFile string) ([]Piece, error) {
  file, err := os.Open(filepath.Join(catDir, catFile))
  if err != nil {
    return nil, err
  }
  defer file.Close()
  dec := yaml.NewDecoder(file)
  var pieces struct { Pieces []Piece `yaml:"pieces"` }
  err = dec.Decode(&pieces)
  if err != nil {
    return nil, err
  }
  return pieces.Pieces, nil
}

func addMetaToPieces(pieces []Piece) {
  cleanTit := regexp.MustCompile(`[',\.!\?]`)
  for i := range pieces {
    piece := &pieces[i]
    // sub
    if sub, ok := meta[piece.Sub]; ok {
      piece.Sub = sub
    }
    // art
    if len(piece.Arr) > 0 {
      if len(piece.Art) > 0 {
        piece.Art = meta[piece.Art]
      } else {
        piece.Art = meta["arr"] // default: arrangement
      }
    }
    // file
    tit := strings.ReplaceAll(
      cleanTit.ReplaceAllLiteralString(piece.Tit, ""), " ", "-",
    )
    piece.File = fmt.Sprintf("%v-%v", tit, piece.ID)
  }
}

func readPieces(catDir, catQuery string) (PieceMap, error) {
  catFiles, err := listCatalogFiles(catDir, catQuery)
  if err != nil {
    return nil, err
  }
  pieceMap := make(PieceMap, 1000)
  for _, catFile := range catFiles {
    pieces, err := readCatalogFile(catDir, catFile)
    if err != nil {
      return nil, err
    }
    addMetaToPieces(pieces)
    for _, piece := range pieces {
      pieceMap[piece.ID] = piece
    }
  }
  return pieceMap, nil
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
  if !all { // select books
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

func queryPieces(pieces []Piece, queries map[string]string) ([]Piece, error) {
  match, err := makeMatchPiece(queries)
  if err != nil {
    return nil, err
  }
  selPieces := make([]Piece, 0, 200)
  for _, piece := range pieces {
    if match(piece) {
      selPieces = append(selPieces, piece)
    }
  }
  return selPieces, nil
}

func catError(format string, vals ...any) error {
  return fmt.Errorf("catalog: " + format, vals...)
}

func Play(pc PlayCommand) error {
  pieceMap, err := readPieces("catalog", pc.Catalog)
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
    if !pc.All { // select pieces
      for _, pieceID := range pc.Pieces {
        if piece, ok := pieceMap[pieceID]; ok {
          pieces = append(pieces, piece)
        } else {
          return catError("piece %v not in catalog", pieceID)
        }
      }
    } else {
      for _, piece := range pieceMap {
        pieces = append(pieces, piece)
      }
    }
  }
  if len(pc.Queries) > 0 {
    pieces, err = queryPieces(pieces, pc.Queries)
    if err != nil {
      return catError("%v", err)
    }
  }
  litter.Dump(pieces)
  return nil
}
