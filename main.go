package main

import (
	"context"
	"fmt"
	"os"

	"github.com/urfave/cli/v3"
	"github.com/volodymyrprokopyuk/bayanguru/cli/catalog"
)

func bayanguruCmd() *cli.Command{
  cmd := &cli.Command{
    Name: "bayanguru",
    Usage: "Engrave, play and publish bayan sheet music",
    Description:
`Bayanguru engraves pieces and books of sheet music for bayan. Bayanguru
selectively plays pieces from a catalog using a classification and search system
based on catalog metadata. Bayanguru publishes high quality PDF pieces, lyrics,
and books on the web`,
    ArgsUsage: "bayanguru engrave | play | publish pieces... | books... [flags]",
    Version: "0.1.0",
    Commands: []*cli.Command{
      catalog.PlayCmd(),
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
