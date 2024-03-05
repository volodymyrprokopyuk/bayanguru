# awk -i inplace -f catalog/format.awk catalog/*-*.yaml
{
  if ($0 ~ /#/) {
    print
  } else {
    l = gensub(/(\{)(id: )/, "\\1 \\2", 1)
    l = gensub(/ (com: |arr: |src: )/, "\n      \\1", 1, l)
    l = gensub(/ (org: )/, "\n      \\1", 1, l)
    l = gensub(/(\w)\}$/, "\\1 }", 1, l)
    print l
  }
}
