{{ define "rh1" }}
  \duo { c'='8 d16 c bes8 c=' } { g=2 } %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Largamente
  \clef bass
  \key g \minor
  \time 4/4
  \partial 4 { g=8\mf a | }
  bes=4_\aLeg a8 g a4 f | \time 2/4 g4 g8 a |
  \time 4/4 bes=4 g c8 d16 c g8 f | \time 2/4 bes4 g8 g |
  \time 4/4 c='8 bes a g fis4 bes8 a | \time 2/4 g4 g8 a |
  \time 4/4 bes=4 a8 g a4 f | \time 2/4 g=4 \clef treble g'='8\f a |
  \time 4/4 bes='4 a8 g a4 f | \time 2/4 g g8 a |
  \time 4/4 bes='4 g c8 d16 c g8 f | \time 2/4 bes4 g8 g |
  \time 4/4 c=''8 bes a g fis4 bes8 a | \time 2/4 g4 g8 a |
  \time 4/4 \duo { bes'='4 a8 g a4 f=' | } { ees'='2 r4 c=' | }
  <bes,= g'>2\mf <g d'> | {{ template "rh1" }} <fis= d'>2 |
  r2 <g= d'>2^\tRit | {{ template "rh1" }} <fis= d'>8 r \fermata %
  g'='8^\tATem a=' |

  bes='4 a8 g a4 f | \time 2/4 g g8 a |
  \time 4/4 bes='4 g c8 d16 c g8 f | \time 2/4 bes4 g8 g |
  \time 4/4 c=''8 bes a g fis4_\dCre bes8 a | <ees g>2 \fermata r4 g8 a |
  \duo { bes'='4 a8 g a4 f=' | } { e'='2 r4 c=' | }
  <bes,= g'>1~^\tRit | 1~_ \dDim | 2. r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  \partial 4 { r4 | } | \rep 2 { R1 | R2 | } | e=4-\frBass ees d2 | ees4 r |
  r2 r4 d=4 | g, r | <g' d'>2 r4 <d c'>4 | <g bes>4 r | r2 <g ees'>4 <a ees'> |
  <bes= d>4 r | \duo { r4 c'='2. | } { ees=2( d=) | } | <ees, bes'>4 r |
  <c= g'>2 r4 <d a'> | \duo { g=2 f | ees } { \rep 3 { r4 g,=,4 } } %
  d=8 c bes a | g4 d' f e | ees2 d=8 r \fermata r4 |

  g'='8 fis f ees f ees d c | bes4 r | g8 a bes d %
  \duo { ees'='2( | d) | r4 c='2. | } { g=4( a) | bes8 a g f | ees2( d=) | }
  <des,= bes'>2 \fermata r2 | <c g'>2 r4 <d a'> |
  g=4 d c8 d16 c bes8 a | g a bes d c d16 c bes8 a | g=,2. r4 |
}
{{ end }}
