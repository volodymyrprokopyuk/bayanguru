package score

import (
  "strings"
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

func engraveBooks(
  books []cat.Book, sourceDir, bookDir string, ec EngraveCommand,
) error {
  tpl, err := makeTemplate(sourceDir, "book.ly")
  if err != nil {
    return err
  }
  for _, book := range books {
    cat.PrintBook(book)
    if ec.Lint {
      for _, piece := range book.Pieces {
        err := lintPiece(piece, sourceDir)
        if err != nil {
          return err
        }
      }
    }
    book.Meta = ec.Meta
    pieces := bookPieces(book)
    for _, piece := range pieces {
      err := templatePiece(tpl, piece, sourceDir, ec.Meta)
      if err != nil {
        return err
      }
    }
    if err != nil {
      return err
    }
    var bookScore strings.Builder
    err = tpl.ExecuteTemplate(&bookScore, "score.ly", book)
    if err != nil {
      return err
    }
    err = engraveScore(bookScore.String(), book.File, bookDir)
    if err != nil {
      return err
    }
    if ec.Optimize {
      err = optimizeScore(book.File, bookDir)
      if err != nil {
        return err
      }
    }
  }
  return nil
}
