{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key f \major
  \time 2/4
  R2\mp\< | R2 \fermata |
  <f''='' a c>16\p^\tATem d' \rep 3 { <f,='' a c>16 d'=''' } |
  \rep 8 { <f,='' g bes>16 d'=''' } | \rep 4 { <f,='' a c>16 d'=''' } |
  \duo { c'''='''4 a | d='''2 | }
  { a''=''16 g g f f e e d | bes' a a g d g d g='' | }
  \rep 3 { <bes='' c>16 d=''' } <bes c> e, |
  <f='' a c>16 d' <f, a c> d' f, a e d='' |

  c=''16_\aSta d c a c d e f | g a g d g a bes g |
  c='''16 b bes a g f e d | c b c d e d e g |
  r16 d c a c d c f | r16 g d bes bes' a g f |
  e=''16 g d' e, d e c' bes | c, d e f e f g a |
  r16 <f='' a>16 16 <bes, g'> r16 <c a'>16 8 |
  r16 <d='' bes'>16 16 <c a'> <bes g'> <c a'> <bes g'>8 |
  r8 <c='' a'>16 16 <d bes'>8 8 | <c a'> <bes g'> <a=' f'>4 \fermata |

  \tempo "Con moto"
  \duo {
    c''=''8\mf d d <f a> | bes8. a16 g4 | c,8[ d e g] | a a f4 |
    a=''4 d16 c bes a | bes8 a16 bes g=''4 |
  } {
    a'='4 c | g'8. d16 bes4 | bes2 | c8 c a4 | f'16 e d c bes' a g fis |
    d=''4 bes=' |
  }
  <e'='' c'>8[ <d bes'> <c a'> <bes g'>] | <c a'>4 <a f'> |
  c'='''16\f d c a c d c a | bes(-> d g,8)-. %
  \duo { bes''=''4-> | } { a''=''8( g='') | }
  bes=''16 c bes g bes c bes g | a(-> bes g8)-. %
  \duo {
    a''=''4-> | fis2\p | \af 2\! g\< \barFermata |
    \tempo Andante
    c='''8 bes a16 c g=''8 |
  } { g''=''8( f) | d[ c bes a] | d[ f e d] | e=''2 | }
  f=''8 r \acc { c'='''16 d e } <a,='' f'>8-> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key f \major
  c''=''16-\frBass d c a bes c bes g |
  a='16 bes a f g^\tRit a g c,=' \fermata \clef bass |

  \meter 1/2 #'(1)
  c='8( d c a | bes4 g) | bes8( c bes g | a4 f) |
  c=8( d e f | g4 bes) | a8( c bes g | a4 f) |
  <a= c>8 f' e d | g, bes e d | c d c bes |
  a=8 f g c, | c'( d c a | bes4 g) |
  bes=8( c bes g | a4 f) | c8( d e f | g4 bes) |
  a=8( c bes g | a4 f8 f'=') \fermata |

  \meter 1/4 1,1
  f,,=,8-\stBass fM! d' dm! | g, gm! bes g@m! | c8 c7! bes c@7! |
  a=,8 am! d dm! | f, fM! fis d@7! | g8 gm! bes g@m! | g8 c@7! c8 c7! |
  f,=,8 fM! fM r | f fM! d' d7! | g, gm! bes g@m! | c8 c7! g c@7! |
  f=,8 fM! c' f@M! | d8 d7!4 d78 | g, gm!4 gm8 | g=, c@7!4 c78 |
  f@M! r8 f+fM!-> r |
}
{{ end }}
