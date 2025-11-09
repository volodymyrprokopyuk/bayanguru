{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 2/4
  \meter 1/2 #'(1)
  c'='8\(\mp d e f | g a b c | d e f e | d c b a\) |
  g='8( a b c | d4)-. d-. | c8( d e f | g4)-. g-. |
  g=''8\(\mf f e d | c d e c | f e f g | a4\)-. a-. |
  a=''8( b c a | g f e d | c4)-. e-. | c=''2-- \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=4-\stBass cM! | g c@M! | \rep 2 { d'=4 g@7! | g,=,4 g7! | }
  c=4 cM! | g c@M! | c4 cM! | bes c@M! | a4 f@M! | d=4 f@M! |
  f+d@m!4 r4 | g+g7! r | c+cM! r | c+cM!2 |
}
{{ end }}
