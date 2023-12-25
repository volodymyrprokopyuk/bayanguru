package internal

import "github.com/muesli/termenv"

var cp = termenv.ColorProfile()

func StyError(str string) termenv.Style {
  return termenv.String(str).Foreground(cp.Color("#FF0066"))
}
