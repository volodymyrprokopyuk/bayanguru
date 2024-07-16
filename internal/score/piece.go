package score

import (
	"context"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"regexp"
	"runtime"
	"strings"
	"sync"
	"text/template"

	cat "github.com/volodymyrprokopyuk/bayanguru/internal/catalog"
	sty "github.com/volodymyrprokopyuk/bayanguru/internal/style"
)

var chordNames = map[string]string{"M": "Б", "m": "М", "7": "7", "d": "У"}
var noteEnharm = map[string]string{"eis": "f", "bis": "c", "ces": "b", "fes": "e"}

var stChords = map[string]string{
  "aisM": "ais, cisis eis", "aism": "ais, cis eis",
  "ais7": "gis, ais, cisis", "aisd": "fisis, ais, cis",
  "disM": "fisis, ais, dis", "dism": "ais, dis fis",
  "dis7": "fisis, cis dis", "disd": "bis, dis fis",
  "gisM": "gis, bis, dis", "gism": "gis, b, dis",
  "gis7": "gis, bis, fis", "gisd": "gis, b, eis",
  "cisM": "gis, cis eis", "cism": "gis, cis e",
  "cis7": "bis, c eis", "cisd": "ais, cis e",
  "fisM": "ais, cis fis", "fism": "a, cis fis",
  "fis7": "ais, e fis", "fisd": "a, dis fis",

  "bM": "b, dis fis", "bm": "b, d fis", "b7": "a, b, dis", "bd": "gis, b, d",
  "eM": "gis, b, e", "em": "g, b, e", "e7": "gis, d e", "ed": "g, cis e",
  "aM": "a, cis e", "am": "a, c e", "a7": "g, a, cis", "ad": "a, c fis",
  "dM": "a, d fis", "dm": "a, d f", "d7": "c d fis", "dd": "b, d f",
  "gM": "g, b, d", "gm": "g, bes, d", "g7": "g, b, f", "gd": "g, bes, e",
  "cM": "g, e c", "cm": "g, c ees", "c7": "bes, c e", "cd": "a, c ees",
  "fM": "a, c f", "fm": "aes, c f", "f7": "a, ees f", "fd": "aes, d f",

  "besM": "bes, d f", "besm": "bes, des f",
  "bes7": "aes, bes, d", "besd": "g, bes, des",
  "eesM": "g, bes, ees", "eesm": "bes, ees ges",
  "ees7": "g, des ees", "eesd": "c ees ges",
  "aesM": "aes, c ees", "aesm": "aes, ces ees",
  "aes7": "aes, c ges", "aesd": "aes, ces f",
  "desM": "aes, des f", "desm": "aes, des fes",
  "des7": "ces des f", "desd": "bes, des fes",
  "gesM": "bes, des ges", "gesm": "beses, des ges",
  "ges7": "bes, fes ges", "gesd": "beses, ees ges",
}

var stParts = []string{
  `\b(?:([a-g](?:es|is|eses|isis)?[,']*)\+)?`, // [bass]
  `([a-g](?:es|is)?[,']*)(@)?`, // root + [bind]
  `([Mm7d])(!)?`, // chord + [name]
  `(\S+)?`, // [modifiers]
}
var stNotation = regexp.MustCompile(strings.Join(stParts, ""))
var cdeBass = regexp.MustCompile(`^[cde]`)

func lyNotation(stChord string) string {
  c := stNotation.FindStringSubmatch(stChord)
  bass, root, bind, chord, name, mods := c[1], c[2], c[3], c[4], c[5], c[6]
  if len(bass) > 0 {
    if cdeBass.MatchString(bass) {
      bass += ","
    } else {
      bass += ",,"
    }
  }
  if !cdeBass.MatchString(root) {
    root += ","
  }
  rootKey := strings.TrimRight(root, ",'")
  if enharmKey, ok := noteEnharm[rootKey]; ok {
    rootKey = enharmKey
  }
  triad := stChords[rootKey + chord]
  if len(name) > 0 {
    name = fmt.Sprintf(`^\markup \smaller %v`, chordNames[chord])
  }
  if len(bass) > 0 {
    chord = fmt.Sprintf(`\fixed c' { <%v %v>%v%v }`, bass, triad, mods, name)
  } else {
    chord = fmt.Sprintf(`\fixed c' { <%v>%v%v }`, triad, mods, name)
  }
  if len(bind) > 0 {
    return fmt.Sprintf(
      `\afterGrace 1/4 %v { \fixed c { \once \hide Stem \parenthesize %v4 } }`,
      chord, root,
    )
  }
  return chord
}

func stradella(score string) string {
  return stNotation.ReplaceAllStringFunc(score, lyNotation)
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
  var initFile string
  switch piece.Ens {
  case "sol":
    initFile = "initSol.ly"
  case "duo":
    initFile = "initDuo.ly"
  case "vc1":
    initFile = "initVc1.ly"
  case "vc2":
    initFile = "initVc2.ly"
  }
  initFile = filepath.Join(sourceDir, "template", initFile)
  _, err = copyFile(initFile, pieceFile)
  if err != nil {
    return err
  }
  fmt.Printf("%v %v\n", sty.Org("init"), sty.Lvl(pieceFile))
  return nil
}

