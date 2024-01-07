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
  `^{{ (?:define|end).* }}$`,
  `^\\relative {$|^}$`,
  `^ +{{ template "\w+" }}$`,
  `^ +\\tempo (?:\w+|"[^"]+")$`,
  `^ +\\clef (?:treble|bass)$`,
  `^ +\\key \w+ \\(?:major|minor)$`,
  `^ +\\time \d+/\d+$`,
  `^ +\\repeat (?:volta|segno) \d {$|^ +}$`,
  `^ +\\alternative {$`,
  `^ +\\volta \d {$|^ +\\volta \d$`,
  `^ +\\meter \d+/\d+ .+$`,
  `^ +\\(?:duo|trio) {$|^ +} {$`,
  `^ +\\(?:set|override) .+$`,
  `^ +\\\w+$`, // \command
  `^$`, // empty line
}
var excludeLine = regexp.MustCompile(strings.Join(excludeParts, "|"))
var removeParts = []string{
  ` \\clef (?:treble|bass)`,
  ` \\(?:partial|volta|rep) \d+`,
  ` \\(?:tuplet) \d+/\d+`,
  ` \\af \d{1,2}\\!`,
  ` {{ template "[^"]+" [}]{0,2}`,
  ` \\\w+`, // \command
}
var removeCommand = regexp.MustCompile(strings.Join(removeParts, "|"))

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
      lines = append(lines, Line{num, strings.Trim(cleanLine, " ")})
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
  `^<[^>]+>\S*`, // first chord
}
var firstNote = regexp.MustCompile(strings.Join(firstParts, "|"))
var octaveParts = []string{
  `^[a-g](?:es|is){0,2}[,']*=[,']*\d+`, // valid first note
  `^<[a-g](?:es|is){0,2}[,']*=[^>]+>\d+`, // valid first chord
  `^[a-g](?:es|is){0,2}[+@Mm7d]`, // valid Stradella chord
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
  "(?:{ |w `)[a-g]\\S*", // first note
  "(?:{ |w `)<[^>]+>\\S*", // first chord
}
var newContext = regexp.MustCompile(strings.Join(newParts, "|"))

func lintNewContextOctaveCheck(lines []Line) []Line {
  errors := make([]Line, 0, 50)
  for _, line := range lines {
    // fmt.Printf("%3v: %v\n", line.Num, line.Text)
    fstNote := newContext.FindString(line.Text)
    if len(fstNote) > 0 {
      if !octaveCheck.MatchString(strings.TrimLeft(fstNote, "{ w`")) {
        // fmt.Println("    ", sty.Bss(fstNote))
        errors = append(errors, Line{line.Num, fstNote})
      }
    }
  }
  return errors
}

func printErrors(title string, errors []Line) {
  fmt.Println(sty.Com(title))
  for _, error := range errors {
    fmt.Println(sty.Lvl("%v:", error.Num), sty.Bss(error.Text))
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
  if hasErrors {
    return fmt.Errorf("piece %v has linting errors", piece.ID)
  }
  return nil
}
