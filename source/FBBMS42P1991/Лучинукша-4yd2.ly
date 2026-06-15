{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key g \minor
  \time 4/4
  bes'='4(\p\< g ees'4. d16 \af 16\! c | d4~\> d16 a bes a g4 g8 \af 8\! a) |
  bes='4(\< g <ees' g>4. <d f>16 \af 16\! <c ees> | <bes d>4 g c2) |
  bes='8[( g] <c ees> <bes d> c d16 ees d8 c | bes4.\> a16 g f4 \af 4\! d) |
  g='4.( <c ees>8 <bes d>\> <a c> <g bes> <fis a> | \af 4\! g='2.) r4 |

  \duo {
    bes'='4(\mf g <c ees>4. <bes d>16 c | d4~ d16 a bes a g4 g8 a) |
    bes='4(\< \af 4\! g <ees' g>4.\f <d f>16 <c ees> | <bes d>4 g c2) |
    bes='8[( g] <g ees'> <g d'> <g c> <g d'>16 <g ees'> <a d>8 <a c> |
    bes='4.\> a16 g f4 \af 4\! d) |
    g='4.(\< \af 16.\! <c ees>8 <bes d>\> <a c> <g bes>^\tRit <fis a> |
    g='2_~ \af 4\! <g=' g'>4) %
  } {
    d'='2 ees | d g4 f8 ees | d2 g | d4 <b f'> <c ees>2 |
    d='4 ees8 f ees f16 ees f8 ees | d g f ees d4 d8 c |
    bes=8 d ees4 d2 | g2 g='4 %
  } r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \minor
  R1 | R1 | g'='1(~-\frBass | g4 g8 f ees4 f8 ees) |
  d='4( c8 d ees f16 g f8 ees | d g f ees d4 d8 c) |
  bes=8( d ees c d2 | g4) f8( ees d c bes a=) \clef bass |

  g=8( a bes d c bes a g | fis d e fis g bes d c) |
  bes=8( a g f ees d c ees | g f ees d c4 bes8 a) |
  g=,8( bes c d ees4 f | bes,8 ees d c bes4 aes) |
  g=,8( bes a4 bes8 c d4 | <g,=, g'>2.) r4 |
}
{{ end }}
