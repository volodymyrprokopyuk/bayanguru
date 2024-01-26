package score

import (
  "strings"
  "text/template"
  "os"
  "sync"

  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
)

func bookPieces(book cat.Book) []*cat.Piece {
  pieces := make([]*cat.Piece, 0, 200)
  if len(book.Sections) > 0 {
    nextPiece, piece := cat.SectionPieces(book)
    for nextPiece() {
      pieces = append(pieces, piece())
    }
  } else {
    for i := range book.Pieces {
      pieces = append(pieces, &book.Pieces[i])
    }
  }
  return pieces
}

func engraveBook(
  tplPool *sync.Pool,
  book cat.Book, sourceDir, bookDir string, ec EngraveCommand,
) error {
  cat.PrintBook(os.Stdout, book)
  if ec.Lint {
    for _, piece := range book.Pieces {
      err := lintPiece(os.Stdout, piece, sourceDir)
      if err != nil {
        return err
      }
    }
  }
  book.Meta = ec.Meta
  pieces := bookPieces(book)
  tpl := tplPool.Get().(*template.Template)
  for _, piece := range pieces {
    err := templatePiece(tpl, piece, sourceDir, ec.Meta)
    if err != nil {
      return err
    }
  }
  var bookScore strings.Builder
  err := tpl.ExecuteTemplate(&bookScore, "score.ly", book)
  if err != nil {
    return err
  }
  err = engraveScore(os.Stdout, bookScore.String(), book.File, bookDir)
  if err != nil {
    return err
  }
  if ec.Optimize {
    err := optimizeScore(os.Stdout, book.File, bookDir)
    if err != nil {
      return err
    }
  }
  return nil
}

func engraveBooks(
  books []cat.Book, sourceDir, bookDir string, ec EngraveCommand,
) error {
  _, err := makeTemplate(sourceDir, "book.ly") // validate template
  if err != nil {
    return err
  }
  var tplPool = sync.Pool {
    New: func() any {
      tpl, _ := makeTemplate(sourceDir, "book.ly")
      return tpl
    },
  }
  for _, book := range books {
    err := engraveBook(&tplPool, book, sourceDir, bookDir, ec)
    if err != nil {
      return err
    }
  }
  return nil
}
