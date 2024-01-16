{{ define "rh1" }}
  d='4.\( e8 f4 d | g8 f e d c4 c='\) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} dm! a aM! d dm! d dm | g, gM! g=, gM %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderator
  \clef treble
  \key c \major
  \time 4/4
  \repeat volta 2 {
    g'='8-.\mf g-. g-. a-. g4( e) | f8-. f-. e-. d-. e4( c=') |
  }
  {{ template "rh1" }} {{ template "rh1" }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \meter 1/4 1,1,1,1
  c=8-\stBass cM! g c@M c8 cM g g@M | b8 g@M! g8 gM c cM! g c@M |
  {{ template "lh1" (w `d'=8`) }} a am! a am |
  {{ template "lh1" (w `d=8`) }} c cM! c=4 |
}
{{ end }}
