{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 4/4
  r8\mf c''=''8\( d e a, d e f | e d c b e c g4\) |
  r8 g='8\( a b e, a b c | b a g fis b2\) |
  r8 f='8( d' c d b gis e) | r e( c' b c a fis d) |
  r8 d='8\( b' a b e, fis g | a, c g'\> fis \af 2\! <b,= g'>2\) |

  r8\mf g'='8\( bes a bes g d g | c, g' a bes a f c4\) |
  r8 e='8\(_\dCre c' b c a e a | d, a' b c b g d4\) |
  r8 b'='8\( c d g, c d e | f a, e' d c b a g='\) |

  r8 e'=''8\( fis g c, fis g a | g fis e dis g e b g\) |
  r8 bes='8(_\dDim g' f g e cis a) | r a( f' e f d b g) |
  r8 g='8\( e' d e a, b c | d, f c' b <e,=' c'>2\) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=2\(-\puBass f, | g c\) | b( c | d g,8) fis( g a) |
  b=,2( e,) | a( d,) | g\( cis | d g,=,\) |

  g=,2\( f | e f\) | a\( g | fis g\) | f\( e | d g=,\) |

  g=,4\( e a2 | b e\) | e\( a4 g | f d g2\) | c,\( fis g c,=\) |
}
{{ end }}
