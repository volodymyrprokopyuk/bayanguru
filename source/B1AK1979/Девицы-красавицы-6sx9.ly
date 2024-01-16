{{ define "rh1" }}
  {{ .a }} g)-. g-. g-. | fis( a) a4 | b8 b( c a | g)-. g-. g='4 |
{{ end }}

{{ define "lh1" }}
  {{ .a }} gM!) gM gM | d'( dM!) dM dM | g,[ gM!] d'= d7! |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key g \major
  \time 2/4
  {{ template "rh1" (w `d'='8(\mf`) }}
  d'=''8(\< b) b g | g( e) \af 4\! e4 |
  c'=''8(\> b) a g | fis( e) \af 4\! d4 |
  {{ template "rh1" (w `d='8(\p`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  \meter 1/2 #'(1)
  {{ template "lh1" (w `g,=,8(-\stBass`) }} | g,( gM!) gM gM |
  g=,8( gM!) gM gM | e'( em!) em em |
  a,=,8( am!) am am | d( dM!) dM dM |
  {{ template "lh1" (w `g,=,8(`) }} | g,=,8 gM! g+gM4 |
}
{{ end }}
