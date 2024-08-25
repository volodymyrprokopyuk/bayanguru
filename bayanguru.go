package main

import (
  "fmt"
  "os"
  sty "github.com/volodymyrprokopyuk/bayanguru/internal/style"
  cmd "github.com/volodymyrprokopyuk/bayanguru/internal/command"
)

func main() {
  bayanguruCmd := cmd.BayanguruCmd()
  err := bayanguruCmd.Execute()
  if err != nil {
    fmt.Println(sty.Err("%v", err))
    os.Exit(1)
  }
}
