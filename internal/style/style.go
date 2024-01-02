package internal

import "github.com/gookit/color"

var err = color.HEXStyle("FF0066").AddOpts(color.OpBold)
var id = color.HEXStyle("CCFF00")
var tit = color.HEXStyle("FFD4A2").AddOpts(color.OpBold)
var com = color.HEXStyle("FF9955")
var org = color.HEXStyle("00D4AA")
var bss = color.HEXStyle("FF5555")
var lvl = color.HEXStyle("2AD4FF")

func Error(format string, vals ...any) string {
  return err.Sprintf(format, vals...)
}

func ID(format string, vals ...any) string {
  return id.Sprintf(format, vals...)
}

func Tit(format string, vals ...any) string {
  return tit.Sprintf(format, vals...)
}

func Com(format string, vals ...any) string {
  return com.Sprintf(format, vals...)
}

func Org(format string, vals ...any) string {
  return org.Sprintf(format, vals...)
}

func Bss(format string, vals ...any) string {
  return bss.Sprintf(format, vals...)
}

func Lvl(format string, vals ...any) string {
  return lvl.Sprintf(format, vals...)
}
