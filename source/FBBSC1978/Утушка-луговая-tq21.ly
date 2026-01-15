{{ define "rh1" }}
  {{ .a }} e') e(-. e])-. | e( d16 c b8 a=') |
{{ end }}

{{ define "rh2" }}
  b='8( a16 g f8 e | f g a4) | b8( a16 g f8 e-. | f-. g-. {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 2/4
  {{ template "rh1" (w `a'='8[(\mf`) }}
  {{ template "rh1" (w `a='8[(`) }}
  {{ template "rh2" (w `a='4)`) }}
  \rep 2 { {{ template "rh1" (w `a='8[(`) }} | }
  {{ template "rh2" (w `a='4~`) }} | a='2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  r8 a'='8(-\frBass g4 | fis f=') \clef bass | r8 a,=8( g4 fis f) |
  e=4( d | b' a8 a) | g( f16 e d4 | bes4 a) |
  r8 a'=8( g4 | fis f=) \clef treble | r8 a'='8( g4 | fis f) |
  g='8( f16 e d='4 \clef bass | b=4 a8 a) | g8( f16 e d4 | bes a~ | a=,2) |
}
{{ end }}
