package main

import (
  "fmt"
  "os"
  sty "github.com/volodymyrprokopyuk/bayanguru/internal/style"
  cmd "github.com/volodymyrprokopyuk/bayanguru/internal/command"
)

func main() {
  err := cmd.Execute()
  if err != nil {
    fmt.Println(sty.Err("%v", err))
    os.Exit(1)
  }
}
