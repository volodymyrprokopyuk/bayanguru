package site

import (
  "fmt"
  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
)

type PublishCommand struct {
  CatalogDir, BookFile, PieceDir, BookDir string
  Catalog string
  All, Book bool
  Random, List bool
  Pieces, Books []string
  Queries cat.PieceQueries
}

func Publish(pc PublishCommand) error {
  fmt.Println(pc)
  return nil
}
