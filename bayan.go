package main

import (
  "fmt"
  "os"
  "github.com/volodymyrprokopyuk/bayan/internal"
)

func main() {
  err := internal.CmdExecute()
  if err != nil {
    fmt.Println(internal.StyError("%v", err))
    os.Exit(1)
  }
}
