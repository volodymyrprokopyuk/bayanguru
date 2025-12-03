{{ define "rh1" }}
  {{ .a }} <b d>) | r <d f>( <c e>) | r <f a>( <e=' g>) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} d e f g4) | d8( e f g a4) | f8( g a b c='4) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 3/4
  {{ template "rh1" (w `r4\mf <c'=' e>4(`) }} | <e c'>-. <c fis>-. <g' b>-. |
  {{ template "rh1" (w `r4 <c,=' e>4(`) }} | <a f'>-. <f b>-. <e c'>-. |
  r4\p <g=' c>4( <e bes'>) | r_ \dCre <g bes>( <e a>) |
  r4 <a=' d>4( <fis c'>) | r <a c>( <fis b>) |
  r4\f <b=' e>4( <gis d'>) | r <e' a>( <cis g'>) |
  f=''8(\> e d4)-. \af 4\! <b e>-. | c=''2. \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  {{ template "lh1" (w `c=8(-\frBass`) }} | a-. d,-. <g b>-. |
  {{ template "lh1" (w `c,=8(`) }} | d,-. g-. c,-. |
  c=8( d e f g4) | cis,8( d e d cis4) |
  d=8( e fis g a4) | dis,8( e fis e dis4) |
  e=8( fis gis a b4) | a8( b cis d e4) |
  d='8( e f4)-. <g, f'>-. | <c=' e>2. |
}
{{ end }}
