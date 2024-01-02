package main

import (
  "fmt"
  "os"
  "github.com/volodymyrprokopyuk/bayan/internal"
  cmd "github.com/volodymyrprokopyuk/bayan/internal/command"
)

func main() {
  err := cmd.Execute()
  if err != nil {
    fmt.Println(internal.StyError("%v", err))
    os.Exit(1)
  }
}
