{{ define "rh1" }}
  {{ .a }} f bes {{ .b }} f c' {{ .b }} f, %
  des'=''16 {{ .b }} f, c' {{ .b }} f, bes {{ .b }} f |
  aes='16 {{ .c }} f bes f c' f, des' f, c' f, bes f) |
  aes='16( f f' f, ees' f, des' f, c' f, bes f=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Agitato
  \clef treble
  \key f \minor
  \time 6/8
  {{ template "rh1" (w `aes'='16(->\f` `->` `_ \aSim`) }}
  aes='16 c, g' c, f b, e c g' c, c') r |
  {{ template "rh1" (w `aes='16(` `` ``) }}
  g='16 ees ees' ees, des' ees, c' ees, bes' ees, aes ees) |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \minor
}
{{ end }}
