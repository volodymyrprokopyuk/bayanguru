{{ define "rh1" }}
  {{ .a }} g d' \af 8\! g, | bes\> a16 bes \af 4\! g='4) |
{{ end }}

{{ define "rh2" }}
  {{ .a }} bes16 g f8 d16 \af 16\! f | g8 g g='4 |
{{ end }}

{{ define "lh1" }}
  g=8( bes16 g f8 d16 f | g8 g {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key g \minor
  \time 2/4
  {{ template "rh1" (w `g'='8(\p\<`) }} {{ template "rh1" (w `g='8(\<`) }}
  {{ template "rh2" (w `g='8\mp\<`) }} {{ template "rh2" (w `g='8\<`) }}

  r8\mf <a=' bes d>8~ 4 | \af 2\! <g bes ees>2\< | <g bes e> |
  <g=' cis e>4\< \af 4\! <g c e> | r8\p g\< \af 4\! a4 |
  bes='4\> \af 4\! <e, c'> | <ees bes'>\< \af 4\! <d a'> |
  \duo { \af 2\! g'='2\> | <bes=' g'> \bar "|." } { d'='8 ees d4~ | d='2 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \minor
  R2 | R2 | g'='4(-\frBass f | e ees) | d( a | bes c) | <des f> <ces ees> |
  <g= c e>4 <g= bes d> \clef bass | \rep 2 { g=8( g d' g, | bes a16 bes g=4) | }
  {{ template "lh1" (w `g=4)`) }} {{ template "lh1" (w `g=4~`) }} | g=2) |
}
{{ end }}
