{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key e \minor
  \time 4/4
  \meter 1/4 1,1,1,1
  e'='8(\mp fis g a b4 g') | fis8( e d e b2) |
  c=''8( b d c b4 d) | a8( g b a fis2) | e8( fis g a b4 g') |
  \duo { fis''=''8( e fis d b='2) | } { c''=''4 a fis='2 | }
  a,='8( b d c b4 d) | e,8(\> fis b a \af 2\! g='2) |

  d='8(\p e b'_\dCre a g4 d') | d,8( e b' a g2) |
  fis='8( gis dis' cis b4 fis') | fis,8( gis dis'^\tRit cis <fis, b>2) |
  e='8(\f fis g^\tATem a b4 g') |
  \duo { fis''=''8( e a c, b='2) | } { c''=''4 a fis( g=') | }
  <a,=' c>8( <b d> <c e> <d fis> <g, b>4 <e g>) \fermata |
  fis='8( g fis^\tRit d e4) <g=' b e>4~ | 4 r4 r2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
}
{{ end }}
