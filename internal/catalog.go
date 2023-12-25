package main

import "fmt"
import "github.com/muesli/termenv"

var cp = termenv.ColorProfile()

func yellow(s string) termenv.Style {
  return termenv.String(s).Foreground(cp.Color("#FEDC56")).Underline()
}

func main() {
  fmt.Printf("Color %s", yellow("yellow"))
}
