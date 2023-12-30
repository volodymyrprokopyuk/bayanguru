package main

import (
  "fmt"
  "os"
  "github.com/volodymyrprokopyuk/bayan/internal"
)

func main() {
  if err := internal.CmdExecute(); err != nil {
    fmt.Println(internal.StyError("%v", err))
    os.Exit(1)
  }
}
