package site

import (
	"context"
	"path/filepath"

	"github.com/urfave/cli/v3"
	"github.com/volodymyrprokopyuk/bayanguru/cli/catalog"
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
  pc := PublishCommand{
    CatalogDir: catalog.CatalogDir, BookFile: catalog.BookFile,
    PieceDir: catalog.PieceDir, BookDir: catalog.BookDir, SiteDir: catalog.SiteDir,
    Catalog: cat, Init: init, Book: book, Upload: upload,
    All: args.Len() == 1 && args.First() == "all",
    TemplateDir: filepath.Join(catalog.SiteDir, "template"),
    ContentDir: filepath.Join(catalog.SiteDir, "content"),
    PublicDir: filepath.Join(catalog.SiteDir, "public"),
    UploadURL: "bayanguru:bayanguru/score",
    ScoreURL: "https://score.bayanguru.org/score",
    PieceURL: "https://bayanguru.org/piece",
    PageSize: 24,
  }
  if !pc.All {
    if book {
      pc.Books = args.Slice()
    } else {
      pc.Pieces = args.Slice()
    }
  }
  pc.Queries, err = catalog.ValidateQueries(cmd)
  if err != nil {
    return err
  }
  return Publish(pc)
}

func PublishCmd() *cli.Command {
  cmd := &cli.Command{
    Name: "publish",
    Usage: "Publish pieces on the web",
    Description:
`Publish command uploads PDF pieces to a cloud storage, generates and publishes
a web site`,
    ArgsUsage:
`bayanguru publish [-c catalog] [--upload] pieces...
bayanguru publish [-c catalog] -b books... [--query]
bayanguru publish all --query...`,
    Action: publishAction,
  }
  cmd.Flags = []cli.Flag{
    &cli.StringFlag{
      Name: "catalog", Usage: "read catalog files e.g. ukr,rus, ^stu,sch",
      Aliases: []string{"c"},
    },
    &cli.BoolFlag{
      Name: "init", Usage: "initialize the site",
    },
    &cli.BoolFlag{
      Name: "book", Usage: "publish pieces from books",
      Aliases: []string{"b"},
    },
    &cli.BoolFlag{
      Name: "upload", Usage: "upload pieces to cloud storage",
      Aliases: []string{"u"},
    },
  }
  for name, usage := range catalog.Queries {
    flag := &cli.StringFlag{Name: name, Usage: usage}
    cmd.Flags = append(cmd.Flags, flag)
  }
  return cmd
}
