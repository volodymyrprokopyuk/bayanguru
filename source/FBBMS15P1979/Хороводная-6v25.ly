{{ define "rh1" }}
  {{ .a }} e d16 f e d e8 a,=') |
{{ end }}

{{ define "lh1" }}
  r8 {{ .a }} r <b d> r <c=' e> |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key a \minor
  \time 3/4
  {{ template "rh1" (w `c''=''8(\mf`) }}
  {{ template "rh1" (w `c=''8(`) }}
  \rep 2 { gis='8(\< a16 f \af 8\! e8) e'16(\> d c b \af 8\! a='8) | } \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `<a= c>8-\frBass`) }}
  {{ template "lh1" (w `<a= c>8`) }}
  \rep 2 { r8 <d=' f>8 r <e, gis> r <a= c> | }
}
{{ end }}
