{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key d \minor
  \time 2/4
  \repeat segno 2 {
    \volta 1
    a'='8 a f f | g4 f8 e | d4 f8 r |
    a='8 a a c | bes4 a8 g | d4 a'='8 r |
    e='8 e e( d | a4) f'8( e | d4 f8) r |
    e='8 e e( d | a4) a'8( g | d='4.) r8 \fine \bar "||"

    \volta 2
    a'='8( a' g f | g a f e) | d( e f g) |
    a=''8( d, f c' | bes a bes g | a g f d) |
    e=''8( f e d | a bes b cis | d e f d) |
    e=''8( f e d | a a' g e) | d=''4. r8 \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  d=8-\stBass dm! d dm | g, gm! a aM! |
  d=8 dm! d dm | d dm! d dM! | g, gm! a aM! |
  \rep 2 { d=8 dm! d dm | \rep 2 { a=,8 a7! a=, a7 | } | }
  d=8 am! dm r8 |

  d=4 dm! | g, gm! | d' dm! | d dm! | g, gm! |
  \rep 2 { d'=4 dm! | \rep 2 { a=,4 a7! | } | } | d+dm!4. r8 |
}
{{ end }}
