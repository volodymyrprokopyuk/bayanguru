{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key d \major
  \time 2/4
  \repeat volta 2 {
    <fis'=' a d>8\mf a16 a b( a) g e | fis8 fis16( a) e8 e16( fis) |
    d='16 e fis g fis( a) g fis |
    \alternative {
      \volta 1 { e='16( g) fis e fis8 d=' | }
      \volta 2 { e='16( g) fis e d='4 | }
    }
  }

  \repeat volta 2 {
    \rep 2 { r8\p\< a'='8[ \acc { a='16 cis e } \af 8\! a=''8]\sf r | } | R2\mf |
    \alternative {
      \volta 1 { r8 \duo { b'='16 cis d8 d='' | } { g'='8 <fis=' a>8 8 | } }
      \volta 2 { r8 \duo { b'='16 cis d=''4 | } { g'='8 <fis=' a>4 | } }
    }
  }

  \repeat volta 2 {
    <b,=' d g>8\mf d16 d e( d) c a | b8 b16( d) a8 a | R2 |
    \alternative {
      \volta 1 { r8 <cis,=' fis>8 r <b= d g> | }
      \volta 2 { r8 <cis=' fis>8 <b= d g>4 | }
    }
  }

  \repeat volta 2 {
    \rep 2 { r8\p\< d='8[ \acc { d='16 fis a } \af 8\! d=''8]\sf r | }
    r4\mf a='16( b) c d |
    \alternative {
      \volta 1 { e=''16( d) e fis g8 <b,=' d g> | }
      \volta 2 { e=''16( d) e fis <b,=' d g>4 \bar "|." }
    }
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key d \major
  d=8-\frBass e fis g |
  \duo { r8 d'='8 r d | r d r e | cis4 s4 | cis='4 d=' | }
  { a=4 bes | b c | r8 a d d, | r a' d,=4 | }

  \rep 2 { \duo { r4 <cis= e a>8 } { a,=,4~ a8 } r | }
  a,=,8 e'16 fis g( fis) e fis | g8 a fis d | g a d,=4 |

  \duo { g=4 g | g d= | } { g=8 <b d> g <c ees> | g <b d> d, <a'= c> | }
  g,=,16 a b c b( d,) c' b | a( c) b a b8 g | a16( c) b a g=,4 |

  \rep 2 { \duo { r4 <fis= a d>8 } { d=4~ d8 } r | }
  d'=8 a16 b c( b) a b | c8 d b g | c d g,=,4 |
}
{% endmacro %}
