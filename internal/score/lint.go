package score

import (
  "fmt"
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

var excludeLine = regexp.MustCompile(`define|end`)

func lintPiece(piece cat.Piece, sourceDir string) error {
  pieceFile := filepath.Join(sourceDir, piece.Src, piece.File + ".ly")
  fmt.Printf("%v %v\n", sty.ID("lint"), sty.Tit(pieceFile))
  file, err := os.Open(pieceFile)
  if err != nil {
    return err
  }
  defer file.Close()
  lines, num := make([]Line, 0, 1000), 1
  scanner := bufio.NewScanner(file)
  for scanner.Scan() {
    line := scanner.Text()
    if !excludeLine.MatchString(line) {
      lines = append(lines, Line{num, line})
    }
    num++
  }
  if err := scanner.Err(); err != nil {
    return err
  }
  for _, line := range lines {
    fmt.Printf("%3v: %v\n", line.Num, line.Text)
  }
  return nil
}
