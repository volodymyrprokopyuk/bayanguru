package internal

import "github.com/gookit/color"

var styError = color.HEXStyle("FF0066").AddOpts(color.OpBold)
var styID = color.HEXStyle("00D400")
var styTit = color.HEXStyle("FFD4A2").AddOpts(color.OpBold)
var styCom = color.HEXStyle("FF9955")
var styOrg = color.HEXStyle("00D4AA")
var styBss = color.HEXStyle("FF5555")
var styLvl = color.HEXStyle("2AD4FF")

func StyError(format string, vals ...any) string {
  return styError.Sprintf(format, vals...)
}

func StyID(format string, vals ...any) string {
  return styID.Sprintf(format, vals...)
}

func StyTit(format string, vals ...any) string {
  return styTit.Sprintf(format, vals...)
}

func StyCom(format string, vals ...any) string {
  return styCom.Sprintf(format, vals...)
}

func StyOrg(format string, vals ...any) string {
  return styOrg.Sprintf(format, vals...)
}

func StyBss(format string, vals ...any) string {
  return styBss.Sprintf(format, vals...)
}

func StyLvl(format string, vals ...any) string {
  return styLvl.Sprintf(format, vals...)
}
