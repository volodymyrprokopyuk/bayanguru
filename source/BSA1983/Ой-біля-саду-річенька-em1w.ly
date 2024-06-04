{{ define "rh1" }}
  {{ .a }} d <bes' d> <a c>16 <g bes> |
  <fis=' a>16 <g bes> <a c> <fis a> <g=' bes>4) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \minor
  \time 2/4
  \duo { d'='8(\mp d bes' a16 g | fis16 g a fis <bes,= d g>4) | }
  { s4 d'='4 | c=' s4 | } {{ template "rh1" (w `d'='8(`) }}
  \duo {
    bes'='8( d d c16 bes | a8 c c bes16 a) |
    bes='16( a g8 fis8. a16 | <bes,= d g>4 4) |
  } { f'='4 e | ees d | d c=' | s4 s4 | }

  d='8(\mf d bes' a16 g | fis g a fis g4) | {{ template "rh1" (w `d='8(`) }}
  \duo {
    bes'='8( d d c16 bes | a8 c c bes16 a) |
    bes='16(_\dDim a g8 fis8. a16 | g4 g=') \bar "|."
  } { f'='4 e | ees d | ees4. d8 | cis d bes=4 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  g,=,8-\stBass gm! g gm | d' d7! g, gm! | bes( a) g gm! | d' d7! g, gm! |
  d'=8 bes@M! c8 c7! | f, fM! fis d@7! | g8 gm! d' d7! | g, gm! g=, gm |

  R2 | d'=8(-\frBass d bes' a16 g | fis g a fis g4) | d'8( d ees d16 c |
  bes=16 c bes a g4) | f16( g a g fis4) | g8( c d c | bes a16 bes g=4) |
}
{{ end }}
