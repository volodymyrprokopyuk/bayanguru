{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 3/4
  \meter 1/4 1,1,1
  \duo { c''=''4(\p b c16 b a8) | c4( b8 d c16 b a='8) | }
  { a'='8 e~ e e a e | a e~ e f e='4 | }
  <gis'=' b>8(\< 8 8 \af 16.\! <a c> <gis d'>\> \af 8\! <a c>) |
  <gis=' b>8(\< 8 8 \af 16.\! <a c> <gis d'>\> <a c>16 \af 16\! <b d>) |
  \duo { e''=''4( f8 e d c16 d='') | } { c''=''8 a a4 a=' | }
  <gis=' e'>4(\> \af 2\! a='2) |

  \duo { c''=''4(\mp b c16 b a8) | c4(_\dCre b8 d c16 b a8) | }
  { \rep 2 { a'='8 e~ e e~ e e=' | } } |
  <gis=' b>8(\< 8 8 \af 16.\! <a c> <b d>\> \af 8\! <a c>) |
  \duo { <gis'=' b>8(\< 8 8 \af 16.\! <a c> d c16 b) | e4( f8 e d c16 d='') | }
  { s2 b'='8 a | a4 a='2 | }
  <gis=' e'>4(\> \af 2\! a='2) |

  \duo {
    e''=''4\mp e,8( gis a16 b c8) | e4 e,8( gis a16 b c8) |
    gis='4(_\dCre e8 c' b a) | gis4( e8 c' b a) |
    c=''4(_\aMar d8 c b a)^\tRit | gis4( a='2) \bar "|."
  } {
    \rep 2 { r4 e'='4~ e | } | r e e~ | e e e | a a f | e~ e='2 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  \meter 1/4 1,1,1
  a=4(-\frBass gis a8 c) | a4( gis a8 c) |
  e,=8( e' d c b a) | e( e' d c b c16 b) |
  a=4( d8 e f4) | e8( c16 b <a= c>2) |

  \rep 2 { a=4( gis a8 c=') | }
  \rep 2 { e,=8( b' <b d> <a e'> <gis f'> <a= e'>) | }
  \duo { a=4( a8 c b a=) | } { c=4 d~ d8 f= | } | <e b'>4( <a= c>2) |

  \duo {
    c'='4( b c16 b a8) | c4( b8 d c16 b a8) |
    b=8( b b c d c) | b( b b c d c16 d) |
    e='4 f8 e d c16 d | e8( d c='2) |
  } {
    \rep 2 { c'='8 a b e,~ e a= | } \rep 2 { e=4 e8 a gis a= | }
    a=4 d,8 e f d | e4 <a,=, e'>2 |
  }
}
{{ end }}
