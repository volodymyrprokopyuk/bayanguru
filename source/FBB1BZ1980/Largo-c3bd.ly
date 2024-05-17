{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key d \minor
  \time 4/4
  \duo {
    \repeat volta 2 {
      d'='4\f e_\aLeg f g8 a | bes1 | a4 cis d e | g4. f8 e2 |
      d=''4 e a,2 | a4 bes e,2 | a4 g f g8 a |
      \alternative {
        \volta 1 { bes='2 a=' | }
        \volta 2 { e='4. f8 d2_~ | \af 2^\tRit d1_~ | d=' \fermata \bar "|." }
      }
    }
  } {
    s1 | d'='4 e f e8 d | cis4 e a2~ | a cis |
    a='4 g g f8 e | d2. cis8 b | a4 cis d2 | d4 e8 d cis2 |
    d='4 cis s2 | s1 | s1 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  d'='1-\frBass | g, | a2 b4 cis | d d a g |
  f=4 cis d2 | f4 g a a, | cis e d e8 f | g2 a |
  \duo { s1 | a=4 g f g8 a | e4 f d=2 \fermata | }
  { g=4 a d,2~ | d1~ | d2 d= \fermata | }
}
{{ end }}
