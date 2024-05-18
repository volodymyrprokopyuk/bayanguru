{{ define "rh1" }}
  {{ .a }} c g c f, c' | e,2.) | bes'8( c a c g c | f,='2.) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} a c) | g( bes c) | e,( g c) | f,( a c=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 3/4
  {{ template "rh1" (w `a'='8(\mp`) }}
  d'=''8( a f g a bes | c4) c c | bes( a g) | a2(-> f4)-. |
  {{ template "rh1" (w `a='8(`) }}
  f='8( e f g a f) | c( d e f g a) | bes4( a g | f='2.) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  {{ template "lh1" (w `f=4(-\frBass`) }}
  d,=4( f a) | c,( e bes') | c,( e bes') | f( a c) |
  {{ template "lh1" (w `f,=4(`) }}
  d,=4( f b) | c,( f a) | c,( e bes') | <f= a>2. |
}
{{ end }}
