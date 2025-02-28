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

type engraveCommand struct {
  catalog.BaseCmd
  piece, init, lint, optimize, meta bool
}

func withArgs(args ...string) map[string]string {
  keys := []string{"a", "b", "c", "d", "e", "f", "g", "h"}
  l := min(len(args), len(keys))
  argMap := make(map[string]string, l)
  for i := range l {
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
  fmt.Fprintf(
    w, "%s %s\n", catalog.RedTit("engrave"), catalog.BlueSub(scorePDF + ".pdf"),
  )
  lyCmd := exec.Command(
    "lilypond", "-d", "backend=cairo", "-l", "WARN", "-f", "pdf", "-o", scorePDF, "-",
  )
  lyCmd.Stdin = strings.NewReader(score)
  lyCmd.Stdout = w
  lyCmd.Stderr = w
  return lyCmd.Run()
}

func optimizeScore(w io.Writer, scoreFile, scoreDir string) error {
  scorePDF := filepath.Join(scoreDir, scoreFile + ".pdf")
  fmt.Fprintf(w, "%s %s\n", catalog.BlueTit("optimize"), catalog.BlueSub(scorePDF))
  return pdf.OptimizeFile(scorePDF, scorePDF, nil)
}

func engrave (ec engraveCommand) error {
  pieces, books, catLen, err := catalog.ReadPiecesAndBooks(ec.BaseCmd)
  if err != nil {
    return err
  }
  if ec.init {
    return initPiece(pieces, ec.SourceDir)
  }
  catalog.PrintStat(catLen, len(pieces))
  if ec.Book && !ec.piece {
    return engraveBooks(books, ec)
  }
  return engravePieces(pieces, ec)
}
