{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 4/4
  g'='4(\p a b e, | c' b8 a g4 e) | g( a8 c b4 g8 e | c' c b a g4 e) |
  \rep 2 { a='4( g8 c b a g fis | e4 e g e=') | }

  \duo {
    e''=''1~\mf | e4 d8 c b4 e~ | e1~ | e4 d8 c b4 e~ |
    e=''4. g8 fis4 dis | e1~ | e4. g8 fis4 dis | e=''1 \bar "|."
  } {
    g'='4 a_\aLeg b e, | c' b8 a g4 e | g a8 c b4 g8 e |
    c'=''8 c b a g4 e | a g8 c b a g fis | e4 e8 fis g4 e |
    a='4 g8 c b a g fis | e2 e=' |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  \duo {
    b=1(_\frBass | c2 b) | b1( | c2 b) | \rep 2 { c='2( b~ | b=1) | }
    g'='4 fis g e8 d~ | d2. b4 | g' fis g8 fis e d~ | d2. b4 |
    a=2 b~ | b1 | a2 b~ | b4 c b=2 |
  } {
    \rep 2 { e=1~ | e= | } \rep 2 { e=2( dis | e=1) | }
    b'=1 | a4 g8 fis g4 e | b'1 | a4 g8 fis g4 e8 d |
    c=2 b | e2.~ e8 d | c2 b | e=1 |
  }
}
{{ end }}
