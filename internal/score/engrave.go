package score

import (
  "fmt"
  // "text/template"
  // "os"
  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
)

type EngraveCommand struct {
  Catalog string
  All, Book, Piece bool
  Init, Lint, Optimize, Meta bool
  Pieces, Books []string
}

func initPiece(pieces []cat.Piece, sourceDir string) error {
  if len(pieces) == 0 {
    return fmt.Errorf("no piece to initialize")
  }
  piece := pieces[0]
  fmt.Println("init", piece)
  // TODO
  return nil
}

func engravePieces(pieces []cat.Piece, pieceDir string) error {
  for _, piece := range pieces {
    cat.PrintPiece(piece)
  }
  // TODO
  return nil
}

func engraveBooks(books []cat.Book, pieces []cat.Piece, bookDir string) error {
  fmt.Println("engrave books")
  // TODO
  return nil
}

func templateArgs(args ...string) map[string]string {
  keys := []string{"a", "b", "c", "d", "e", "f", "g"}
  l := min(len(args), len(keys))
  argMap := make(map[string]string, l)
  for i := 0; i < l; i++ {
    argMap[keys[i]] = args[i]
  }
  return argMap
}

func catError(format string, args ...any) error {
  return fmt.Errorf("catalog: " + format, args...)
}

func scoreError(format string, args ...any) error {
  return fmt.Errorf("score: " + format, args...)
}

func Engrave (ec EngraveCommand) error {
  pieces, books, catLen, err := cat.ReadPiecesAndBooks(
    "catalog", ec.Catalog, ec.Pieces,
    "meta", "books2.yaml", ec.Books, ec.Book, ec.All,
  )
  if err != nil {
    return catError("%v", err)
  }
  if ec.Init {
    err := initPiece(pieces, "source2")
    if err != nil {
      return catError("%v", err)
    }
    return nil
  }
  cat.PrintStat(catLen, len(pieces))
  if ec.Book {
    if ec.Piece {
      goto pieces
    }
    err := engraveBooks(books, pieces, "books")
    if err != nil {
      return scoreError("%v", err)
    }
    return nil
  }
  pieces: err = engravePieces(pieces, "pieces")
  if err != nil {
    return scoreError("%v", err)
  }
  return nil

  // tpl, err := template.ParseFiles("score.ly", "piece.ly")
  // if err != nil {
  //   return scoreError("%v", err)
  // }
  // tpl.Funcs(template.FuncMap{"w": templateArgs})
  // tpl.ParseFiles("1a2b.ly")
  // if err != nil {
  //   return scoreError("%v", err)
  // }
  // pieces := []string{"1a2b.ly", "3c4d.ly"}
  // err = tpl.Execute(os.Stdout, pieces)
  // if err != nil {
  //   return scoreError("%v", err)
  // }
}
