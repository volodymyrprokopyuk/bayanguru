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
  SiteDir = "site"
)

var Queries = map[string]string{
  "tit": "piece title",
  "com": "piece composer",
  "arr": "piece arranger",
  "art": "arrangement type",
  "aut": "lyrics author",
  "lcs": "piece license e.g. cpl,cpr",
  "org": "piece origin e.g. ukr,rus",
  "sty": "piece style e.g. flk,cls",
  "gnr": "piece genre e.g. sng,stu",
  "ton": "piece tonality e.g. cmj,ami",
  "frm": "piece form e.g. mel,var",
  "bss": "piece bass e.g. stb,frb",
  "lvl": "piece level e.g. ela,inb",
  "ens": "piece ensemble e.g. duo,vc1",
  "lyr": "piece lyrics e.g. lyr",
}

var reQuery = regexp.MustCompile(`^\^?\pL[-\pL,]*[^,]$`)
var reID = regexp.MustCompile(`^[0-9a-z]{4}$`)

func ValidateReq(catalog string, args []string) error {
  if len(catalog) > 0 && !reQuery.MatchString(catalog) {
    return fmt.Errorf("valid pattern ukr-cls or ^rus,blr, got -c %v", catalog)
  }
  if len(args) == 0 {
    return fmt.Errorf("at least one piece or book is required, got none")
  }
  if len(args) > 1 && slices.Contains(args, "all") {
    return fmt.Errorf("either all or pieces and books, got %v", args)
  }
  for _, arg := range args {
    if !reID.MatchString(arg) && arg != "all" {
      return fmt.Errorf("valid ID [0-9a-z]{4} or all, got %v", arg)
    }
  }
  return nil
}

func ValidateQueries(cmd *cli.Command) (map[string]string, error) {
  queries := make(map[string]string, len(Queries))
  for name := range Queries {
    query := cmd.String(name)
    if len(query) > 0 {
      if !reQuery.MatchString(query) {
        return nil, fmt.Errorf(
          "valid pattern ukr,stu or ^rus,blr, got --%v %v", name, query,
        )
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
  pc := PlayCommand{
    CatalogDir: CatalogDir, BookFile: BookFile, PieceDir: PieceDir,
    BookDir: BookDir, Catalog: cat,
    All: args.Len() == 1 && args.First() == "all",
    Book: book, Random: random, List: list,
  }
  if !pc.All {
    if book {
      pc.Books = args.Slice()
    } else {
      pc.Pieces = args.Slice()
    }
  }
  pc.Queries, err = ValidateQueries(cmd)
  if err != nil {
    return err
  }
  return Play(pc)
}

func PlayCmd() *cli.Command {
  cmd := &cli.Command{
    Name: "play",
    Usage: "Play pieces from a catalog or a book",
    Description:
`Play command searches, lists, and plays pieces from a catalog or a book`,
    ArgsUsage:
`bayanguru play [-c catalog] pieces...
bayanguru play [-c catalog] -b books... [--query...]
bayanguru play all --query... --random --list
`,
    Action: playAction,
  }
  cmd.Flags = []cli.Flag{
    &cli.StringFlag{
      Name: "catalog", Usage: "read catalog files e.g. ukr,rus, ^stu,sch",
      Aliases: []string{"c"},
    },
    &cli.BoolFlag{
      Name: "book", Usage: "play pieces from books",
      Aliases: []string{"b"},
    },
    &cli.BoolFlag{
      Name: "random", Usage: "play pieces in a random order",
      Aliases: []string{"r"},
    },
    &cli.BoolFlag{
      Name: "list", Usage: "list pieces without playing",
      Aliases: []string{"l"},
    },
  }
  for name, usage := range Queries {
    flag := &cli.StringFlag{Name: name, Usage: usage}
    cmd.Flags = append(cmd.Flags, flag)
  }
  return cmd
}
