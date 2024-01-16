package score

import (
  "fmt"
  "strings"
  "text/template"
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

func templateArgs(args ...string) map[string]string {
  keys := []string{"a", "b", "c", "d", "e", "f", "g", "h"}
  l := min(len(args), len(keys))
  argMap := make(map[string]string, l)
  for i := 0; i < l; i++ {
    argMap[keys[i]] = args[i]
  }
  return argMap
}

func makeTemplate(sourceDir, targetFile string) (*template.Template, error) {
  tpl := template.New("score")
  tpl.Funcs(template.FuncMap{
    "w": templateArgs,
    "join": func(sep string, slc []string) string {
      return strings.Join(slc, sep)
    },
  })
  scoreFile := filepath.Join(sourceDir, "template", "score.ly")
  targetFile = filepath.Join(sourceDir, "template", targetFile)
  _, err := tpl.ParseFiles(scoreFile, targetFile)
  if err != nil {
    return nil, err
  }
  return tpl, nil
}

func engraveScore(score, scoreFile, scoreDir string) error {
  scorePDF := filepath.Join(scoreDir, scoreFile)
  fmt.Printf("%v %v\n", sty.Org("engrave"), sty.Lvl(scorePDF + ".pdf"))
  lyCmd := exec.Command(
    "lilypond", "-d", "backend=cairo", "-l", "WARN",
    "-f", "pdf", "-o", scorePDF, "-",
  )
  lyCmd.Stdin = strings.NewReader(score)
  lyCmd.Stdout = os.Stdout
  lyCmd.Stderr = os.Stderr
  return lyCmd.Run()
}

func optimizeScore(scoreFile, scoreDir  string) error {
  scorePDF := filepath.Join(scoreDir, scoreFile + ".pdf")
  fmt.Printf("%v %v\n", sty.Org("optimize"), sty.Lvl(scorePDF))
  return pdf.OptimizeFile(scorePDF, scorePDF, nil)
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
    "meta", "books.yaml", ec.Books, ec.Book, ec.All,
  )
  if err != nil {
    return catError("%v", err)
  }
  if ec.Init {
    err := initPiece(pieces, "source")
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
    err := engraveBooks(books, "source", "books", ec)
    if err != nil {
      return scoreError("%v", err)
    }
    return nil
  }
  pieces: err = engravePieces(pieces, "source", "pieces", ec)
  if err != nil {
    return scoreError("%v", err)
  }
  return nil
}
