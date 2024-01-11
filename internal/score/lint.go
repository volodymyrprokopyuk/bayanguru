package score

import (
  "fmt"
  "strings"
  "regexp"
  "path/filepath"
  "os"
  "bufio"
  sty "github.com/volodymyrprokopyuk/bayan/internal/style"
  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
)

type Line struct {
  Num int
  Text string
}

var excludeParts = []string{
  `^{{ define "\w+" }}$`,
  `^{{ end }}$`,
  `^\\relative {$|^}$`,
  `^ +{{ template "\w+" }}$`,
  `^ +\\tempo (?:\w+|"[^"]+")$`,
  `^ +\\clef (?:treble|bass)$`,
  `^ +\\key \w+ \\(?:major|minor)$`,
  `^ +\\time \d+/\d+$`,
  `^ +\\meter \d+/\d+`,
  `^ +\\repeat (?:volta|segno) \d {$|^ +}$`,
  `^ +\\alternative {$`,
  `^ +\\volta \d {$|^ +\\volta \d$`,
  `^ +\\(?:duo|trio) {$|^ +} {$`,
  `^ +\\set \w`,
  `^ +\\\w+$`,
}
var excludeLine = regexp.MustCompile(strings.Join(excludeParts, "|"))
var removeParts = []string{
  `{{ template "[^"]+" (?:}})?`,
  `\\clef (?:treble|bass)`,
  `\\(?:partial|volta|rep) \d+`,
  `\\(?:tuplet|time) \d+/\d+`,
  `\\af \d{1,2}\.{0,2}(?:\\!)?`,
  ` \\(?:once|acc|grace|stemUp|stemDown|bar)`,
  ` \\(?:duo|trio|hSpace|sSlur)`,
  `(?:bs|dt) \. |(?:fu|fd|bu|bd) #'`, // \sSlur
}
var removeCommand = regexp.MustCompile(strings.Join(removeParts, "|"))
var hasMusic = regexp.MustCompile(`[a-g]`)

func cleanLines(pieceFile string) ([]Line, error) {
  file, err := os.Open(pieceFile)
  if err != nil {
    return nil, err
  }
  defer file.Close()
  lines := make([]Line, 0, 1000)
  num := 1
  scanner := bufio.NewScanner(file)
  for scanner.Scan() {
    line := scanner.Text()
    if !excludeLine.MatchString(line) {
      cleanLine := removeCommand.ReplaceAllLiteralString(line, "")
      cleanLine = strings.Trim(cleanLine, " ")
      if len(cleanLine) > 0 && hasMusic.MatchString(cleanLine) {
        line := Line{num, strings.Trim(cleanLine, " ")}
        lines = append(lines, line)
        // fmt.Printf("%3v: %v\n", line.Num, line.Text)
      }
    }
    num++
  }
  if err := scanner.Err(); err != nil {
    return nil, err
  }
  return lines, nil
}

var firstParts = []string{
  `^[a-g]\S*`, // first note
  `^<[a-g][^>]+>\S*`, // first chord
}
var firstNote = regexp.MustCompile(strings.Join(firstParts, "|"))
var octaveParts = []string{
  `^[a-g](?:es|is){0,2}[,']*=[,']*\d+`, // valid first note
  `^<[a-g](?:es|is){0,2}[,']*=[^>]+>\d+`, // valid first chord
  `^[a-g](?:es|is){0,2}[+@Mm7d]`, // valid Stradella chord (no octave check)
}
var octaveCheck = regexp.MustCompile(strings.Join(octaveParts, "|"))

func lintFirstNoteOctaveCheck(lines []Line) []Line {
  errors := make([]Line, 0, 50)
  for _, line := range lines {
    fstNote := firstNote.FindString(line.Text)
    if len(fstNote) > 0 {
      if !octaveCheck.MatchString(fstNote) {
        errors = append(errors, Line{line.Num, fstNote})
      }
    }
  }
  return errors
}

var newParts = []string{
  "(?:{ |w `)[a-g]\\S*", // first note in new context
  "(?:{ |w `)<[a-g][^>]+>\\S*", // first chord in new context
}
var newContext = regexp.MustCompile(strings.Join(newParts, "|"))

