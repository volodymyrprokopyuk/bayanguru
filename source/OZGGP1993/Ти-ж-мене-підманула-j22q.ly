{{ define "rh1" }}
  {{ .a }} d' <g, bes> d' | <g, c> bes a g=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Vivo
  \clef treble
  \key g \minor
  \time 2/4
  \meter 1/2 #'(1)
  bes'='8\f d bes d | c bes a g | a bes c ees | <fis, c' d>2 |
  {{ template "rh1" (w `<g=' bes>8\mf`) }}
  {{ template "rh1" (w `<g=' bes>8`) }}
  <d=' bes'>4 a'8 fis | g g g a | <d, bes'>4 a'8 fis | g g g4 |
  <d=' bes'>4_\dCre a'8 fis | g g <g ees'> c | <g d'>8 8 <fis d'>8. c'16 |
  g='8\f g g='4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  \meter 1/2 #'(1)
  <g= bes d>2-\frBass | <f g bes d> | <ees c'> | d4 d,8 r |
  \rep 2 { g=,8 bes' d, bes' | ees, c' a c=' | }
  g,=,8 <d' bes'> d <fis c'> | g <bes d> ees, <g des'> |
  d=8 <g bes> d <a' c> | g <bes d> g <bes d> |
  g,=,8 bes' d, <fis c'> | g <bes d> c, <g' a> |
  d=8 <g bes> d <a' c> | g <bes= d>8 4 |
}
{{ end }}
