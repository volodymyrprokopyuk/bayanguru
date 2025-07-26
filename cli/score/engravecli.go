package score

import (
	"context"
	"errors"

	"github.com/urfave/cli/v3"
	"github.com/volodymyrprokopyuk/bayanguru/cli/catalog"
)

func engraveAction(ctx context.Context, cmd *cli.Command) error {
  cat := cmd.String("catalog")
  book := cmd.Bool("book")
  piece := cmd.Bool("piece")
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
    init && args.Len() == 1 && args.First() == "all" {
    return errors.New("cannot initialize more than one piece")
  }
  if book && init {
    return errors.New("cannot initialize a book")
  }
  if !book && piece {
    return errors.New("at least one book is required")
  }
  ec := engraveCommand{
    BaseCmd: catalog.BaseCmd{
      CatalogDir: catalog.CatalogDir, BookFile: catalog.BookFile,
      SourceDir: catalog.SourceDir, PieceDir: catalog.PieceDir,
      BookDir: catalog.BookDir, Catalog: cat, Book: book,
    },
    piece: piece, init: init, lyr: lyr, lint: lint, optimize: optimize,
    meta: meta, lyrics: lyrics,
  }
  if ec.Book {
    ec.BookIDs = args.Slice()
  } else {
    ec.PieceIDs = args.Slice()
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
   bayanguru engrave [-c catalog] pieces... [--init]
   bayanguru engrave [-c catalog] -b books... [--piece]
   bayanguru engrave all --lint --optimize --meta=f --lyrics=f`,
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
      Name: "piece", Usage: "engrave individual pieces from books",
      Aliases: []string{"p"},
    },
    &cli.BoolFlag{
      Name: "init", Usage: "initialize a new piece", Aliases: []string{"i"},
    },
    &cli.BoolFlag{
      Name: "lyr", Usage: "initialize lyrics for a piece",
    },
    &cli.BoolFlag{
      Name: "lint", Usage: "lint pieces before engraving", Aliases: []string{"l"},
    },
    &cli.BoolFlag{
      Name: "optimize", Usage: "optimize PDF after engraving", Aliases: []string{"o"},
    },
    &cli.BoolFlag{
      Name: "meta", Usage: "include piece meta information", Value: true,
    },
    &cli.BoolFlag{
      Name: "lyrics", Usage: "include lyrics into pieces", Value: true,
    },
  }
  return cmd
}
