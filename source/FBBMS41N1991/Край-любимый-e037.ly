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
  \meter 1/4 1,1,1,1
  \duo {
    e'='1-\frBass | c4 fis fis( f) | e2 c8( b e d) |
    c='4 e~ e dis | e1 | e4 s2. | e2 d8( cis e d) |
    c='2 b | c b | c d | e fis | e e4( dis) | e1 |
    e='4 fis d2 | e e4 e=' \fermata |
  } {
    e'='4( d c b) | a d g,2 | fis g | a b |
    e='4( d c b) | a d g, d' | c2 g | \rep 2 { a=4( d,) g( d=) | }
    a'=4( d,) b'( d,) | cis'( fis,) dis'( fis,) |
    cis'='4( fis,) b2 | e4( d c b) | a d g,2 | fis b4 c=' \fermata |
  } | <a= c>4 b e,8 b e,4~ | e=, r r2 |
}
{{ end }}
