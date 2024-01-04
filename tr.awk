{
  l = gensub(/{% macro (\w+Hand).. %}/, "{{ define \"\\1\" }}", "g")
  l = gensub(/{% endmacro %}/, "{{ end }}", "g", l)
  print l
}
