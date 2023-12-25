package main

import ("fmt"; "os")
import "github.com/volodymyrprokopyuk/bayan/internal"

func main() {
  if err := internal.CmdExecute(); err != nil {
    fmt.Println(internal.StyError(err.Error()))
    os.Exit(1)
  }
}
