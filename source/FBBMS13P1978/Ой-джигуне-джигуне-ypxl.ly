{{ define "rh1" }}
  {{ .a }} fis g a) | b b b4 | d8( c b a) | b4 b=' |
{{ end }}

{{ define "rh2" }}
  c=''8( {{ .a }} a) a4 | b8( g) g4 | b8( {{ .b }} a g fis=') |
{{ end }}

{{ define "lh1" }}
  {{ .a }} a) a4 | b8( g) g4 | b8( a g fis=) |
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

  R2\mf | e='2 | <e fis> | <e g> | <e a> | <e b'> | <a cis>4 <a dis> |
  <g=' e'>2 | <e a> | <e b'> | <b' g'>4 <a dis> | <g=' e'>2 |

  {{ template "rh1" (w `e='8(\p`) }}
  {{ template "rh2" (w `` `^\tRit`) }} | e='8 e e'4 \fermata |
  {{ template "rh2" (w `\f^\tATem` ``) }} | e='4 <g=' e'>4 \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  \meter 1/2 #'(1)
  R2 | <e'=' g>2(-\frBass | fis4 d | g) r |
  fis,=4( e') | g,( e') | | a,( b | c2) |
  fis,=4( e') | g,( e'=') \clef bass | |
  d='8( c b a) | g4 <e= b'> |

  e=8( fis g a) | b b b4 | d8( c b a) | b4 b |
  {{ template "lh1" (w `c='8(`) }} | e=8 e e4 |
  {{ template "lh1" (w `c'='8(`) }} | e=4 e= |

  R2 | <fis= dis'>2 | <f d'> | <e gis d'> |
  <a= c>2 | b | b, | c \fermata | <fis, e'>4 r |
  <g=, e'>4 r | a b | e,=,2 \fermata |
}
{{ end }}
