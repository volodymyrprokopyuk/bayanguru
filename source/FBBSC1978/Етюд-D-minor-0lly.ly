{{ define "rh1" }}
  d='16( cis e cis e d f d | f e g e g {{ .a }} a {{ .a }}) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \minor
  \time 2/4
  \repeat volta 2 {
    a'='16(\f a' e g f d cis e | d a b cis d c bes a) |
    gis='16( e' b d c a gis b | e, a g f e f b, e) |
    {{ template "rh1" (w `f='16`) }}
    e='16( a c e e, gis b e | a, c e a a,='8) r |
  }

  d=''8.( fis,16 g bes a c | bes8.) a16 g8. bes16 |
  a='16( a e' g f d cis e | d a b cis d c bes a) |
  gis='16( b e, gis a c e, a | b8.) d16 c8. a16 |
  bes='16( d f, bes a c fis, a | gis b e, gis a='8) r |

  a='8.\f a'16 a8. g16 | f8. e16 f8. d16 |
  e,='16( e' b d c a gis b | e, a g f e f b, e) |
  {{ template "rh1" (w `fis='16`) }}
  a='16( g bes d f e d cis | d f a d d,=''8) r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  a,=,8.-\frBass a'16 a8. g16 | f8. e16 f8. d16 |
  e=8. e'16 e8. d16 | c8. a16 gis8. e16 |
  g=8. a16 f8. a16 | cis,8. a'16 d,8. b'16 |
  c='8. e,16 b'8. e,16 | a8. a,16 a'=8 r |

  d='16( d, a' c bes g fis a | g d e fis g f ees d |
  cis=8.)( a'16 d, f e g | f8.) e16 f8. d16 |
  e=8. d'16 c8. a16 | gis( b e, gis a c e , a) |
  d,=8. bes'16 dis,8. c'16 | e,8. d'16( c e a,=) r |

  a,=,16( a' e g f d cis e | d a b cis d c bes a |
  gis=,8.) e'16 e8. d16 | c8. a16 gis8. e16 |
  g=,8. a16 f8. a16 | cis,8. a'16 c,8. a'16 |
  bes=,8. g'16 a,8. a'16 | d,8( f16 a d='8) r |
}
{{ end }}
