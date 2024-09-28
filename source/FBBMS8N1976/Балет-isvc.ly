{{ define "rh1" }}
  <d='' a'>8[)-. 8-. 8-. <d b'>]-. | <d a'>4 {{ .a }} |
  <d='' fis>8-. <b g'>-. \duo { <a'=' e'>4 | } { d''=''8( cis='') | }
  \af 4\! <a=' d>4. %
{{ end }}

{{ define "lh1" }}
  <d'=' fis>8[-. {{ .a }} 8-. 8-. <d g>]-. | <d fis>4 {{ .b }} |
  b,=8 g a4 | d4( d,=8) %
{{ end }}

{{ define "lh2" }}
  e='8[-. d-. cis-. b]-. | {{ .a }} | <b fis'>8[-. a-. b-. cis]-. | d='4. %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \major
  \time 2/4
  \partial 8 { fis''=''16(\f g | }
  {{ template "rh1" (w `8-.\> <b=' g'>8-.`) }} fis'16( g |
  {{ template "rh1" (w `<b=' g'>4\> `) }} a'=''8->-.\> |
  <b,=' g'>8[-. fis'-. e-. d]-. | <cis e>( \af 8\! a) b16(\< cis d \af 16\! e) |
  d=''8[-.\mf cis-. d-. e]-. | <a, d fis>4. a'8->-.\f\> |
  <b,=' g'>8[-. fis'-. e-. d]-. | <cis e>8.( d16 cis8)-. \af 8\! a |
  d=''8[-.\< cis-. d-. \af 8\! e]-. |
  \duo { fis''=''8. g16 fis8\f^\tRit e | d d4( cis8) | d=''2 \bar "|." }
  { <a'=' d>4. <g b>8 | a <fis b> <e a>4 | <fis=' a>2 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key d \major
  \partial 8 { r8 | }
  {{ template "lh1" (w `- \frBass` `fis='8-. g-.`) }} r |
  {{ template "lh1" (w `` `g='4`) }} fis'->-. |
  {{ template "lh2" (w `a=4 r`) }} fis8->-. |
  {{ template "lh2" (w `a=4. fis8`) }} e,8-. | fis-. g-. a4 | d,=2 |
}
{{ end }}
