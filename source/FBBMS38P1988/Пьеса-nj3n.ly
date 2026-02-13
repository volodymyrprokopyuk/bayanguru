{{ define "rh1" }}
  {{ .a }} f e d c8)-. b-. | a4( e8)-. e-. | b'[-. e,-. b'-. e,]-. |
  c'=''16( d c b a8)-. c=''-. |
{{ end }}

{{ define "lh1" }}
  {{ .a }} r8 <a d>-. | <a c>2 | <a d>8-. r8 8-. r |
  \duo { e'='8.( d16 c='8) } { a=4~ a=8 } r8 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  {{ template "rh1" (w `e''=''16(\mf`) }}
  b='8[-. a-. g-. fis]-. | g4( e8)-. e-. |
  fis='8[( a)-. g-. fis]-. | e='4. r8 |

  {{ template "rh1" (w `e'=''16(`) }}
  <a=' f'>8[-.\f c-. <a f'>-. c]-. |
  \duo { e''=''8.( d16 c8)-. c=''-. | } { g'='4~ g='8 r | }
  <f,=' b>8[(\> d')-. <e, c'>-. b']-. | \af 2\! a='2-- \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `<a= c>4-\frBass`) }} | <b= dis>8-. r8 8-. r |
  \duo { b=4( g8) } { e=4~ e=8 } r8 | <a c>8-. r b-. r | e,[( d')-. c-. b=]-. |

  {{ template "lh1" (w `<a= c>4`) }} | <f= c'>8-. r8 8-. r |
  c=4. r8 | <d a'>-. r <e gis>-. r | a-. e-. a,=,-- r |
}
{{ end }}
