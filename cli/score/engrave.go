package score

import (
	"errors"
	"fmt"
	"io"
	"os/exec"
	"path/filepath"
	"strings"
	"sync"
	"text/template"

	pdf "github.com/pdfcpu/pdfcpu/pkg/api"
	"github.com/volodymyrprokopyuk/bayanguru/cli/catalog"
)

type engraveCommand struct {
  *catalog.BaseCmd
  init, lyr, lint, optimize, meta, lyrics bool
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
  tpl.Funcs(template.FuncMap{"w": withArgs, "split": splitArgs, "join": strJoin})
  scoreFile := filepath.Join(sourceDir, "template", "score.ly")
  targetFile = filepath.Join(sourceDir, "template", targetFile)
  return tpl.ParseFiles(scoreFile, targetFile)
}

func templatePool(sourceDir, targetFile string) (*sync.Pool, error) {
  _, err := makeTemplate(sourceDir, targetFile) // Validate Lilypond templates
  if err != nil {
    return nil, err
  }
  var tplPool = sync.Pool{
    New: func() any {
      tpl, _ := makeTemplate(sourceDir, targetFile)
      return tpl
    },
  }
  return &tplPool, nil
}

func engraveScore(w io.Writer, score, scoreFile, scoreDir string) error {
  scorePDF := filepath.Join(scoreDir, scoreFile)
  _, _ = fmt.Fprintf(
    w, "%s %s\n",
    catalog.BlueTit("engrave"), catalog.BlueSub("%s.pdf", scorePDF),
  )
  lyCmd := exec.Command( //nolint:gosec,gocritic
    "lilypond", "-d", "backend=cairo", "-l", "WARN", "-f", "pdf", "-o", scorePDF, "-",
  )
  lyCmd.Stdin = strings.NewReader(score)
  lyCmd.Stdout = w
  lyCmd.Stderr = w
  return lyCmd.Run()
}

func optimizeScore(w io.Writer, scoreFile, scoreDir string) error {
  scorePDF := filepath.Join(scoreDir, scoreFile + ".pdf")
  _, _ = fmt.Fprintf(
    w, "%s %s\n", catalog.BlueTit("optimize"), catalog.BlueSub("%s", scorePDF),
  )
  return pdf.OptimizeFile(scorePDF, scorePDF, nil)
}

func initPieceLyrics(pieces []*catalog.Piece, ec *engraveCommand) error {
  if len(pieces) == 0 {
    return errors.New("no pieces to initialize")
  }
  piece := pieces[0]
  if ec.lyr {
    piece.LyricsFile = catalog.LyricsFile(piece.Tit)
    err := initLyrics(piece, ec.SourceDir)
    if err != nil {
      return err
    }
  }
  return initPiece(piece, ec.SourceDir)
}

func engrave (ec *engraveCommand) error {
  pieces, books, catLen, err := catalog.ReadPiecesAndBooks(ec.BaseCmd)
  if err != nil {
    return err
  }
  if len(ec.Queries) > 0 {
    pieces, err = catalog.QueryPieces(pieces, ec.Queries)
    if err != nil {
      return err
    }
  }
  if ec.init {
    return initPieceLyrics(pieces, ec)
  }
  catalog.PrintStat(catLen, len(pieces))
  if ec.Book {
    return engraveBooks(books, ec)
  }
  return engravePieces(pieces, ec)
}
