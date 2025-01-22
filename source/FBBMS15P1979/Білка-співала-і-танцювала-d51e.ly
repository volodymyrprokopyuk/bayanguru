{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key d \major
  \time 2/4
  \meter 1/2 #'(1)
  R2\mp | \af 2\! R2\> | d'='8\mf fis d fis | a a a a | a g fis g | a4 a |
  d,='8 fis d fis | a a a a | d, d e e | d4\> \af 4\! d=' |

  \duo {
    \meter 1/4 1,1
    d''=''8\mf fis d fis | a a a a | a g fis g | a4 a |
    d,=''8 fis d fis | a a a a='' |
  } { a'='4 b | cis d | b2 | cis4 d | b2 | cis4 d='' | }
  <g=' d'>8 <g cis> <g b e>^\tRit <g cis e> | <fis=' a d>4\> \af 4\! 4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  \meter 1/2 #'(1)
  d'='8-\frBass cis b a | \rep 5 { d='8 cis b a | } |
  b=8 a g fis | g fis e d | fis a b g | fis e d=4 |

  \meter 1/4 1,1
  d=8-\stBass dM! a d@M! | e8 a@7! fis8 d@M! | g8 gM! e em! | fis fm! b bm! |
  g=,8 gM! gis e@7! | a8 a7! b bm! | e, em! a a7! | d a d=4 |
}
{{ end }}
