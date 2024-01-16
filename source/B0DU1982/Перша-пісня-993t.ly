{{ define "lh1" }}
  c=4 cM! f fM! | e c@M! f4 fM! | g, c@M! g=,4 gM! |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key c \major
  \time 4/4
  c''=''4\(\f e d c | d e c2\) |
  c=''4\( e d c | d e \af 2\! c2\)\> |
  e=''2\(\mf f4 a | g2.\) f4\( | e e f d | c1\) |
  e=''2\(\f f4 a | g2.\) f4\( | e e f^\tRit d |
  c=''1\) \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=4-\stBass cM! cM cM | g gM! c cM! |
  a=,4 am! am am | g gM! c cM! |
  {{ template "lh1" }} | a am! am am |
  {{ template "lh1" }} | c@M!1-\fermata |
}
{{ end }}
