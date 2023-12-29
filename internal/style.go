package internal

import "github.com/gookit/color"

var styError = color.HEXStyle("#FF0066").AddOpts(color.OpBold)

func StyError(format string, vals ...any) string {
  return styError.Sprintf(format, vals...)
}
