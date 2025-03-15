{{ define "rh1" }}
  {{ .a }} c16( d e8 c) | b b16( c d8 b) | c( {{ .b }} a e fis=' |
{{ end }}

{{ define "lh1" }}
  a=8 a16( b c8 a) | g g16( a b8 gis) | a( c d c=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key g \major
  \time 2/4
  g'='8(\mf a b c | d4 g) | e8.( fis16 g8 e | d4 b) |
  {{ template "rh1" (w `c=''8\mp` `_ \dCre`) }} | g='4) b8( d) |
  {{ template "rh1" (w `c=''8\f` ``) }} | g='4 g=')  \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  R2 | g=8(-\frBass a b d) | c( d e c | b a g d') |
  {{ template "lh1" }} | b=8 a) g( b) |
  {{ template "lh1" }} | b=4 b=) |
}
{{ end }}

{{ define "lyrics" }}
\lyrTwoColSix
"1." \column {
  "Ой за гаєм, гаєм,"
  "Гаєм зелененьким,"
  \lyrRep "Там орала дівчинонька" 2
  "Воликом чорненьким."
}
"2." \column {
  "Орала, орала,"
  "Не вміла гукати,"
  \lyrRep "Та й найняла козаченька" 2
  "На скрипочку грати."
}
"3." \column {
  "Козаченько грає,"
  "Бровами моргає…"
  \lyrRep "Вража ж його мати знає," 2
  "На що він моргає:"
}
"4." \column {
  "Чи на мої воли,"
  "А чи на корови,"
  \lyrRep "Чи на моє біле личко," 2
  "Чи на чорні брови?"
}
"5." \column {
  "Воли та корови"
  "Усі поздихають,"
  \lyrRep "Біле личко, чорні брови" 2
  "Повік не злиняють!"
}
"" ""
{{ end }}
