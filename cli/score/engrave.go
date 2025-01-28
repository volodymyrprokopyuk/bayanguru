package score

import (
	"fmt"
	"io"
	"os/exec"
	"path/filepath"
	"strings"
	"text/template"

	pdf "github.com/pdfcpu/pdfcpu/pkg/api"
	"github.com/volodymyrprokopyuk/bayanguru/cli/catalog"
)

type EngraveCommand struct {
  CatalogDir, BookFile, SourceDir, PieceDir, BookDir string
  Catalog string
  All, Book, Piece bool
  Init, Lint, Optimize, Meta bool
  Pieces, Books []string
}

func withArgs(args ...string) map[string]string {
  keys := []string{"a", "b", "c", "d", "e", "f", "g", "h"}
  l := min(len(args), len(keys))
  argMap := make(map[string]string, l)
  for i := 0; i < l; i++ {
    argMap[keys[i]] = args[i]
  }
  return argMap
}

func splitArgs(str string) map[string]string {
  return withArgs(strings.SplitN(str, " ; ", 8)...)
}

func strJoin(sep string, slc []string) string {
  return strings.Join(slc, sep)
}

func makeTemplate(sourceDir, targetFile string) (*template.Template, error) {
  tpl := template.New("score")
  tpl.Funcs(template.FuncMap{
    "w": withArgs, "split": splitArgs, "join": strJoin,
  })
  scoreFile := filepath.Join(sourceDir, "template", "score.ly")
  targetFile = filepath.Join(sourceDir, "template", targetFile)
  return tpl.ParseFiles(scoreFile, targetFile)
}

func engraveScore(w io.Writer, score, scoreFile, scoreDir string) error {
  scorePDF := filepath.Join(scoreDir, scoreFile)
  fmt.Fprintf(w, "%v %v\n", catalog.Org("engrave"), catalog.Lvl(scorePDF + ".pdf"))
  lyCmd := exec.Command(
    "lilypond", "-d", "backend=cairo", "-l", "WARN",
    "-f", "pdf", "-o", scorePDF, "-",
  )
  lyCmd.Stdin = strings.NewReader(score)
  lyCmd.Stdout = w
  lyCmd.Stderr = w
  return lyCmd.Run()
}

func optimizeScore(w io.Writer, scoreFile, scoreDir  string) error {
  scorePDF := filepath.Join(scoreDir, scoreFile + ".pdf")
  fmt.Fprintf(w, "%v %v\n", catalog.Org("optimize"), catalog.Lvl(scorePDF))
  return pdf.OptimizeFile(scorePDF, scorePDF, nil)
}

func catError(format string, args ...any) error {
  return fmt.Errorf("catalog: " + format, args...)
}

func scoreError(format string, args ...any) error {
  return fmt.Errorf("score: " + format, args...)
}

func Engrave (ec EngraveCommand) error {
  pieces, books, catLen, err := catalog.ReadPiecesAndBooks(
    ec.CatalogDir, ec.Catalog, ec.Pieces,
    ec.BookFile, ec.Books, ec.Book, ec.All,
  )
  if err != nil {
    return catError("%v", err)
  }
  if ec.Init {
    err := initPiece(pieces, ec.SourceDir)
    if err != nil {
      return catError("%v", err)
    }
    return nil
  }
  catalog.PrintStat(catLen, len(pieces))
  if ec.Book {
    if ec.Piece {
      goto pieces
    }
    err := engraveBooks(books, ec)
    if err != nil {
      return scoreError("%v", err)
    }
    return nil
  }
  pieces: err = engravePieces(pieces, ec)
  if err != nil {
    return scoreError("%v", err)
  }
  return nil
}
