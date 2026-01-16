{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key d \major
  \time 2/4
  fis''=''8 fis fis fis | e g fis fis | fis fis fis fis e g fis4 |
  a,='8( b a b | a cis d d) | a( b a b | a cis d=''4) |

  d=''16( e fis g a g fis a | g fis g e fis8 fis) |
  d=''16( e fis g a g fis a | e fis g e fis4) |
  \duo {
    a'='8( b a b a b16 cis d8 d) | a( b a b | a cis d=''4) \bar "|."
  } { g'='2~ | g4 fis | g2 | a8 g fis='4 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key d \major
  d'='8(-\frBass cis d) d( | cis b16 a d8) d | d( cis d b | a b16 cis d='4) |
  \duo { g'='2~ | g4 a | g2~ | g4 fis=' \clef bass | }
  { e'='2(~ | e4 fis) | e( cis~ | cis8 a d='4) | }

  d,=8-\stBass dM! fis d@M! | e8 a@7! d8 dM! |
  d=8 dM! fis d@M! | a,8 a7! d dM! | e a@7! cis8 a@7! |
  a=,8 a7! d dM! | cis a@7! a8( g | fis e=,) d+dM!4 |
}
{{ end }}
