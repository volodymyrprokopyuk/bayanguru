package main

import (
  "fmt"
  "os"
  sty "github.com/volodymyrprokopyuk/bayan/internal/style"
  cmd "github.com/volodymyrprokopyuk/bayan/internal/command"
)

func main() {
  err := cmd.Execute()
  if err != nil {
    fmt.Println(sty.Err("%v", err))
    os.Exit(1)
  }
}
