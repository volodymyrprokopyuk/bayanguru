package score

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"regexp"
	"strings"

	"github.com/volodymyrprokopyuk/bayanguru/cli/catalog"
)

type lyLine struct {
  num int
  text string
}

func rawLines(pieceFile string) ([]lyLine, error) {
  file, err := os.Open(pieceFile)
  if err != nil {
    return nil, err
  }
  defer file.Close()
  num := 1
  lines := make([]lyLine, 0, 300)
  sca := bufio.NewScanner(file)
  for sca.Scan() {
    line := lyLine{num: num, text: sca.Text()}
    lines = append(lines, line)
    num++
  }
  err = sca.Err()
  if err != nil {
    return nil, err
  }
  return lines, nil
}

var (
  reClefOttava = regexp.MustCompile(
    `(\S*) (:?\\clef (:?treble|bass)|\\ottava #\d) (\S*)`,
  )
  reNoteOrChord = regexp.MustCompile(`^<?[a-g]`)
  reChordEnd = regexp.MustCompile(`[a-g](:?es|is){0,2}[']*>`)
)

func lintClefOttavaOctaveCheck(lines []lyLine) []lyLine {
  errors := make([]lyLine, 0, 10)
  for _, line := range lines {
    cleanLine := strings.ReplaceAll(line.text, " | ", " ")
    matches := reClefOttava.FindAllStringSubmatch(cleanLine, -1)
    for _, groups := range matches {
      left, all, right := groups[1], groups[0], groups[4]
      if (reNoteOrChord.MatchString(left) && !strings.Contains(left, "=") &&
        !reChordEnd.MatchString(left)) ||
        (reNoteOrChord.MatchString(right) && !strings.Contains(right, "=")) {
        errors = append(errors, lyLine{num: line.num, text: all})
      }
    }
  }
  return errors
}

var (
  reExcludeLine = regexp.MustCompile(strings.Join([]string{
    `^{{ define "\w+" }}$`,
    `^{{ end }}$`,
    `^\\accidentalStyle [-\w]+$`,
    `^\\relative {$|^}$`,
    `^\\lyr(:?One|Two|Three)Col`,
    `^\\(:?noPageBreak|pageBreak)`,
    `^ +{{ template "\w+" }}$`,
    `^ +\\tempo (?:\w+|"[^"]+")$`,
    `^ +\\clef (?:treble|bass)$`,
    `^ +\\key \w+ \\(?:major|minor)$`,
    `^ +\\time \d+/\d+$`,
    `^ +\\meter(?: Voice)? \d+/\d+`,
    `^ +\\repeat (?:volta|segno) \d {$|^ +}$`,
    `^ +\\alternative {$`,
    `^ +\\volta \d {$|^ +\\volta \d$`,
    `^ +\\(?:duo|trio) {$|^ +} {$`,
    `^ +\\set \w`,
    `^ +\\[-\w]+$`,
    ` \\section `,
    `font-size`}, "|"),
  )
  reRemoveKnownCmd = regexp.MustCompile(strings.Join([]string{
    `{{ template "[^"]+" (?:}})?`,
    `\\clef (?:treble|bass)`,
    `\\(?:partial|volta|rep) \d+`,
    `\\(?:tuplet|time) \d+/\d+`,
    `\\fixed c'?`,
    `\\(?:hide|omit) \S+`,
    `D\.C\. al`, `e poi`, `al Fine`} , "|"),
  )
  reRemoveOtherCmd = regexp.MustCompile(` \\[-\w]+`)
  reHasMusic = regexp.MustCompile(`[a-g]`)
)

