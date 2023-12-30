package catalog

type PlayCommand struct {
  Catalog string
  Book, Cycle, Random, List, All bool
  Pieces, Books []string
  Queries map[string]string
}
