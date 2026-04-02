{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key d \minor
  \time 3/4
  \meter 1/4 1,1,1
  d'='4(\mf f e8 d | cis e a4. g8) | f( e g f e d | f8. e16 e2) |
  d='4( f e8 d | cis e a4. g8) | f( f a4. cis,8 | e8. d16 d='2) |

  a'='8(\mf a bes4. a8) | g( g a4. g8) | f( e g f e d | f8. e16 e2) |
  d='4.( f8 e d | cis e a4. g8) | f( f a4. cis,8 |
  e='8. d16) \duo { d'='8( e f g=') | } { d'='2 | }

  \duo {
    a'='8(\mf a bes4. a8) | g( g a4. g8) | f( e g f e d | f8.\> e16 \af 2\! e2) |
    d='4.( f8 e d | cis e a4. g8) | f( f a4. cis,8 |
    e='8.\>^\tRit d16) \af 2\! d='2 \bar "|."
  } {
    c'='2. | bes | a | g | bes | g4 cis2 | d4 b g | <g bes> <f= a>4 4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  \meter 1/4 1,1,1
  <f= a~>2.-\frBass | <e a> | <d a'~> | <cis a'> | f4( a) a |
  g=4( cis) cis | d( a) e | d( f) a= \clef treble |

  <d=' f>4 g8( f e d) | <cis e>4 f8( e d cis) | <bes d>4 e8( d c bes=) \clef bass |
  <a= d>4 cis8( bes a g) | f4( d a) | e'( cis a) | <a d>2 <a e'>4 | <a=, f'>2 r4 |

  f=,4-\stBass fM! fM | e' c@M! cM4 | d dm! dm | cis a@M! aM4 |
  g=,4 gm! gm | a a7! a7 | d, g a | d,=,2. |
}
{{ end }}
