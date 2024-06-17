{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key a \minor
  \time 4/4
  a'='4(\p\< e' d e8 \af 8\! d | c4 a b2) | e4(\< e d \af 4\! g | e d e2) |
  a=''4(\f a f8 e d4) | g( g e8 d c4) | d(\> f e^\tRit a, | g2 \af 2\! a=') \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  R1 | a=4(-\frBass e' d e8 d | c4 a b2) | c2. c4 | cis2 d8( e f4) |
  b,=2( c8 d e4) | f( d c2~ | c4 b a=2) |
}
{{ end }}
