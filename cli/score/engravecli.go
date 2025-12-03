package score

import (
	"context"
	"errors"

	"github.com/urfave/cli/v3"
	"github.com/volodymyrprokopyuk/bayanguru/cli/catalog"
)

const pieAll = "all"

func engraveAction(ctx context.Context, cmd *cli.Command) error {
  cat := cmd.String("catalog")
  book := cmd.Bool("book")
  init := cmd.Bool("init")
  lyr := cmd.Bool("lyr")
  lint := cmd.Bool("lint")
  optimize := cmd.Bool("optimize")
  meta := cmd.Bool("meta")
  lyrics := cmd.Bool("lyrics")
  args := cmd.Args()
  err := catalog.ValidateReq(cat, args.Slice())
  if err != nil {
    return err
  }
  if init && args.Len() > 1 ||
    init && args.Len() == 1 && args.First() == pieAll {
    return errors.New("cannot initialize more than one piece")
  }
  if book && init {
    return errors.New("cannot initialize a book")
  }
  ec := &engraveCommand{
    BaseCmd: &catalog.BaseCmd{
      CatalogDir: catalog.CatalogDir, BookFile: catalog.BookFile,
      SourceDir: catalog.SourceDir, PieceDir: catalog.PieceDir,
      BookDir: catalog.BookDir, Catalog: cat, Book: book,
    },
    init: init, lyr: lyr, lint: lint, optimize: optimize,
    meta: meta, lyrics: lyrics,
  }
  if ec.Book {
    ec.BookIDs = args.Slice()
  } else {
    ec.PieceIDs = args.Slice()
  }
  ec.Queries, err = catalog.ValidateQueries(cmd)
  if err != nil {
    return err
  }
  return engrave(ec)
}

func EngraveCmd() *cli.Command {
  cmd := &cli.Command{
    Name: "engrave",
    Usage: "Engrave pieces and books",
    Description:
`Engrave command initializes, lints, engraves, and optimizes pieces and books`,
    ArgsUsage:
`
   bayanguru engrave [-c catalog] pieces... [--init] [--lyr] [--query...]
   bayanguru engrave [-c catalog] --book books...
   bayanguru engrave all --lint --optimize --meta --lyrics=f [--query...]`,
    Action: engraveAction,
  }
  cmd.Flags = []cli.Flag{
    &cli.StringFlag{
      Name: "catalog", Usage: "read catalog files", Aliases: []string{"c"},
    },
    &cli.BoolFlag{
      Name: "book", Usage: "engrave books", Aliases: []string{"b"},
    },
    &cli.BoolFlag{
      Name: "init", Usage: "initialize a new piece from template",
      Aliases: []string{"i"},
    },
    &cli.BoolFlag{
      Name: "lyr", Usage: "initialize lyrics for a piece (requires --init)",
    },
    &cli.BoolFlag{
      Name: "lint", Usage: "lint piece source code before engraving",
      Aliases: []string{"l"},
    },
    &cli.BoolFlag{
      Name: "optimize", Usage: "optimize piece PDF after engraving",
      Aliases: []string{"o"},
    },
    &cli.BoolFlag{
      Name: "meta", Usage: "include piece meta information below title",
    },
    &cli.BoolFlag{
      Name: "lyrics", Usage: "include lyrics after piece score", Value: true,
    },
  }
  for name, usage := range catalog.Queries {
    flag := &cli.StringFlag{Name: name, Usage: usage}
    cmd.Flags = append(cmd.Flags, flag)
  }
  return cmd
}
