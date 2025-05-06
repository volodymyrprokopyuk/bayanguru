{{ define "lh1" }}
  {{ .a }} g a bes | a bes c d | e c f c=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \minor
  \time 2/4
  c''=''8\mf c c d | c8.( bes16) a8 bes | c c16( bes) a4 |
  c=''8 c c d | c8.( bes16) a8 bes | c\> c16( bes) \af 4\! a4 |
  a='8\mp c g g | f4\< e8 e | d d \af 4\! d'4 |
  a='8\mf c g g | f4\> e8 e | d d \af 4\! d='4\p \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  {{ template "lh1" (w `f=8-\frBass`) }}
  {{ template "lh1" (w `f,=8`) }}
  f,=8 a e c | d f c a | bes d bes( a16 g) |
  f=,8 a e c | d f c a | bes c d=,4 |
}
{{ end }}
