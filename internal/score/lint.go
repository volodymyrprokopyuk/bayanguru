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
  `^ +\\time \d/\d$`,
  `^ +\\repeat (?:volta|segno) \d {$|^ +}$`,
  `^ +\\alternative {$`,
  `^ +\\volta \d {$|^ +\\volta \d$`,
  `^ +\\meter \d/\d .+$`,
  `^ +\\(?:duo|trio) {$|^ +} {$`,
  `^ +\\set .+$`,
  `^ +\\\w+$`,
  `^$`,
}
var excludeLine = regexp.MustCompile(strings.Join(excludeParts, "|"))
var removeParts = []string{
  `\\(?:volta|rep) \d{1,2} `,
  `\\af \d{1,2}\\! `,
  `\\(?:fine) `,
}
var removeCommand = regexp.MustCompile(strings.Join(removeParts, "|"))

func scoreLines(pieceFile string) ([]Line, error) {
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
      lines = append(lines, Line{num, cleanLine})
    }
    num++
  }
  if err := scanner.Err(); err != nil {
    return nil, err
  }
  return lines, nil
}

func lintPiece(piece cat.Piece, sourceDir string) error {
  pieceFile := filepath.Join(sourceDir, piece.Src, piece.File + ".ly")
  fmt.Printf("%v %v\n", sty.ID("lint"), sty.Tit(pieceFile))
  lines, err := scoreLines(pieceFile)
  if err != nil {
    return err
  }
  for _, line := range lines {
    fmt.Printf("%3v: %v\n", line.Num, line.Text)
  }
  return nil
}
