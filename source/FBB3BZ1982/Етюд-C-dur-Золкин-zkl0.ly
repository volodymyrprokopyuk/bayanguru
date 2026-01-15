{{ define "rh1" }}
  <a=' f'>8(\< <g e'> <f d'> \af 8\! <e c'> | <f d'> <e c'> <d b'> <c a'> |
  <b= gis'>2)\f | <gis'=' e'>2 |
{{ end }}

{{ define "lh1" }}
  d='8\( c b a | b a g f | e fis gis a | gis a b c\) | d\( c b a | g f e d= |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  \meter 1/2 #'(1)
  <e''='' c'>8[\mf r8 8] r | <d b'>[ r8 8] r | <e c'>2 | <e g> |
  <c='' a'>8[ r8 8] r | <b gis'>[ r8 8] r | <c a'>2 | <c e> |
  <a=' f'>8[\f r8 8] r | <g e'>2 | <aes f'>8[\p r8 8] r | <g e'>2 |
  {{ template "rh1" }}
  <a=' f'>8(\mf <g e'> <f d'> <e c'> | <d b'> <c a'> <b g'> <a f'> |
  <gis= e'>2) | <d'=' f>4 r |

  c'=''8\( d e f | g a g f | e f e d | c d c b\) |
  a='8\( b c d | e f e d | c d c b | a b a g\) |
  a='8(\f b c d | <g, e'>2) | aes8(\p bes c d | <g, e'>2) | {{ template "rh1" }}
  <a=' f'>8\( <g e'> <f d'> <e c'> | <d b'>\> <c a'> <b g'>8 \af 8\! 8 |
  <e=' c'>2~\p | 8\) r r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  \meter 1/2 #'(1)
  c'='8\(-\frBass d e f | g a g f | e f e d | c d c b\) |
  a=8\( b c d | e f e d | c d c b | a b a g\) |
  f=8( g a b | c d c g) | f( g aes bes | c d e c=') |
  \clef bass {{ template "lh1" }} | cis dis e fis | g a ais b=\) |

  <c=' e>8[ r8 8] r | <b d>[ r8 8] r | <c e>2 | g |
  <a= c>8[ r8 8] r | <gis b>8[ r8 8] r | <a c>2 | e |
  f=8( g a b | c d c g) | f( g aes bes | c d e c) |
  {{ template "lh1" }} | c e g c | c,=\) r r4 |
}
{{ end }}
