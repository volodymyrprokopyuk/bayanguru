{{ define "lh1" }}
  {{ .a }} g | a16( g f8~ f16 e d c=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  e''=''4\mf d16( c b d) | c4( g) | e' d16( e d8) | c4( g) |
  \duo { f'='8[\f g a( <a c>]) | g4. g8 | f[ g a( <a c>]) | g4 g='  \bar "|." }
  { \rep 2 { c'='2-> g=-> | } } |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  {{ template "lh1" (w `c''=''4-\frBass`) }}
  {{ template "lh1" (w `c'=''4`) }} \clef bass |
  \rep 2 { a,=,8 g f4~ | f8[ e' d c=] | }
}
{{ end }}
