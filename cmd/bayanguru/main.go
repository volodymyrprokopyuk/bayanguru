package main

import (
	"context"
	"fmt"
	"os"

	"github.com/urfave/cli/v3"
	"github.com/volodymyrprokopyuk/bayanguru/cli/catalog"
	"github.com/volodymyrprokopyuk/bayanguru/cli/score"
	"github.com/volodymyrprokopyuk/bayanguru/cli/site"
)

func bayanguruCmd() *cli.Command{
  cmd := &cli.Command{
    Name: "bayanguru",
    Usage: "Engrave, play, and publish sheet music for bayan",
    Description:
`Bayanguru engraves pieces and books of sheet music for bayan. Bayanguru
selectively plays pieces from the catalog using a classification and search
system based on catalog metadata. Bayanguru publishes high quality PDF pieces,
lyrics, and books on the web`,
    ArgsUsage: `
   bayanguru engrave | play | publish pieces... | books... [options]`,
    Version: "rolling release",
    UseShortOptionHandling: true,
    Commands: []*cli.Command{
      score.EngraveCmd(), catalog.PlayCmd(), site.PublishCmd(),
    },
  }
  return cmd
}

func main() {
  err := bayanguruCmd().Run(context.Background(), os.Args)
  if err != nil {
    fmt.Fprintf(os.Stderr, "%s\n", catalog.RedTit("%s", err))
    os.Exit(1)
  }
}
