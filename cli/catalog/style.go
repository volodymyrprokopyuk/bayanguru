package catalog

import "github.com/gookit/color"

var redTit = color.HEXStyle("FF0066").AddOpts(color.OpBold)
var redSub = color.HEXStyle("FF5555")
var greenTit = color.HEXStyle("CCFF00")
var greenSub = color.HEXStyle("00D4AA")
var blueTit = color.HEXStyle("BBEEFF")
var blueSub = color.HEXStyle("2AD4FF")
var yellowTit = color.HEXStyle("FFD4A2").AddOpts(color.OpBold)
var yellowSub = color.HEXStyle("FF9955")

func RedTit(format string, args ...any) string {
  return redTit.Sprintf(format, args...)
}

func RedSub(format string, args ...any) string {
  return redSub.Sprintf(format, args...)
}

func GreenTit(format string, args ...any) string {
  return greenTit.Sprintf(format, args...)
}

func GreenSub(format string, args ...any) string {
  return greenSub.Sprintf(format, args...)
}

func BlueTit(format string, args ...any) string {
  return blueTit.Sprintf(format, args...)
}

func BlueSub(format string, args ...any) string {
  return blueSub.Sprintf(format, args...)
}

func YellowTit(format string, args ...any) string {
  return yellowTit.Sprintf(format, args...)
}

func YellowSub(format string, args ...any) string {
  return yellowSub.Sprintf(format, args...)
}
