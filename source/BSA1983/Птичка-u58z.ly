{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key g \major
  \time 4/4
  g'='8\mf a b_\aSta c d d d4 | e8 d c b d d d4 |
  c=''8 b a g b b b4 | a8 b e, d g2 |
  \rep 2 { r2 r8 <g=' b d>8 4 | } | r2 r8 <d g d'>8 4 | r2 r4 <b= d g>4 |

  g'='8\p g( a g e2) | g8 g( a g ees2) | g8_\dCre g( a g) g (g a g) |
  g='8 g( a b <fis d'>4) r | g8\mf a b_\aSta c <g b d>8 8 4 |
  e'=''8 d c b <g b d>8 8 4 | c8 b a g <d g b>8 8 4 |
  c'=''8 d e fis <b,=' g'>4 r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g+gM!4-\stBass r b+g@M! r4 | c+cM! r b+g@M! r4 |
  c+cm!4 r d+g@M! r4 | d+d7! r r g+gM! |
  g,=,8_\aSta a b c d2 | e8 d c b d2 | c8 b a g b2 | a8 b e d g,=,2 |

  c@M!2 g=,8 g a g | c@m!2 g8 g a g | g@M!2 c@M!2 | a@m!2 d@M!4 b8 a |
  g+gM!4 r g=,8 a b g | c+cM!4 r g8 a b g | c+cm!4 r g8 a b g | r4 d+d7! g+gM! g=, |
}
{{ end }}
