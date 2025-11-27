{{ define "rh1" }}
  {{ .a }} c f,)-. f-. | g16( f e d c8)-. r |
  g'=''8-. c,-. c'8.( bes16 | a8)-. g-. f=''-. r |
{{ end }}

{{ define "rh2" }}
  {{ .a }} f bes, d | c16 d c bes a=''8)-. r |
{{ end }}

{{ define "lh1" }}
  {{ .a }} g a f | c'8)-. r c-. r | c,( d e c | c')-. bes-. a='-. r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 2/4
  {{ template "rh1" (w `a''=''8(\p`) }}
  {{ template "rh1" (w `a=''8(\mf`) }}

  {{ template "rh2" (w `d'='''8(\p`) }}
  g=''8( c c8. bes16 | a8)-. g-. f-. r |
  {{ template "rh2" (w `d'='''8(\mf`) }}
  g=''8(-.\> c-. c16 bes a g | f8)-. \af 8\! a-. f=''-.\p r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key f \major
  {{ template "lh1" (w `f'='8(-\frBass`) }}
  {{ template "lh1" (w `f='8(`) }}

  bes='8( c d bes | f')-. r f-. r |
  e=''8( c d e | f)-. c-. a-. r |
  bes='8( c d bes | a)-. r f-. r |
  e='8( c d e | f)-. c'-. a='-. r |
}
{{ end }}
