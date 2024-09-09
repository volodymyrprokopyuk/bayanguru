{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key b \minor
  \time 3/4
  \meter 1/4 1,1,1
  e'='8.\p g16 fis8 fis ais fis | b4 b d8 cis16 b |
  e=''8 d cis b ais fis | b a16 g fis4 e |
  fis='8 g16 fis ais8 fis b d | cis d16 cis b='2 |

  \duo {
    e'='8.\mp g16 fis8 fis ais fis | b4 cis d8 cis16 b |
    e=''8 d cis b ais fis | b a16 g fis4 e |
    fis='8 g16 fis ais8 fis b d | cis d16 cis b='2 |

    e,='8.\f g16 fis8 fis ais fis | b4 cis d8 cis16 b |
    e=''8 d cis b ais fis | b a16 g fis4 e |
    fis='8 g16 fis <g ais>8 <e fis> <b b'> <d d'> |
    <cis=' cis'>8 <d d'>16 <cis cis'> <b= fis' b>2 \fermata \bar "|."
  } {
    s4 d'='4 cis | d8. fis16 e8 fis16 g fis4 |
    g='4 a8 g fis e | d4~ d8 cis16 b~ b8 cis |
    d='4 cis16 d e8 d fis | f e d='2 |

    b=4 <ais e'>4 4 | <b e g> <cis fis a> <d g b> |
    <cis=' g' b>4. <cis g'>8 <c e>4 | <b d>2. |
    <ais= cis>4 <ais e'> <fis' a> | <e ais> e d=' \fermata |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key b \minor
  \meter 1/4 1,1,1
  R2. | b=4-\frBass e8 fis16 g fis8 a | g4. g8 fis e |
  d='4~ d8 cis16 b d8 cis | e4 d8 cis d e | fis4 b,=2~ |

  b=2. | b | e2 d8 cis=' \clef bass | b=4 a g |
  fis=2 g4~ | g fis8 d16 cis b8 a=, |

  g=,4 d'8 cis fis, cis'~ | cis b16 cis d8 cis16 d e4 |
  <a,=, g'>4. 8 <d fis>4 | <g, d'>2. |
  e'=4 d8 cis d g,~ | g fis cis' d16 cis b=,4 \fermata |
}
{{ end }}
