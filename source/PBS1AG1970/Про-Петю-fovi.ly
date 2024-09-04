{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 2/4
  \meter 1/2 #'(1)
  c''=''8-.\mf c-. c-. b-. | c4( a) | g8-. g-. g-. a-. | g4( e) |
  f='8-. f-. f-. e-. | d4( g) | e8-. e-. d-. d-. | c4-- c-- |
  c'=''4( a) | c( g) | a8( g f e | g2) | f4( e | d g) | c,2 | c='2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=4-\stBass cM! | f fM! | c cM! | c cM! | f fm! | g, gM! | g g7! | c cM! |
  f=4 fM! | c cM! | d dm! | c cM! | f fm! | g, g7! c= cM! | c+cM!2 |
}
{{ end }}
