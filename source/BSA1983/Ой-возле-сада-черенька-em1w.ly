{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \minor
  \time 2/4
  \duo { d'='8(\mp d bes' a16 g | fis16 g a fis <bes,= d g>4) | } { s4 d'='4 | c=' s4 | }
  d'='8( d <bes' d> <a c>16 <g bes> | <fis a> <g bes> <a c> <fis a> <g bes>4) |
  \duo {
    bes'='8( d d c16 bes | a4 c c bes16 a) |
    bes='16( a g8 fis8. a16 | <bes,= d g>4 4) |
  } { f'='4 e | ees d | d c=' | s4 s4 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
}
{{ end }}
