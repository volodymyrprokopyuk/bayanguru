package score

import (
  "fmt"
  "text/template"
  "io"
  "path/filepath"
  "os"
  "os/exec"
  sty "github.com/volodymyrprokopyuk/bayan/internal/style"
  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
)

type EngraveCommand struct {
  Catalog string
  All, Book, Piece bool
  Init, Lint, Optimize, Meta bool
  Pieces, Books []string
}

func copyFile(src, dst string) (int64, error) {
  srcFile, err := os.Open(src)
  if err != nil {
    return 0, err
  }
  defer srcFile.Close()
  dstFile, err := os.Create(dst)
  if err != nil {
    return 0, err
  }
  defer dstFile.Close()
  return io.Copy(dstFile, srcFile)
}

func initPiece(pieces []cat.Piece, sourceDir string) error {
  if len(pieces) == 0 {
    return fmt.Errorf("no piece to initialize")
  }
  piece := pieces[0]
  pieceFile := filepath.Join(sourceDir, piece.Src, piece.File + ".ly")
  _, err := os.Stat(pieceFile)
  if err == nil {
    return fmt.Errorf("%v already exists", pieceFile)
  }
  pieceDir := filepath.Join(sourceDir, piece.Src)
  err = os.MkdirAll(pieceDir, 0755)
  if err != nil {
    return err
  }
  initFile := filepath.Join(sourceDir, "template", "init.ly")
  _, err = copyFile(initFile, pieceFile)
  if err != nil {
    return err
  }
  fmt.Printf("%v %v\n", sty.ID("init"), sty.Tit(pieceFile))
  return nil
}

func makeTemplate(sourceDir, targetFile string) (*template.Template, error) {
  scoreFile := filepath.Join(sourceDir, "template", "score.ly")
  targetFile = filepath.Join(sourceDir, "template", targetFile)
  tpl, err := template.ParseFiles(scoreFile, targetFile)
  if err != nil {
    return nil, err
  }
  tpl.Funcs(template.FuncMap{"w": templateArgs})
  return tpl, nil
}

func templatePiece(
  tpl *template.Template, w io.WriteCloser, piece cat.Piece, sourceDir string,
) error {
  defer w.Close()
  pieceFile := filepath.Join(sourceDir, piece.Src, piece.File + ".ly")
  _, err := tpl.ParseFiles(pieceFile)
  if err != nil {
    return err
  }
  err = tpl.Execute(w, piece)
  if err != nil {
    return err
  }
  return nil
}

func engravePieces(pieces []cat.Piece, sourceDir, pieceDir string) error {
  tpl, err := makeTemplate(sourceDir, "piece.ly")
  if err != nil {
    return err
  }
  for _, piece := range pieces {
    cat.PrintPiece(piece)
    piecePDF := filepath.Join(pieceDir, piece.File)
    ly := exec.Command(
      "lilypond", "-dbackend=cairo", "-f", "pdf", "-o", piecePDF, "-",
    )
    lyStdin, err := ly.StdinPipe()
    if err != nil {
      return err
    }
    ly.Stdout = os.Stdout
    ly.Stderr = os.Stderr
    err = ly.Start()
    if err != nil {
      return err
    }
    err = templatePiece(tpl, lyStdin, piece, sourceDir)
    if err != nil {
      return err
    }
    err = ly.Wait()
    if err != nil {
      return err
    }
  }
  return nil
}

func engraveBooks(
  books []cat.Book, pieces []cat.Piece, sourceDir, bookDir string,
) error {
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
    err := engraveBooks(books, pieces, "source2", "books")
    if err != nil {
      return scoreError("%v", err)
    }
    return nil
  }
  pieces: err = engravePieces(pieces, "source2", "pieces")
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
