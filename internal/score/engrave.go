package score

import (
  "fmt"
  "strings"
  "text/template"
  "io"
  "path/filepath"
  "os"
  "os/exec"
  pdf "github.com/pdfcpu/pdfcpu/pkg/api"
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
  tpl *template.Template, piece cat.Piece, sourceDir string,
) (string, error) {
  pieceFile := filepath.Join(sourceDir, piece.Src, piece.File + ".ly")
  _, err := tpl.ParseFiles(pieceFile)
  if err != nil {
    return "", err
  }
  var score strings.Builder
  err = tpl.Execute(&score, piece)
  if err != nil {
    return "", err
  }
  return score.String(), nil
}

func engravePiece(piece cat.Piece, pieceScore, pieceDir string) error {
  piecePDF := filepath.Join(pieceDir, piece.File)
  lyCmd := exec.Command(
    "lilypond", "-d", "backend=cairo", "-f", "pdf", "-o", piecePDF, "-",
  )
  lyCmd.Stdin = strings.NewReader(pieceScore)
  lyCmd.Stdout = os.Stdout
  lyCmd.Stderr = os.Stderr
  return lyCmd.Run()
}

func optimizePiece(piece cat.Piece, pieceDir string) error {
  piecePDF := filepath.Join(pieceDir, piece.File + ".pdf")
  return pdf.OptimizeFile(piecePDF, piecePDF, nil)
}

func engravePieces(
  pieces []cat.Piece, sourceDir, pieceDir string, ec EngraveCommand,
) error {
  tpl, err := makeTemplate(sourceDir, "piece.ly")
  if err != nil {
    return err
  }
  for _, piece := range pieces {
    piece.Meta = ec.Meta
    cat.PrintPiece(piece)
    pieceScore, err := templatePiece(tpl, piece, sourceDir)
    if err != nil {
      return err
    }
    err = engravePiece(piece, pieceScore, pieceDir)
    if err != nil {
      return err
    }
    if ec.Optimize {
      err = optimizePiece(piece, pieceDir)
      if err != nil {
        return err
      }
    }
  }
  return nil
}

func engraveBooks(
  books []cat.Book, pieces []cat.Piece,
  sourceDir, bookDir string, ec EngraveCommand,
) error {
  fmt.Println("engrave books")
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
    err := engraveBooks(books, pieces, "source2", "books", ec)
    if err != nil {
      return scoreError("%v", err)
    }
    return nil
  }
  pieces: err = engravePieces(pieces, "source2", "pieces", ec)
  if err != nil {
    return scoreError("%v", err)
  }
  return nil
}
