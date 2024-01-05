{
  # macro rightHand, leftHand
  l = gensub(/{% macro (\w+Hand).. %}/, "{{ define \"\\1\" }}", "g")
  # endmacro
  l = gensub(/{% endmacro %}/, "{{ end }}", "g", l)
  # macro rh1, lh1, t1
  l = gensub(/{% macro ((rh|lh|t)[0-9])\([a-g, ]*\) %}/, "{{ define \"\\1\" }}", "g", l)
  # parameter {{ a }}
  l = gensub(/{{ ([a-g]) }}/, "{{ .\\1 }}", "g", l)
  # {{ rh1() }}
  l = gensub(/{{ ((rh|lh|t)[0-9])\(\) }}/, "{{ template \"\\1\" }}", "g", l)
  # {{ rh1("c") }}
  l = gensub(/{{ ((rh|lh|t)[0-9])\("([^"]+)"\) }}/, "{{ template \"\\1\" (w `\\3`) }}", "g", l)
  # \\
  l = gensub(/\\\\/, "\\", "g", l)
  print l
}
