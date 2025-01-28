package main

import (
	"fmt"
	"os"

	"github.com/volodymyrprokopyuk/bayanguru/cli/command"
	"github.com/volodymyrprokopyuk/bayanguru/cli/catalog"
)

func main() {
  bayanguruCmd := command.BayanguruCmd()
  err := bayanguruCmd.Execute()
  if err != nil {
    fmt.Fprintf(os.Stderr, "%v\n", catalog.Err("%v", err))
    os.Exit(1)
  }
}
