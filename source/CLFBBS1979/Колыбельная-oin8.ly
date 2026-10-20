{{ define "rightHand" }}
\relative {
  \tempo "Sostenuto, cantabile"
  \clef treble
  \key a \minor
  \time 4/4
  e'='4(\mp e e  a8 c | b4 c8 b a4 e') |
  d=''4( c8 b c4 b8 a | b4 c a='2) |
  e='4( g8 f e4 a8 c | b4\< c8 b a4 \af 4\! e') |
  f=''4( e8 f d4 a8 b | c4\> b8 c \af 2\! a='2) |

  b='4( a8 b c4_\dCre g' | a8\> g f e d4 \af 4\! b) |
  c=''4(\mf g' f e8 d | c4 d \af 2\! e=''2)\> |
  e,='8(\mf f g f e4 a8 c | b a c b a4 a') |
  g=''8( f e d c4 c8 d | b4\>^\tRit c8 b \af 2\! a='2)\p \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  c'='4(-\frBass b c2 | d c4 a) | f'2( e | d4 e f e8 d) |
  c='4( b c2 | d c4 a) | a'( g f2 | e4 d c8 d e f=') |

  g='4( f e2) | f4( a b8 a g f) | e2( d8 e f g | a g f a e f e d) |
  c='4( b c2 | d4 e f2) | e8( f g f e2 | d4 e a,=2) |
}
{{ end }}