func templatePiece(
  tpl *template.Template, piece *cat.Piece, sourceDir string, meta bool,
) error {
  piece.Meta = meta
  pieceFile := filepath.Join(sourceDir, piece.Src, piece.File + ".ly")
  _, err := tpl.ParseFiles(pieceFile)
  if err != nil {
    return err
  }
  var w strings.Builder
  switch piece.Ens {
  case "sol":
    w.Reset()
    err = tpl.ExecuteTemplate(&w, "rightHand", piece)
    if err != nil {
      return err
    }
    piece.RightHand = w.String()
    w.Reset()
    err = tpl.ExecuteTemplate(&w, "leftHand", piece)
    if err != nil {
      return err
    }
    piece.LeftHand = stradella(w.String())
  case "duo":
    w.Reset()
    err = tpl.ExecuteTemplate(&w, "rightHandOne", piece)
    if err != nil {
      return err
    }
    piece.RightHandOne = w.String()
    w.Reset()
    err = tpl.ExecuteTemplate(&w, "leftHandOne", piece)
    if err != nil {
      return err
    }
    piece.LeftHandOne = stradella(w.String())
    w.Reset()
    err = tpl.ExecuteTemplate(&w, "rightHandTwo", piece)
    if err != nil {
      return err
    }
    piece.RightHandTwo = w.String()
    w.Reset()
    err = tpl.ExecuteTemplate(&w, "leftHandTwo", piece)
    if err != nil {
      return err
    }
    piece.LeftHandTwo = stradella(w.String())
  case "vc1":
    w.Reset()
    err = tpl.ExecuteTemplate(&w, "vocal", piece)
    if err != nil {
      return err
    }
    piece.Vocal = w.String()
    w.Reset()
    err = tpl.ExecuteTemplate(&w, "rightHand", piece)
    if err != nil {
      return err
    }
    piece.RightHand = w.String()
    w.Reset()
    err = tpl.ExecuteTemplate(&w, "leftHand", piece)
    if err != nil {
      return err
    }
    piece.LeftHand = stradella(w.String())
    w.Reset()
    err = tpl.ExecuteTemplate(&w, "lyrics", piece)
    if err != nil {
      return err
    }
    piece.Lyrics = w.String()
  case "vc2":
    w.Reset()
    err = tpl.ExecuteTemplate(&w, "vocalOne", piece)
    if err != nil {
      return err
    }
    piece.VocalOne = w.String()
    w.Reset()
    err = tpl.ExecuteTemplate(&w, "vocalTwo", piece)
    if err != nil {
      return err
    }
    piece.VocalTwo = w.String()
    w.Reset()
    err = tpl.ExecuteTemplate(&w, "rightHand", piece)
    if err != nil {
      return err
    }
    piece.RightHand = w.String()
    w.Reset()
    err = tpl.ExecuteTemplate(&w, "leftHand", piece)
    if err != nil {
      return err
    }
    piece.LeftHand = stradella(w.String())
    w.Reset()
    err = tpl.ExecuteTemplate(&w, "lyrics", piece)
    if err != nil {
      return err
    }
    piece.Lyrics = w.String()
  }
  return nil
}

func engravePiece(
  w io.Writer, tplPool *sync.Pool, piece cat.Piece, ec EngraveCommand,
) error {
  cat.PrintPiece(w, piece)
  if ec.Lint {
    err := lintPiece(w, piece, ec.SourceDir)
    if err != nil {
      return err
    }
  }
  tpl := tplPool.Get().(*template.Template)
  err := templatePiece(tpl, &piece, ec.SourceDir, ec.Meta)
  if err != nil {
    return err
  }
  var pieceScore strings.Builder
  err = tpl.ExecuteTemplate(&pieceScore, "score.ly", piece)
  tplPool.Put(tpl)
  if err != nil {
    return err
  }
  err = engraveScore(w, pieceScore.String(), piece.File, ec.PieceDir)
  if err != nil {
    return err
  }
  if ec.Optimize {
    err := optimizeScore(w, piece.File, ec.PieceDir)
    if err != nil {
      return err
    }
  }
  return nil
}

func receiveAndEngravePieces(
  ctx context.Context, pieceCh <-chan cat.Piece, errorCh chan<- error,
  tplPool *sync.Pool, ec EngraveCommand,
) {
  defer close(errorCh)
  var w strings.Builder
  for {
    select {
    case <- ctx.Done():
      return
    case piece, open := <- pieceCh:
      if !open {
        return
      }
      w.Reset()
      err := engravePiece(&w, tplPool, piece, ec)
      fmt.Print(w.String())
      if err != nil {
        errorCh <- err
        pieceCh = nil // do not engrave pieces after an error
      }
    }
  }
}

func engravePieces(pieces []cat.Piece, ec EngraveCommand) error {
  _, err := makeTemplate(ec.SourceDir, "piece.ly") // validate template
  if err != nil {
    return err
  }
  var tplPool = sync.Pool{
    New: func() any {
      tpl, _ := makeTemplate(ec.SourceDir, "piece.ly")
      return tpl
    },
  }
  ctx, cancel := context.WithCancel(context.Background())
  defer cancel()
  n := min(len(pieces), runtime.GOMAXPROCS(0))
  pieceCh := make(chan cat.Piece)
  errorChs := make([]chan error, n)
  for i := range n { // fan-out pieces
    errorChs[i] = make(chan error)
    go receiveAndEngravePieces(ctx, pieceCh, errorChs[i], &tplPool, ec)
  }
  errorCh := cat.FanIn(errorChs) // fan-in pieces
  go func() {
    pieces: for _, piece := range pieces {
      select {
      case <- ctx.Done():
        break pieces
      case pieceCh <- piece:
      }
    }
    close(pieceCh)
  }()
  var firstErr error
  for err := range errorCh {
    if firstErr == nil {
      cancel()
      firstErr = err // capture the first error
    }
  }
  return firstErr
}
