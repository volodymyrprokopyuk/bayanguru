{{ define "rh1" }}
  {{ .a }} f g f g e | d e) f( e f d | c d) e( d e c='' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} f g f g e) | d( e f e f d) | c( d e d e c=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 3/4
  \meter 1/4 1,1,1
  {{ template "rh1" (w `e''=''8(\p`) }} | b c) d( e f d) |
  {{ template "rh1" (w `e=''8(`) }} | b c) d( e c=''4) |

  r4 <bes=' cis e>4 r | r <gis b d> r | r <fis a c> r |
  r4 <f=' gis b> r | r <b e g>4 4 | r <b e gis>4 4 |
  r4 <c='' e a>4 4 | r^\tRit <e gis b> <e='' g c>-- \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  r4 e'='4-\frBass c~ | c d b~ | b c a~ | a b g= |
  \duo {
    b'='4 \rest <e,=' g>4 b' \rest | b \rest <d, g> b' \rest |
    b='4 \rest <c, fis> b' \rest | b \rest <b,= f'> <c=' e> |
  } { c'='2 s4 | b2 s4 | a2 s4 | g=2. | }

  \meter 1/4 1,1,1
  {{ template "lh1" (w `e'='8(`) }} | b( c d e f d) |
  {{ template "lh1" (w `e='8(`) }} | b( c d e) <c=' g'>4-- |
}
{{ end }}
