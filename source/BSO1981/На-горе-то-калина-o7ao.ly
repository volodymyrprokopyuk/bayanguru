{{ define "rh1" }}
  {{ .a }} g) | d8( f e d | c)-. c-. {{ .b }} |
{{ end }}

{{ define "lh1" }}
  {{ .a }} cM! | g gM! | c= cM! |
{{ end }}

{{ define "lh2" }}
  f,=,4 d@m! | g4 gM! | c= cM! |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro moderato"
  \clef treble
  \key c \major
  \time 2/4
  {{ template "rh1" (w `e''=''4(` `c-. g='-.`) }}
  {{ template "rh1" (w `e'=''4(` `c=''4`) }}
  a='4( d) | g,8-. g( e' d) | c-. c-. c-. b-. |
  a='8-. a( d c) | b-. g( e' d) | c-. c-. c=''4 |

  e=''8( f g e | d f e d | c g a b) |
  c=''8( d e c | d f e d | c e g c) |
  a=''8( f) d'-. c-. | b( g) a-. b-. |
  c='''8( g e d) | c( a) d-. c-. |
  b='8( g) e'-. d-. | c-. c-. c=''4-- \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  {{ template "lh1" (w `c=4-\stBass`) }}
  {{ template "lh1" (w `c=4`) }}
  {{ template "lh2" }} {{ template "lh2" }}

  {{ template "lh1" (w `c=4`) }}
  e=4 c@M! | g,4 g7! | c cM! | {{ template "lh2" }}
  f,=,4 fm! | g g7! | c=8 cM! cM4 |
}
{{ end }}