func lintNewContextOctaveCheck(lines []Line) []Line {
  errors := make([]Line, 0, 50)
  for _, line := range lines {
    fstNote := newContext.FindString(line.Text)
    if len(fstNote) > 0 {
      if !octaveCheck.MatchString(strings.TrimLeft(fstNote, "{ w`")) {
        errors = append(errors, Line{line.Num, fstNote})
      }
    }
  }
  return errors
}

var endParts = []string{
  `(?:\||"\|\|"|"\|\.")(?: })?$`, // | or | }
  `(?:}}|%)$`, // }} or %
}
var barCheck = regexp.MustCompile(strings.Join(endParts, "|"))

func lintLineEndBarCheck(lines []Line) []Line {
  errors := make([]Line, 0, 50)
  for _, line := range lines {
    if !barCheck.MatchString(line.Text) {
      suffix := 0
      if len(line.Text) > 4 {
        suffix = len(line.Text) - 4
      }
      errors = append(errors, Line{line.Num, line.Text[suffix:]})
    }
  }
  return errors
}

var noteParts = []string{
  `[a-g]\S*`, // first note
  `<[a-g][^>]+>\S*`, // first chord
}
var noteChord = regexp.MustCompile(strings.Join(noteParts, "|"))
var compParts = []string{
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
}
var noteComponents = regexp.MustCompile(strings.Join(compParts, "") + `$`)

func lintNoteComponentOrder(lines []Line) []Line {
  errors := make([]Line, 0, 50)
  for _, line := range lines {
    notes := noteChord.FindAllString(line.Text, -1)
    for _, note := range notes {
      note = strings.ReplaceAll(note, "`)", "")
      note = strings.ReplaceAll(note, "`", "")
      if !noteComponents.MatchString(note) {
        errors = append(errors, Line{line.Num, note})
      }
    }
  }
  return errors
}

var boundChord = regexp.MustCompile(`@[Mm7d]\S+ `)
var durationParts = []string{
  `^\S+[123468]`, // next note with duration
  `^\.[a-g]`, // {{ .a }}
}
var noteDuration = regexp.MustCompile(strings.Join(durationParts, "|"))

func lintDurationAfterBoundChord(lines []Line) []Line {
  errors := make([]Line, 0, 50)
  for _, line := range lines {
    chords := boundChord.FindAllStringIndex(line.Text, -1)
    for _, idx := range chords {
      chord := line.Text[idx[0]:idx[1]]
      nextNote := line.Text[idx[1]:]
      nextNote = strings.TrimLeft(nextNote, " {|}")
      if len(nextNote) > 0 && !noteDuration.MatchString(nextNote) {
        errors = append(errors, Line{line.Num, chord})
      }
    }
  }
  return errors
}

func printErrors(title string, errors []Line) {
  fmt.Println(sty.Com(title))
  for _, error := range errors {
    err := strings.ReplaceAll(error.Text, "%", "%%")
    fmt.Println(sty.Lvl("%3v:", error.Num), sty.Bss(err))
  }
}

func lintPiece(piece cat.Piece, sourceDir string) error {
  pieceFile := filepath.Join(sourceDir, piece.Src, piece.File + ".ly")
  fmt.Printf("%v %v\n", sty.Org("lint"), sty.Lvl(pieceFile))
  lines, err := cleanLines(pieceFile)
  if err != nil {
    return err
  }
  hasErrors := false
  errors := lintFirstNoteOctaveCheck(lines)
  if len(errors) > 0 {
    printErrors("* Missing first note octave check or duration", errors)
    hasErrors = true
  }
  errors = lintNewContextOctaveCheck(lines)
  if len(errors) > 0 {
    printErrors("* Missing new context octave check or duration", errors)
    hasErrors = true
  }
  errors = lintLineEndBarCheck(lines)
  if len(errors) > 0 {
    printErrors("* Missing line end bar check", errors)
    hasErrors = true
  }
  errors = lintNoteComponentOrder(lines)
  if len(errors) > 0 {
    printErrors(`* Unordered note components e.g. c'='4[(-.\mf\<^\tRit`, errors)
    hasErrors = true
  }
  errors = lintDurationAfterBoundChord(lines)
  if len(errors) > 0 {
    printErrors("* Missing explicit duration after bound chord", errors)
    hasErrors = true
  }
  if hasErrors {
    return fmt.Errorf("piece %v has linting errors", piece.ID)
  }
  return nil
}
