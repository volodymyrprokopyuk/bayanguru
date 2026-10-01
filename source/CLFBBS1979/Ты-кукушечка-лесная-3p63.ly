{{ define "rh1" }}
  {{ .a }} e e d8 c | b c d e c4) a=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key a \minor
  \time 2/2
  {{ template "rh1" (w `c''=''4(\mp`) }}
  {{ template "rh1" (w `c=''4(`) }}
  \rep 2 { b='8( gis e4 e e | b'8 c d e c4) a=' | } \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,2-\frBass a | e' a, | a a | e' a, |
  \rep 2 { e'=2 e,8( gis b e) | e2 a,=, | }
}
{{ end }}
