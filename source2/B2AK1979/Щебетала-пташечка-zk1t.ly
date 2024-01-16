{{ define "rightHand" }}
\relative {
  \tempo Lento
  \clef treble
  \key g \minor
  \time 4/4
  g'='8\(\p a bes g fis4 d8 d\) | g\( a bes4 a d\) |
  c=''8\( c bes a bes4 g8 g | a\> g fis4 \af 2\! g='2\) |

  r4\mf d'=''2\( a4 | bes g fis d'\) |
  c=''8\( c bes a bes4 g8 g | a g fis4 g2\) |
  r4\p <ees='( g~ >4^\tRit <d) g>2 |
  r4\> <c='( d~ >4 \af 4.\! <bes=) d>2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  g,=,4\(-\puBass d' c2\) | bes4\( d fis d\) |
  ees=2\( d4 bes\) | c\( d g,\) g=, |

  g=,8\( a bes g fis4 d8 d\) | g\( a bes4 a d\) |
  ees=2\( d4 bes\) | c8\( bes a4 bes2\) |
  c=8\( c bes a bes4 g8 g\) | a\( g fis4 g=,2\) |
}
{{ end }}
