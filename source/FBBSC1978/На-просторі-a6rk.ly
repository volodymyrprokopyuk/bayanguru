{{ define "rightHand" }}
\relative {
  \tempo Sostenuto
  \clef treble
  \key b \minor
  \time 4/4
  d'='8_(\p fis e fis b4 a8 b | fis1) | e8( d a' g fis4 e8 a | d,1) |
  cis='8( b e d cis4 d8 e | fis1) | g8( fis a g b4 cis8 b | a1) |
  \duo {
    d''=''8(_\dCre cis d cis) <fis, b>2 | d'=''8( cis d cis) <g b>2 |
    a='8( b a cis) <d, a'>(_\dDim fis <cis e>4) | b'='1 \bar "|."
  } { \rep 2 { fis'='2 s2 | } e2 s2 | d='1 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
  b=2(-\frBass cis) | d4( cis8 b a b fis4) |
  <g= b>2( <a cis>) | <fis a>4( b8 a fis e d4) |
  g=2( a) | d4( cis8 b cis d a4) | e'2( d) | cis4( b8 d e d cis4) |
  \duo { s2 d'='4( cis8 b) | s2 b4 a8( g=) | }
  { <b= d>2 a | <g b d> <e= d'> | }
  <fis,= cis'>2 <g b>4( <fis a>) | <b,=, b'>1 |
}
{{ end }}
