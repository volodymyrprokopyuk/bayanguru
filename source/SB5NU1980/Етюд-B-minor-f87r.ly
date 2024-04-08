{{ define "rh1" }}
  {{ .a }} <b b'> <cis cis'> <d d'> <e e'> \af 8\! <fis fis'> |
  <g='b e g>4.-> <fis ais d fis>4->\> \af 8\! <e=' ais cis e>8-> |
{{ end }}

{{ define "rh2" }}
  <d=' fis b d>8->\sf\< <b b'> <cis cis'> <d d'> <e e'> \af 8\! <fis=' fis'> |
{{ end }}

{{ define "rh3" }}
  <g=' b g'>8--\sf <b b'>-. <a a'>-. <g g'>-. <fis fis'>-. <e e'>-. |
  <d=' fis d'>8->\sf\> <fis fis'>-. <e e'>-. <d d'>-. <cis cis'>-. \af 8\! <b b'>-. |
  <ais= cis ais'>4.\< <b d b'>4 \af 8\! <cis=' e cis'>8 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key b \minor
  \time 6/8
  {{ template "rh1" (w `<d'=' fis b d>8->\sf\<`) }}
  {{ template "rh1" (w `<d=' fis b d>8->\sf\<`) }}
  {{ template "rh2" }} {{ template "rh3" }}
  {{ template "rh1" (w `<d=' fis b d>8->\sf\<`) }}
  {{ template "rh2" }}
  <b=' d g b>4.-> <a cis fis a>4->\> \af 8\! <g cis e g>8-> |
  <fis=' a d fis>8->\sf\< <d d'> <e e'> <fis fis'> <g g'> \af 8\! <a a'> |
  <d='' fis b d>4.->\ff <cis eis ais cis>4-> <d e gis b>8-> |
  <ais=' cis fis ais>8 <cis cis'> <b b'> <ais ais'> <gis gis'> <fis fis'> |
  <a=' cis g' a>8\> <cis cis'> <b b'> <a a'> <aes aes'> \af 8\! <g g'> |
  <fis=' d' fis>4.->\p\< <g d' g>-> | <gis d' gis>-> \af 4.\! <a=' d a'>-> |

  \duo { d''=''4.\mf\> d | d \af 4.\! d='' | }
  {
    <bes'=' bes'>8^\accent <c c'> <bes bes'> <a a'>^\accent <bes bes'> <a a'> |
    <gis=' gis'>8^\accent <a a'> <gis gis'> <g a'>^\accent <aes aes'> <g=' g'> |
  }
  <g=' ees' g>4.->\mp\< <aes ees' aes>-> | <a ees' a>-> \af 4.\! <bes ees bes'>-> |
  \duo { ees''=''4.\> ees | ees \af 4.\! ees='' | }
  {
    <ces''='' ces'>8^\accent <des des'> <ces ces'> <bes bes'>^\accent <ces ces'> <bes bes'> |
    <a=' a'>8^\accent <bes bes'> <a a'> <aes aes'>^\accent <bes bes'> \af 8\! <aes=' aes'> |
  }
  <ais=' ais'>8(-.\< <b b'>-. \af 8\! <cis cis'>-. <gis' gis'>-.\f <fis fis'>-. <dis dis'>-. |
  <cis='' cis'>8-.\> <b b'>-. \af 8\! <fis fis'>-. <dis dis'>-.\< <e e'>-. \af 8\! <fis fis'>)-. |
  <gis=' gis'>8(-.\mf <a a'>-. <b b'>-. <fis' fis'>-. <e e'>-. <cis cis'>-. |
  <b=' b'>8-.\> <a a'>-. <e e'>-. <cis cis'>-. <b b'>-. \af 8\! <a a'>)-. |
  <fis= fis'>8(-.\< <a a'>-. <d d'>-. <eis eis'>-. <fis fis'>-. <a a'>-. |
  <d='' d'>8-. <eis eis'>-. \af 8\! <fis fis'>-. <a a'>-.\ff <aes aes'>-. <g g'>-. |
  <fis='' fis'>8-.\> <e e'>-. <cis cis'>-. <ais ais'>-. <fis fis'>-. <e' e'>-. |
  <cis='' cis'>8-. <ais ais'>-. <fis fis'>-. <f f'>-. <e e'>-. \af 8\! <ees=' ees'>)-. |

  \rep 2 {
    {{ template "rh2" }}
    <g=' ais e' g>4.->\> <fis ais d fis>4-> \af 8\! <e ais cis e>8-> |
  }
  {{ template "rh2" }} {{ template "rh3" }} {{ template "rh2" }}
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
}
{{ end }}
