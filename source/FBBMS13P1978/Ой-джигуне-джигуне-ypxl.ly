{{ define "rh1" }}
  {{ .a }} fis g a) | b b b4 | d8( c b a) | b4 b=' |
{{ end }}

{{ define "rh2" }}
  c=''8( {{ .a }} a) a4 | b8( g) g4 | b8( {{ .b }} a g fis=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key e \minor
  \time 2/4
  \meter 1/2 #'(1)
  {{ template "rh1" (w `e'='8(\mf`) }}
  {{ template "rh2" (w `` ``) }} | e='8 e e'4 |
  {{ template "rh2" (w `` ``) }} | e4 e=' |

  R2\mf | e='2 | <e gis> | <e g> | <e a> | <e b'> | <a cis>4 <a dis> |
  <g=' e'>2 | <e a> | <e b'> | <b' g'>4 <a dis> | <g=' e'>2 |

  {{ template "rh1" (w `e='8(\p`) }}
  {{ template "rh2" (w `` `^\tRit`) }} | e='8 e e'4 \fermata |
  {{ template "rh2" (w `^\tATem` ``) }} | e='4 <g=' e'>4 \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
}
{{ end }}
