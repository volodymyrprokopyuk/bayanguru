{{ define "rh1" }}
  {{ .a }} g) | d8( f e d | c) c c=''4 |
{{ end }}

{{ define "rh2" }}
  {{ .a }} a d8.\< c16) | b8( \af 8\! g e' d | c) c {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 2/4
  {{ template "rh1" (w `e''=''4(\f`) }}
  {{ template "rh1" (w `e=''4(\p`) }}
  {{ template "rh2" (w `a='8(\p` `c=''4`) }}
  {{ template "rh2" (w `a='8(` `c=''4\f`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  c'='4-\frBass e | b g | c2 | c4 e | b g | c2 |
  f,=2 | g | a | f'4 d | g g, | c='2 |
}
{{ end }}
