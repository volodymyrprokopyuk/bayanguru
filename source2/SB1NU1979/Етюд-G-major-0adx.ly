{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 4/4
  g'='8(\p\< a b c d e fis \af 8\! g) | g2(\> \af 4\! fis4) r |
  a=''8( g fis e d\> c b \af 8\! a) | a2( g4) r |
  b='8\( c d e fis\< g a \af 8\! b | a g fis e d\> c b \af 8\! a\) |
  g='8\( d' b g fis c' a fis | g\< a b c d e fis \af 8\! g\) |
  fis=''8( e d c b\> a g \af 8\! fis | g4) r\< \af 2\! r2 |
  r b='4\p r | g=' r r2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g,=,4-\stBass gM! gM gM | a d@7! d74 d7 | fis d@7! d74 d7 |
  \rep 2 { g=,4 gM! gM gM | } c a@m! am4 am | d g@M! d4 d7! |
  g+gM!4 r r2 | d+d7!4 r r2 | g,=,4( a8 b c d e fis |
  g=4) r gM! r | g+gM!4 r r2 |
}
{{ end }}
