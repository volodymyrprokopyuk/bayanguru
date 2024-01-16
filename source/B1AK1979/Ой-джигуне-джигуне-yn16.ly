{{ define "rh1" }}
  bes='8( g) g-. g-. | a( f) f4 |
  a='8( g f e | d4) {{ .a }} |
{{ end }}

{{ define "lh1" }}
  g,=,8( gm!) g gm | a( d@m!) a8 d@m |
  a=,8 a7! a a7 | d= dm! {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key d \minor
  \time 2/4
  d'='8\mf e f g | a a a4 | c8( bes a g | a4) a |
  {{ template "rh1" (w `d'=''4->`) }}
  {{ template "rh1" (w `d='4`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  d=8-\stBass dm! d dm | d dm d dm |
  d=8 g@m! d8 g@m | d8 dm! d dm |
  {{ template "lh1" (w `d=8 dm`) }}
  {{ template "lh1" (w `d+dm4`) }}
}
{{ end }}
