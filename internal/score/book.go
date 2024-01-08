package score

import (
  "fmt"
  "strings"
  "text/template"
  "path/filepath"
  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
  // "github.com/sanity-io/litter"
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

func lintPieces(pieces []cat.Piece, sourceDir string) error {
  for _, piece := range pieces {
    err := lintPiece(piece, sourceDir)
    if err != nil {
      return err
    }
  }
  return nil
}

func templatePieces(
  tpl *template.Template, pieces []*cat.Piece, sourceDir string, meta bool,
) error {
  for _, piece := range pieces {
    piece.Meta = meta
    pieceFile := filepath.Join(sourceDir, piece.Src, piece.File + ".ly")
    _, err := tpl.ParseFiles(pieceFile)
    if err != nil {
      return err
    }
    var rightHand strings.Builder
    err = tpl.ExecuteTemplate(&rightHand, "rightHand", *piece)
    if err != nil {
      return err
    }
    piece.RightHand = rightHand.String()
    var leftHand strings.Builder
    err = tpl.ExecuteTemplate(&leftHand, "leftHand", *piece)
    if err != nil {
      return err
    }
    piece.LeftHand = stradella(leftHand.String())
  }
  return nil
}

// func templateBook(
//   tpl *template.Template, book cat.Book, sourceDir string,
// ) (string, error) {
//   bookFile := filepath.Join()
// }

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
      err := lintPieces(book.Pieces, sourceDir)
      if err != nil {
        return err
      }
    }
    pieces := bookPieces(book)
    err = templatePieces(tpl, pieces, sourceDir, ec.Meta)
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
    fmt.Println(bookScore.String())
    // litter.Dump(book)
  }
  return nil
}
