{{ define "rh1" }}
  {{ .a }} <b b'> <cis cis'> <d d'> <e e'> \af 8\! <fis fis'> |
  <g='b e g>4.-> <fis ais d fis>4->\> \af 8\! <e=' ais cis e>8-> |
{{ end }}

{{ define "rh2" }}
  <d=' fis b d>8->\sf\< <b b'> <cis cis'> <d d'> <e e'> \af 8\! <fis=' fis'> |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key b \minor
  \time 6/8
  {{ template "rh1" (w `<d'=' fis b d>8->\sf\<`) }}
  {{ template "rh1" (w `<d=' fis b d>8->\sf\<`) }}
  {{ template "rh2" }}
  <g=' b g'>8--\sf <b b'>-. <a a'>-. <g g'>-. <fis fis'>-. <e e'>-. |
  <d=' fis d'>8->\sf\> <fis fis'>-. <e e'>-. <d d'>-. <cis cis'>-. \af 8\! <b b'>-. |
  <ais= cis ais'>4.\< <b d b'>4 \af 8\! <cis e cis'>8 |
  {{ template "rh1" (w `<d=' fis b d>8->\sf\<`) }}
  {{ template "rh2" }}
  <b=' d g b>4.-> <a cis fis a>4->\> \af 8\! <g cis e g>8-> |
  <fis=' a d fis>8->\sf\< <d d'> <e e'> <fis fis'> <g g'> \af 8\! <a a'> |
  <d='' fis b d>4.->\ff <cis eis ais cis>4-> <d e gis b>8-> |
  <ais=' cis fis ais>8 <cis cis'> <b b'> <ais ais'> <gis gis'> <fis fis'> |
  <a=' cis g' a>8\> <cis cis'> <b b'> <a a'> <aes aes'> \af 8\! <g g'> |
  <fis=' d' fis>4.->\p\< <g d' g>-> | <gis d' gis>-> \af 4.\! <a=' d a'>-> |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
}
{{ end }}
