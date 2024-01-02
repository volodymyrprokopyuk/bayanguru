package internal

import "github.com/gookit/color"

var err = color.HEXStyle("FF0066").AddOpts(color.OpBold)
var id = color.HEXStyle("CCFF00")
var tit = color.HEXStyle("FFD4A2").AddOpts(color.OpBold)
var com = color.HEXStyle("FF9955")
var org = color.HEXStyle("00D4AA")
var bss = color.HEXStyle("FF5555")
var lvl = color.HEXStyle("2AD4FF")

func Error(format string, args ...any) string {
  return err.Sprintf(format, args...)
}

func ID(format string, args ...any) string {
  return id.Sprintf(format, args...)
}

func Tit(format string, args ...any) string {
  return tit.Sprintf(format, args...)
}

func Com(format string, args ...any) string {
  return com.Sprintf(format, args...)
}

func Org(format string, args ...any) string {
  return org.Sprintf(format, args...)
}

func Bss(format string, args ...any) string {
  return bss.Sprintf(format, args...)
}

func Lvl(format string, args ...any) string {
  return lvl.Sprintf(format, args...)}
