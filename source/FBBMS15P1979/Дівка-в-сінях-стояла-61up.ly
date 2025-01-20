{{ define "rh1" }}
  {{ .a }} f g4) | g8( a g f=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 2/4
  c''=''4(\f g | a g8 f) | e4( d | c2) | c'4(\p g | a g8 f) | e( g d4 | c2) |
  {{ template "rh1" (w `e='8(\mf`) }}
  {{ template "rh1" (w `e='8(`) }} | e='4( d8 d | c d e f) |
  \duo { g'='4(\> b8^\tRit b | \af 2\! c=''2) \bar "|." } { g'='4( f | e='2) | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  R2 | c'='4(-\frBass g | a8 g f4) | e( d | c2) |
  f=8( c' a4 | g f) | e8( g d4 | c2) | R2 | c'8( d e4) |
  e='8( f e d) | c4( g | a g8 f) | e4( d | c=2) |
}
{{ end }}
