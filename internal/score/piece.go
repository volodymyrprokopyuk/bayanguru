package score

import (
  "fmt"
  "strings"
  "regexp"
  "text/template"
  "io"
  "path/filepath"
  "os"
  "os/exec"
  sty "github.com/volodymyrprokopyuk/bayan/internal/style"
  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
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
  initFile := filepath.Join(sourceDir, "template", "init.ly")
  _, err = copyFile(initFile, pieceFile)
  if err != nil {
    return err
  }
  fmt.Printf("%v %v\n", sty.Org("init"), sty.Lvl(pieceFile))
  return nil
}

func templatePiece(
  tpl *template.Template, piece cat.Piece, sourceDir string,
) (string, error) {
  pieceFile := filepath.Join(sourceDir, piece.Src, piece.File + ".ly")
  _, err := tpl.ParseFiles(pieceFile)
  if err != nil {
    return "", err
  }
  var stNotation strings.Builder
  err = tpl.ExecuteTemplate(&stNotation, "leftHand", nil)
  if err != nil {
    return "", err
  }
  lyNotation := stradella(stNotation.String())
  var score strings.Builder
  err = tpl.Execute(
    &score, struct{ cat.Piece; StradellaLeftHand string}{piece, lyNotation},
  )
  if err != nil {
    return "", err
  }
  return score.String(), nil
}

func engravePiece(piece cat.Piece, pieceScore, pieceDir string) error {
  piecePDF := filepath.Join(pieceDir, piece.File)
  fmt.Printf("%v %v\n", sty.Org("engrave"), sty.Lvl(piecePDF + ".pdf"))
  lyCmd := exec.Command(
    "lilypond", "-d", "backend=cairo", "-f", "pdf", "-o", piecePDF, "-s", "-",
  )
  lyCmd.Stdin = strings.NewReader(pieceScore)
  lyCmd.Stdout = os.Stdout
  lyCmd.Stderr = os.Stderr
  return lyCmd.Run()
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
    if ec.Lint {
      err := lintPiece(piece, sourceDir)
      if err != nil {
        return err
      }
    }
    _ = tpl
    // pieceScore, err := templatePiece(tpl, piece, sourceDir)
    // if err != nil {
    //   return err
    // }
    // err = engravePiece(piece, pieceScore, pieceDir)
    // if err != nil {
    //   return err
    // }
    // if ec.Optimize {
    //   err = optimizeScore(pieceDir, piece.File)
    //   if err != nil {
    //     return err
    //   }
    // }
  }
  return nil
}
