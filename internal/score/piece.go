package score

import (
  "fmt"
  "strings"
  "text/template"
  "io"
  "path/filepath"
  "os"
  "os/exec"
  sty "github.com/volodymyrprokopyuk/bayan/internal/style"
  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
)

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
  fmt.Printf("%v %v\n", sty.ID("init"), sty.Tit(pieceFile))
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
  var score strings.Builder
  err = tpl.Execute(&score, piece)
  if err != nil {
    return "", err
  }
  return score.String(), nil
}

func engravePiece(piece cat.Piece, pieceScore, pieceDir string) error {
  piecePDF := filepath.Join(pieceDir, piece.File)
  fmt.Printf("%v %v\n", sty.ID("engrave"), sty.Tit(piecePDF + ".pdf"))
  lyCmd := exec.Command(
    "lilypond", "-d", "backend=cairo", "-f", "pdf", "-o", piecePDF, "-",
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
    pieceScore, err := templatePiece(tpl, piece, sourceDir)
    if err != nil {
      return err
    }
    err = engravePiece(piece, pieceScore, pieceDir)
    if err != nil {
      return err
    }
    if ec.Optimize {
      err = optimizeScore(pieceDir, piece.File)
      if err != nil {
        return err
      }
    }
  }
  return nil
}