func cleanLines(pieceFile string) ([]lyLine, error) {
  file, err := os.Open(pieceFile)
  if err != nil {
    return nil, err
  }
  defer file.Close()
  lines := make([]lyLine, 0, 300)
  num := 1
  sca := bufio.NewScanner(file)
  for sca.Scan() {
    line := sca.Text()
    if !reExcludeLine.MatchString(line) {
      cleanLine := reRemoveKnownCmd.ReplaceAllLiteralString(line, "")
      cleanLine = reRemoveOtherCmd.ReplaceAllLiteralString(cleanLine, "")
      cleanLine = strings.Trim(cleanLine, " ")
      if len(cleanLine) > 0 && reHasMusic.MatchString(cleanLine) {
        line := lyLine{num: num, text: strings.Trim(cleanLine, " ")}
        lines = append(lines, line)
      }
    }
    num++
  }
  if err := sca.Err(); err != nil {
    return nil, err
  }
  return lines, nil
}

var (
  reFirstNote = regexp.MustCompile(strings.Join([]string{
    `^[a-g]\S*`, // first note
    `^<[a-g][^>]+>\S*`, // first chord
  }, "|"))
  reOctaveCheck = regexp.MustCompile(strings.Join([]string{
    `^[a-g](?:es|is){0,2}[,']*=[,']*\d+`, // valid first note
    `^<[a-g](?:es|is){0,2}[,']*=[^>]+>\d+`, // valid first chord
    `^[a-g](?:es|is){0,2}[+@Mm7d]`, // valid Stradella chord (no octave check)
  }, "|"))
)

func lintFirstNoteOctaveCheck(lines []lyLine) []lyLine {
  errors := make([]lyLine, 0, 10)
  for _, line := range lines {
    fstNote := reFirstNote.FindString(line.text)
    if len(fstNote) > 0 {
      if !reOctaveCheck.MatchString(fstNote) {
        errors = append(errors, lyLine{num: line.num, text: fstNote})
      }
    }
  }
  return errors
}

var reNewContext = regexp.MustCompile(strings.Join([]string{
  "(?:{ |w `)[a-g]\\S*", // first note in new context
  "(?:{ |w `)<[a-g][^>]+>\\S*", // first chord in new context
}, "|"))

func lintNewContextOctaveCheck(lines []lyLine) []lyLine {
  errors := make([]lyLine, 0, 10)
  for _, line := range lines {
    fstNote := reNewContext.FindString(line.text)
    if len(fstNote) > 0 {
      if !reOctaveCheck.MatchString(strings.TrimLeft(fstNote, "{ w`")) {
        errors = append(errors, lyLine{num: line.num, text: fstNote})
      }
    }
  }
  return errors
}

var reBarCheck = regexp.MustCompile(strings.Join([]string{
  `(?:\||"\|\|"|"\|\.")(?: })?$`, // | or | }
  "(?:`|" + `}}|%)$`, // ` or }} or %
}, "|"))

func lintLineEndBarCheck(lines []lyLine) []lyLine {
  errors := make([]lyLine, 0, 10)
  for _, line := range lines {
    if !reBarCheck.MatchString(line.text) {
      suffix := 0
      if len(line.text) > 4 {
        suffix = len(line.text) - 4
      }
      errors = append(errors, lyLine{num: line.num, text: line.text[suffix:]})
    }
  }
  return errors
}

var (
  reNoteChord = regexp.MustCompile(strings.Join([]string{
    `\b[a-g]\S*`, // first note
    `<[a-g][^>]+>\S*`, // first chord
  }, "|"))
  reNoteComponents = regexp.MustCompile(strings.Join([]string{
    `(?:^[a-g](?:es|is){0,2}[,']{0,4}=?[,']{0,4}`, // either note
    `|^<[a-g][^>]+>`, // or chord
     // or Stradella chord
    `|^(?:[a-g](?:es|is){0,2}\+)?[a-g](?:es|is){0,2}@?[Mm7d]!?)`,
    `\d{0,2}\.{0,2}[\[\]]?`, // duration + beaming
    `(?:[_^]?\\?[()]|[_^]?~){0,2}`, // slurs + ties
    `(?:-[-.>]){0,2}`, // articulations
    `(?:\\[ms]?[pf]{1,3})?`, // dynamic
    `(?:\\[<>])?`, // hairpin
    `(?:[-^_]\\\w+){0,2}`, // markup
  }, "") + `$`)
)

