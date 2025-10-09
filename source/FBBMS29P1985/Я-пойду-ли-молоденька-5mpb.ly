{{ define "rh1" }}
  {{ .a }} d) d d | e16( d cis b d8 b=') |
{{ end }}

{{ define "lh1" }}
  {{ .a }} fis' | g8 e16 g fis='4) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key b \minor
  \time 2/4
  {{ template "rh1" (w `b'='8(\mf`) }}
  {{ template "rh1" (w `b='8(`) }}
  d=''8( d cis16 d cis8 | b4) b | b16( cis d8 e e | b4)\> \af 4\! b=' \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key b \minor
  {{ template "lh1" (w `b=4(-\frBass`) }}
  {{ template "lh1" (w `b,=4(`) }}
  d='8( d16 e fis8 a | b a g fis) | e( d g e | d cis b=4) |
}
{{ end }}
