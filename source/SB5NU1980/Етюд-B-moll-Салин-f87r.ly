{{ define "rh1" }}
  {{ .a }} <b b'> <cis cis'> <d d'> <e e'> \af 8\! <fis fis'> |
  <g='b e g>4.->\> <fis ais d fis>4-> \af 8\! <e=' ais cis e>8-> |
{{ end }}

{{ define "rh2" }}
  <d=' fis b d>8->\sf\< <b b'> <cis cis'> <d d'> <e e'> \af 8\! <fis=' fis'> |
{{ end }}

{{ define "rh3" }}
  <g=' b g'>8--\sf <b b'>-. <a a'>-. <g g'>-. <fis fis'>-. <e e'>-. |
  <d=' fis d'>8->\sf\> <fis fis'>-. <e e'>-. <d d'>-. <cis cis'>-. \af 8\! <b b'>-. |
  <ais= cis ais'>4.\< <b d b'>4 \af 8\! <cis=' e cis'>8 |
{{ end }}

{{ define "lh1" }}
  {{ .a }} bm!8) r r | cis,=,(-> d-. e-. fis-. gis-. ais=,)-. |
{{ end }}

{{ define "lh2" }}
  b=,4.(-> gm!8) r r | e-- g-. fis-. e-. d-. cis-. |
  b=,8-> d-. cis-. b-. a-. g-. | fis-. g-. fis-. e-. d-. cis=,-. |
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
  <b=' d g b>4.->\> <a cis fis a>4-> \af 8\! <g cis e g>8-> |
  <fis=' a d fis>8->\sf\< <d d'> <e e'> <fis fis'> <g g'> \af 8\! <a a'> |
  <d='' fis b d>4.->\ff <cis eis ais cis>4-> <b eis gis b>8-> |
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
    <a=' a'>8^\accent <bes bes'> <a a'> <aes aes'>^\accent <a a'> \af 8\! <aes=' aes'> |
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
    <g=' ais e' g>4.->\> <fis ais d fis>4-> \af 8\! <e=' ais cis e>8-> |
  }
  {{ template "rh2" }} {{ template "rh3" }} {{ template "rh2" }}
  \rep 2 {
    <g=' b e g>4.->\< <a d fis a>4-> \af 8\! <ais e' fis ais>8-> |
    <b=' d fis b>8\sf\< <b, b'> <cis cis'> <d d'> <e e'> \af 8\! <fis=' fis'> |
  }
  <g=' b e g>8->\sf\> <b b'>-. <a a'>-. <g g'>-. <fis fis'>-. \af 8\! <e e'>-. |
  <cis=' e a cis>8->\sf\< <a a'> <b b'> <cis cis'> <d d'> \af 8\! <e e'> |
  <fis=' a d fis>8->\sf\> <a a'>-. <g g'>-. <fis fis'>-. <e e'>-. \af 8\! <d d'>-. |
  <b= d g b>8->\sf\< <g g'> <a a'> <b b'> <cis cis'> \af 8\! <d d'> |
  <e=' g b e>8-.\> <g g'>-. \af 8\! <fis fis'>-. <e e'>-.\< <d d'>-. \af 8\! <e e'>-. |
  <fis=' b d fis>4.->\> <ais, e' fis ais>4~-> 16 \af 16\! <ais ais'>-> |
  <b= d fis b>4.->\< <b e g b>4~-> 16 \af 16\! <cis cis'>-> |
  <d=' fis b d>4.->\< <d g b d>4~-> 16 <e e'>-> |
  <fis=' b d fis>4.-> <gis d' e gis>4~-> 16 \af 16\! <ais ais'>-> |
  <b=' d fis b>8->\f r r <cis, e g b>8-> 8-> 8-> | <b= d fis b>-> r r r4. \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
  {{ template "lh1" (w `b,=,4.(->-\puBass`) }}
  {{ template "lh1" (w `b=,4.(->`) }} {{ template "lh2" }}
  {{ template "lh1" (w `b'=,4.(->`) }}
  b=,4.(-> gm!8) r r | e,(-. fis-. g-. a-. b-. cis)-. |
  d=4.( dM!8) r r | gis,(-. a-. b-. cis-. dis-. eis)-. |
  fis=4.( fisM!8) r r | e4.( a@7!8) r8 r |
  d=8-. cis-. d-. e-. dis-. e-. | f-. e-. f-. fis-. eis-. fis=-. |

  g=4.-> fis-> | f-> e-> |
  ees=8-. d-. ees-. f-. e-. f-. | fis-. f-. fis-. g-. fis-. g-. |
  aes=4.-> g-> ges-> f-> | e fis@M! | dis4. b@M! |
  d=4. e@M! | cis4. a@M! | d4.-> a'-> | fis-> dis'-> |
  e='4.-> cis-> | ais-> fis-> |
  \rep 2 { b,=,4.(-> gm!8) r r | r fis(-. g-. gis-. a-. ais=,)-. | }
  {{ template "lh2" }}
  \rep 2 { b'=,4.(-> gm!8) r r | a'(-. g-. fis-. e-. d-. cis=)-. | }
  b=,4.(-> gm!8) r r | e,-> g-. fis-. e-. fis-. g-. |
  a=,4.(-> aM!8) r r | d,-> fis-. e-. d-. e-. fis-. |
  g=,4.(-> aM!8) r r | cis-> e-. d-. cis-. b-. cis-. |
  d=8-. e-. d-. cis-. d-. cis-. | b-> d-> cis-> b-> a-> g-> |
  fis=,8-> b-> a-> g-> fis-> e-> | d-> g-> fis-> e-> d-> cis-> |
  b=,,8-> r r a'-> g-> a-> | b=,-> r r r4. |
}
{{ end }}
