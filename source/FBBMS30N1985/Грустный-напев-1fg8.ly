{{ define "rh1" }}
  {{ .a }} a bes g | d'4 \af 4\! d) | f,8(\> g a f | \af 2\! d2) |
  ees='8( f g a | g4 d') | c(\< c8 a | \af 2\! d=''2) |
{{ end }}

{{ define "lh1" }}
  r4 {{ .a }} | r <g ees'> | r %
  \duo { c'='4( | d2) | c4( cis | d bes) | d, \rest ees'( | d ees=') | }
  { a=4( | c bes) | g2~ | g | s4 g~ | g=2 | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key g \minor
  \time 2/4
  \meter 1/2 #'(1)
  {{ template "rh1" (w `g'='8(\mp\<`) }}
  bes='8(\mf a c bes | ees,2) | a8( g bes a | d,2) |
  c='4( g') | d( bes') | g8( a bes g | a2) | d='' |

  \duo {
    g''=''2 | s2 | f | ees | d | c(\>^\tRit | \af 2\! c='') \fermata |
  } {
    c''=''8( bes bes4) | c2 | bes8( c bes4) |
    aes='8-- g-- g-- f-- | g-- f-- f-- ees-- |
    ees='4( bes'8 a | g fis fis='4) |
  }

  {{ template "rh1" (w `g,='8(\mp\<^\tATem`) }}
  bes='8( a c bes | <ees g>2) | a,8( g bes a | <bes d g>2) |
  ees=''8( d d c | bes4 bes8 g) | f(\>^\tRit g a4 |
  g='4 \af 4\! <bes=' g'>)\pp \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  \meter 1/2 #'(1)
  {{ template "lh1" (w `<g= d'>4`) }}

  R2 | r8 c='8[-- d-- c]~ | c4 r | r8 bes[-- c-- bes]~ |
  bes=8 a4 bes8~ | bes c4 d8~ | d4 g, | r8 <c d>8[ 8 <bes= d>] \clef treble |
  r8 <a'=' bes>8[-- <g bes>-- <f a>]-- |
  \duo { bes'='8( g g='4) | } { ees'='2 | } | r8 <g=' a>8[ <f a> <ees g>] |
  \duo { aes'='4( g=') \clef bass | c,='2 bes= | }
  { d'='2 | c='4( f,) | bes( ees,=) | }
  aes,=8 g f ees | d4 d,=, \fermata |

  {{ template "lh1" (w `<g'= d'>4`) }}
  R2 | bes=8( a c bes | ees4) r | a,8( g bes a | g4) <g ees'> |
  <g= d'>2 | <a c> | <g= d'> \fermata |
}
{{ end }}
