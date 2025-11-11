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
  cat := ""
  init := cmd.Bool("init")
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
      BookDir: catalog.BookDir, Catalog: cat,
    },
    siteDir: SiteDir, templateDir: TemplateDir, contentDir: ContentDir,
    publicDir: PublicDir, init: init, upload: upload,
    uploadURL: UploadURL, scoreURL: ScoreURL, pieceURL: PieceURL,
    pageSize: PageSize,
  }
  pc.Queries, err = catalog.ValidateQueries(cmd)
  if err != nil {
    return err
  }
  pc.PieceIDs = args.Slice()
  return publish(pc)
}

func PublishCmd() *cli.Command {
  cmd := &cli.Command{
    Name: "publish",
    Usage: "Publish pieces on the web",
    Description:
`Publish command uploads PDF pieces to cloud storage, generates and publishes
the website`,
    ArgsUsage:
`
   bayanguru publish all [--init] [--upload] [--query...]
   bayanguru publish pieces... [--init] [--upload] [--query...]`,
    Action: publishAction,
  }
  cmd.Flags = []cli.Flag{
    &cli.BoolFlag{
      Name: "init", Usage: "initialize the website",
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
