{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \minor
  \time 4/4
  \meter 1/4 1,1,1,1
  \duo {
    g'='8(\p a bes a g4 ees'8 c | d2~ d8 c bes a) |
    g='4(\< d' d8 ees \af 4\! f4 | ees\> d c \af 8.\! g=') |
  } { s2 g'='2 | g~ g8 r r4 | g2 g~ | g='2. r4 | }

  \repeat volta 2 {
    \duo {
      bes'='8(\mf c d4 d8 c bes4 | ees d c bes) |
      a='8( bes c4 d_\dDim c | g8 a bes4 a g=') |
    } { g'='2 g | g fis4 g | fis ees d2 | d ees=' | }
  }

  \duo {
    bes'='4 \rest\mf g='8( a bes4 c8 a | bes\< c bes a bes4 g8 \af 8\! a) |
    bes='4(\f g f'8 ees d4 | g\> f ees) \af 4\! bes \rest |
    bes='4 \rest\mf g8( a bes a g4 | ees' d c bes) |
    a='8(_\dDim bes c4^\tRit d c | g'=''2.)\p bes,='4 \rest \bar "|."
  } {
    s4 g'='2 g4~ | g2~ g8 r r4 | s2 <g b>2 | <g c>2. s4 |
    s1 | g='2 fis4 g | g1~ | g='2. s4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  \meter 1/4 1,1,1,1
  \duo { bes=8( c d2) r4 | d2~ d='8 r r4 | }
  { r4- \frBass g=8( a bes4 c8 a | bes c bes a bes4 d8 c=') | }
  bes=4( g b8 c d g, | c4 bes a g=) |

  r4 g=8( a bes a g4 | c bes a g) | d( c' bes a | bes g c='2) |

  g=8( a bes a g4 ees'8 c | d2~ d8 c bes a) |
  g=4( d' d8 ees f4 | ees d c8 bes a g) |
  bes=8( c d4 d8 c bes4 | c bes a g) |
  ees=8( d c4 bes a | <g=, d'>2.) r4 |
}
{{ end }}
