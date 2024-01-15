{{ define "rh1" }}
  {{ .a }} g)-. g-. g-. | fis( a)-. a-. a-. |
  b='8( a g fis | e4) e=' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} gM! gM gM | g=, gM gM gM |
{{ end }}

{{ define "lh2" }}
  {{ .a }} em! e em | a, am! a am |
  b=,8 bM! b bM | {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  \meter 1/2 #'(1)
  d''=''4(\mf b)-. | d( b)-. |
  d=''8-. d-. d-. e-. | d4( b)-. |
  {{ template "rh1" (w `e,='8(`) }}
  {{ template "rh1" (w `e='8(`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  \meter 1/2 #'(1)
  {{ template "lh1" (w `g,=,8-\stBass`) }}
  {{ template "lh1" (w `g=,8`) }}
  \meter 1/4 1,1,1,1
  {{ template "lh2" (w `e'=8` `e em! e= em`) }}
  {{ template "lh2" (w `e=8` `e=4 em!`) }}
}
{{ end }}
