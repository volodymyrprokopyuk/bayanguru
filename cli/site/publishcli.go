package site

import (
	"context"

	"github.com/urfave/cli/v3"
	"github.com/volodymyrprokopyuk/bayanguru/cli/catalog"
)

const (
  SiteDir = "site"
  TemplateDir = "site/template"
  ContentDir = "site/content"
  PublicDir = "site/public"
  UploadURL = "bayanguru:bayanguru/score"
  ScoreURL = "https://score.bayanguru.org/score"
  PieceURL = "https://bayanguru.org/piece"
  PageSize = 24
)

func publishAction(ctx context.Context, cmd *cli.Command) error {
  cat := cmd.String("catalog")
  init := cmd.Bool("init")
  book := cmd.Bool("book")
  upload := cmd.Bool("upload")
  args := cmd.Args()
  err := catalog.ValidateReq(cat, args.Slice())
  if err != nil {
    return err
  }
  pc := &publishCommand{
    BaseCmd: &catalog.BaseCmd{
      CatalogDir: catalog.CatalogDir, BookFile: catalog.BookFile,
      SourceDir: catalog.SourceDir, PieceDir: catalog.PieceDir,
      BookDir: catalog.BookDir, Catalog: cat, Book: book,
    },
    siteDir: SiteDir, templateDir: TemplateDir, contentDir: ContentDir,
    publicDir: PublicDir, init: init, upload: upload,
    uploadURL: UploadURL, scoreURL: ScoreURL, pieceURL: PieceURL,
    pageSize: PageSize,
  }
  if pc.Book {
    pc.BookIDs = args.Slice()
  } else {
    pc.PieceIDs = args.Slice()
  }
  pc.Queries, err = catalog.ValidateQueries(cmd)
  if err != nil {
    return err
  }
  return publish(pc)
}

func PublishCmd() *cli.Command {
  cmd := &cli.Command{
    Name: "publish",
    Usage: "Publish pieces on the web",
    Description:
`Publish command uploads PDF pieces to a cloud storage, generates and publishes
a web site`,
    ArgsUsage:
`
   bayanguru publish [-c catalog] [--upload] pieces...
   bayanguru publish [-c catalog] -b books... [--query]
   bayanguru publish all [--query...]`,
    Action: publishAction,
  }
  cmd.Flags = []cli.Flag{
    &cli.StringFlag{
      Name: "catalog", Usage: "read catalog files", Aliases: []string{"c"},
    },
    &cli.BoolFlag{
      Name: "init", Usage: "initialize the site",
    },
    &cli.BoolFlag{
      Name: "book", Usage: "publish pieces from books", Aliases: []string{"b"},
    },
    &cli.BoolFlag{
      Name: "upload", Usage: "upload pieces to a cloud storage",
      Aliases: []string{"u"},
    },
  }
  for name, usage := range catalog.Queries {
    flag := &cli.StringFlag{Name: name, Usage: usage}
    cmd.Flags = append(cmd.Flags, flag)
  }
  return cmd
}
