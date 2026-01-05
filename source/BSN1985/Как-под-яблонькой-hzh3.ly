{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key g \major
  \time 2/4
  g'='8\mp\< g fis \af 8\! fis | e16\> fis g e d8 \af 8\! d |
  g='8\< g fis \af 8\! fis | e16\> fis g e \af 4\! d4 |
  c='8\< c b b | a b16 c d8 \af 8\! d |
  c='8\>^\tRit c b b | a16 b c e \af 4\! d='4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  b=4(-\frBass a | cis8 a d c) | b4( a | cis8 a d d,) |
  e=4 d8 g | fis d g b, | e4 d8 g | fis4 d= |
}
{{ end }}
