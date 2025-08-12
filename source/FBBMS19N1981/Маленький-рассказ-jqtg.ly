{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \major
  \time 4/4
  d''=''8(\mp\< g fis e d b \af 4\! d4) | c8(\> d e c \af 2\! d2) |
  c=''8(\< d e c d b a \af 8\! g | a\> b a e \af 2\! a2) |
  d=''8(\< g fis e d b d4) | e8( fis g a \af 2\! b2) |
  a=''8(\> b a e) g( a g d) | e(^\tRit fis e \af 8\! d) %
  \duo { g''=''2 \bar "|." } { r8 ais'='8( b='4) | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  \duo {
    d'='1( | e2 d) | e( d | c4 cis d8 e d4) |
    d='1( | c2 d) | c d | r4 <c d>( d='2) |
  } { g=1~-\frBass | g | g~ | g2 r | g1~ | g2~ g4( gis | a2) b | d,( <g= b>) | }
}
{{ end }}
