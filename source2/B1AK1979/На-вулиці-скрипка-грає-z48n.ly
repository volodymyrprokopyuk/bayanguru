{{ define "rh1" }}
  {{ .a }} e f g a8)-. a-. | bes16( a bes8) a16( g a8) |
  g='4-- f16( e f8) | e16( d e8) d-. d-. |
  d='16( e f g a8)-. a-. | bes-. bes-. a16( g a8) |
  a='8[( f' e cis] | d)-. d-. {{ .b }} |
{{ end }}

{{ define "rh2" }}
  {{ .a }} d16 c8)-. bes-. | a[-. a-. a-. a]-. |
  g='8[( a bes)-. bes=']-. |
{{ end }}

{{ define "lh1" }}
  {{ .a }} dm! f, d@m | g8 gm! f d@m! |
  e'=8 a@7! d8 dm! | a a7! d dm! |
  d=8 dm! f, d@m | g8 gm! f d@m! |
  e'=8 a@7! a,8 a7 | d dm! {{ .b }} |
{{ end }}

{{ define "lh2" }}
  c=8 cM! e c@M | f,8 fM! c' f@M | c8 cM! g=, c@M |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key d \minor
  \time 2/4
  {{ template "rh1" (w `d'='16(\mf` `d=''4`) }}
  {{ template "rh2" (w `c=''8.(\p`) }} | a[-. a-. a-. a]-. |
  {{ template "rh2" (w `c=''8.(`) }} | a-. a-. a4 |
  {{ template "rh1" (w `d,='16(\mf` `<f,=' a d>4`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  {{ template "lh1" (w `d=8-\stBass` `d= dm`) }}
  {{ template "lh2" }} | f8 fM! c' f@M |
  {{ template "lh2" }} | f8 fM! f fM |
  {{ template "lh1" (w `d'=8` `d+dm4`) }}
}
{{ end }}
