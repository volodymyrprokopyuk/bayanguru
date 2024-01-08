package score

import (
  // "fmt"
  "strings"
  "text/template"
  "path/filepath"
  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
  "github.com/sanity-io/litter"
)

func bookPieces(book *cat.Book) []*cat.Piece {
  pieces := make([]*cat.Piece, 0, 200)
  if len(book.Sections) > 0 {
    for i := range book.Sections {
      sec := &book.Sections[i]
      for j := range sec.Pieces {
        piece := &sec.Pieces[j]
        pieces = append(pieces, piece)
      }
    }
  } else {
    for i := range book.Pieces {
      piece := &book.Pieces[i]
      pieces = append(pieces, piece)
    }
  }
  return pieces
}

func lintPieces(pieces []*cat.Piece, sourceDir string) error {
  for _, piece := range pieces {
    err := lintPiece(*piece, sourceDir)
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
    var scoreHand strings.Builder
    err = tpl.ExecuteTemplate(&scoreHand, "rightHand", *piece)
    if err != nil {
      return err
    }
    piece.RightHand = scoreHand.String()
    scoreHand.Reset()
    err = tpl.ExecuteTemplate(&scoreHand, "leftHand", *piece)
    if err != nil {
      return err
    }
    piece.LeftHand = stradella(scoreHand.String())
  }
  return nil
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
    pieces := bookPieces(&book)
    if ec.Lint {
      err := lintPieces(pieces, sourceDir)
      if err != nil {
        return err
      }
    }
    err = templatePieces(tpl, pieces, sourceDir, ec.Meta)
    if err != nil {
      return err
    }
    litter.Dump(book)
  }
  return nil
}
