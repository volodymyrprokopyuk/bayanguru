{{ define "rightHand" }}
\relative {
  \tempo Largamente
  \clef treble
  \key a \minor
  \time 4/4
  \duo {
    e''=''2(\f c4 e | d2 <d f>) | <c e>8( d e4 c e | d b g) a8( b |
    <a=' c>2 a4 c | d4 e8 f e4 c | d2 c4 b | \af 1\! a='1)\> |

    d=''2(\p c8 d b4 | a1) | e'=''2(\f c4 e | d2 f) | e2( c4 e |
    g=''4 f8 e d4.) f8( | e2 c4 e | d c8 b a='2) |

    d=''2\(\p^\tRit c4 b | a1~ | a~ | a~\> | \af 8\! a='8\) %
  } {
    <e'=' g c>4 a <e g> <e g c> | <d g>2 g4 a8( b | g2) g4 <e g> |
    <d=' g>2 d | <c e>2 4 4 | <d g>2 <e g c>4 <e g> | <d f>2 e |
    e='4 d8 f e4 c=' |

    <d=' f>2( e4 d8 f | e4 d a2) | <e' g c>4 a <e g> <e g c> |
    <d=' g>2 <g d'> | <e g c> <e g>4 <g c> | <g d'> g8 c g4. g8 |
    <g=' c>8 a g4 <e g> <e g c> | <d f>4 e e4. g='8 |

    f='2 e4 d | c\( g' f e8 d | c4 d8 f e4 d | a1~ | a=8\) %
  } r8 r4 r2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  \meter 1/4 1,1,1,1
  c=2(-\frBass c4 c | b b8 a g2) | c( e8 d c4 | b d g,2) |
  a=,8\( b c4 c a | b a8 g c d e4 | d8 e f4 e d | c b c a=,\) |

  d=4( e8 f e4 d | c b a2) | c( c4 c | b a8 b g4) a8( b |
  c=8 d e4 e c | g8 a b c b a b4) | c2 c4 c | d8 d e4 f8\( f e e= |

  d=8 e c d e4 e | a,1~ | a~ | a~ | a=,8\) r r4 r2 |
}
{{ end }}
