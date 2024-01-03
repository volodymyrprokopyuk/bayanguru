package score

import (
  "fmt"
)

type EngraveCommand struct {
  Catalog string
  All, Book, Piece bool
  Init, Lint, Optimize, Meta bool
  Pieces, Books []string
}

func Engrave (ec EngraveCommand) error {
  fmt.Println(ec)
  return nil
}
