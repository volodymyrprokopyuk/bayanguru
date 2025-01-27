package main

import (
	"fmt"
	"os"

	"github.com/volodymyrprokopyuk/bayanguru/cli/command"
	"github.com/volodymyrprokopyuk/bayanguru/cli/style"
)

func main() {
  bayanguruCmd := command.BayanguruCmd()
  err := bayanguruCmd.Execute()
  if err != nil {
    fmt.Println(style.Err("%v", err))
    os.Exit(1)
  }
}