func lintNoteComponentOrder(lines []lyLine) []lyLine {
  errors := make([]lyLine, 0, 10)
  for _, line := range lines {
    notes := reNoteChord.FindAllString(line.text, -1)
    for _, note := range notes {
      note = strings.ReplaceAll(note, "`)", "")
      note = strings.ReplaceAll(note, "`", "")
      if !reNoteComponents.MatchString(note) {
        errors = append(errors, lyLine{num: line.num, text: note})
      }
    }
  }
  return errors
}

var (
  reBoundChord = regexp.MustCompile(`@[Mm7d]\S+ `)
  reNoteDuration = regexp.MustCompile(strings.Join([]string{
    `^\S+[123468]`, // next note with duration
    `^[\.<][a-g]`, // skip {{ .a }}, <c e>8
  }, "|"))
)

func lintDurationAfterBoundChord(lines []lyLine) []lyLine {
  errors := make([]lyLine, 0, 10)
  for _, line := range lines {
    chords := reBoundChord.FindAllStringIndex(line.text, -1)
    for _, idx := range chords {
      chord := line.text[idx[0]:idx[1]]
      nextNote := line.text[idx[1]:]
      nextNote = strings.TrimLeft(nextNote, " {|}%")
      if len(nextNote) > 0 && !reNoteDuration.MatchString(nextNote) {
        errors = append(errors, lyLine{num: line.num, text: chord})
      }
    }
  }
  return errors
}

func printErrors(w io.Writer, title string, errors []lyLine) {
  fmt.Fprintf(w, "%s\n", catalog.YellowSub(title))
  for _, error := range errors {
    err := strings.ReplaceAll(error.text, "%", "%%")
    fmt.Fprintf(
      w, "%s %s\n", catalog.BlueSub("%3d:", error.num), catalog.RedSub(err),
    )
  }
}

func lintPiece(w io.Writer, piece catalog.Piece, sourceDir string) error {
  pieceFile := filepath.Join(sourceDir, piece.Src, piece.File + ".ly")
  fmt.Fprintf(w, "%s %s\n", catalog.GreenSub("lint"), catalog.BlueSub(pieceFile))
  hasErrors := false
  lines, err := rawLines(pieceFile)
  if err != nil {
    return err
  }
  errors := lintClefOttavaOctaveCheck(lines)
  if len(errors) > 0 {
    printErrors(w, "* Missing octave checks around clef or ottava", errors)
    hasErrors = true
  }
  lines, err = cleanLines(pieceFile)
  if err != nil {
    return err
  }
  errors = lintFirstNoteOctaveCheck(lines)
  if len(errors) > 0 {
    printErrors(w, "* Missing first note octave check or duration", errors)
    hasErrors = true
  }
  errors = lintNewContextOctaveCheck(lines)
  if len(errors) > 0 {
    printErrors(w, "* Missing new context octave check or duration", errors)
    hasErrors = true
  }
  errors = lintLineEndBarCheck(lines)
  if len(errors) > 0 {
    printErrors(w, "* Missing line end bar check", errors)
    hasErrors = true
  }
  errors = lintNoteComponentOrder(lines)
  if len(errors) > 0 {
    printErrors(w, `* Unordered note components e.g. c'='4[(-.\mf\<^\tRit`, errors)
    hasErrors = true
  }
  errors = lintDurationAfterBoundChord(lines)
  if len(errors) > 0 {
    printErrors(w, "* Missing explicit duration after bound chord", errors)
    hasErrors = true
  }
  if hasErrors {
    return fmt.Errorf("piece %s has linting errors", piece.ID)
  }
  return nil
}
