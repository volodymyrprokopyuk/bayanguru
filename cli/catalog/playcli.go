package catalog

import (
	"context"
	"fmt"
	"regexp"
	"slices"

	"github.com/urfave/cli/v3"
)

const (
  CatalogDir = "catalog"
  BookFile = "books.yaml"
  SourceDir = "source"
  PieceDir = "piece"
  BookDir = "book"
  PlayedFile = ".played"
)

var Queries = map[string]string{
  "tit": "piece title",
  "com": "piece composer",
  "arr": "piece arranger",
  "art": "arrangement type",
  "aut": "lyrics author",
  "lcs": "piece license",
  "org": "piece origin",
  "sty": "piece style",
  "gnr": "piece genre",
  "ton": "piece tonality",
  "frm": "piece form",
  "bss": "piece bass",
  "lvl": "piece level",
  "ens": "piece ensemble",
  "lyr": "piece lyrics",
}

var reCatalog = regexp.MustCompile(`^\w+(?:-\w+)?$`)

func ValidateReq(catalog string, args []string) error {
  if len(catalog) > 0 && !reCatalog.MatchString(catalog) {
    return fmt.Errorf("invalid catalog %s", catalog)
  }
  if len(args) == 0 {
    return fmt.Errorf("at least one piece or book is required")
  }
  if len(args) > 1 && slices.Contains(args, "all") {
    return fmt.Errorf("all is mutually exclusive with pieces and books")
  }
  for _, arg := range args {
    if arg != "all" && !reID.MatchString(arg) {
      return fmt.Errorf("invalid ID %s", arg)
    }
  }
  return nil
}

var reQuery = regexp.MustCompile(`^\^?\pL+(?:,\pL+)*$`)

func ValidateQueries(cmd *cli.Command) (map[string]string, error) {
  queries := make(map[string]string, len(Queries))
  for name := range Queries {
    query := cmd.String(name)
    if len(query) > 0 {
      if !reQuery.MatchString(query) {
        return nil, fmt.Errorf("invalid query --%s %s", name, query)
      }
      queries[name] = query
    }
  }
  return queries, nil
}

func playAction(ctx context.Context, cmd *cli.Command) error {
  cat := cmd.String("catalog")
  book := cmd.Bool("book")
  random := cmd.Bool("random")
  list := cmd.Bool("list")
  args := cmd.Args()
  err := ValidateReq(cat, args.Slice())
  if err != nil {
    return err
  }
  pc := playCmd{
    BaseCmd: BaseCmd{
      CatalogDir: CatalogDir, BookFile: BookFile, PieceDir: PieceDir,
      BookDir: BookDir, Catalog: cat, Book: book,
    },
    random: random, list: list,
  }
  if pc.Book {
    pc.BookIDs = args.Slice()
  } else {
    pc.PieceIDs = args.Slice()
  }
  pc.Queries, err = ValidateQueries(cmd)
  if err != nil {
    return err
  }
  return play(pc)
}

func PlayCmd() *cli.Command {
  cmd := &cli.Command{
    Name: "play",
    Usage: "Play pieces from a catalog or a book",
    Description:
`Play command searches, lists, and plays pieces from a catalog or a book`,
    ArgsUsage:
`
   bayanguru play [-c catalog] pieces...
   bayanguru play [-c catalog] -b books... [--query...]
   bayanguru play all --random --list [--query...]`,
    Action: playAction,
  }
  cmd.Flags = []cli.Flag{
    &cli.StringFlag{
      Name: "catalog", Usage: "read catalog files", Aliases: []string{"c"},
    },
    &cli.BoolFlag{
      Name: "book", Usage: "play pieces from books", Aliases: []string{"b"},
    },
    &cli.BoolFlag{
      Name: "random", Usage: "play pieces in random", Aliases: []string{"r"},
    },
    &cli.BoolFlag{
      Name: "list", Usage: "list pieces without playing", Aliases: []string{"l"},
    },
  }
  for name, usage := range Queries {
    flag := &cli.StringFlag{Name: name, Usage: usage}
    cmd.Flags = append(cmd.Flags, flag)
  }
  return cmd
}
