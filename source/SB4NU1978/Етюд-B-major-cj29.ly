{{ define "rh1" }}
  {{ .a }} <cis e ais> <dis fis b> %
  <e=' gis cis>4 <fis ais dis>8 |
  <dis=' fis b>8 <cis e ais> <dis fis b> %
  <e=' gis cis>4 <fis ais dis>8 |
  <dis=' fis b>8 {{ .b }} <cis e ais> <dis fis b> %
  <dis=' fis b>8 <e gis cis> <fis ais dis> |
  <fis=' ais dis>8 <gis b e> <ais cis fis> %
  <b=' dis gis>8 <cis e ais> <dis='' fis b> |
{{ end }}

{{ define "rh2" }}
  <e='' gis cis>8 <dis fis b> <e gis cis> %
  <cis='' e ais>8 <b dis gis> <cis='' e ais> |
{{ end }}

{{ define "rh3" }}
  {{ .a }} <ais cis fisis> <b dis gis> %
  <cis=' fisis ais>4 <dis=' fisis b>8 |
{{ end }}

{{ define "lh1" }}
  {{ .a }} r bM!] r fis@M! r8 | b[ r bM!] r fis@M! r8 |
  \rep 2 { b=,8 r r bM! r r | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key b \major
  \time 6/8
  {{ template "rh1" (w `<dis'=' fis b>8\f` `_ \dCre`) }}
  {{ template "rh2" }}
  <dis='' gis b>8_\dDim <cis fisis ais> <dis gis b> %
  <b=' dis gis>8 <ais cis fisis> <b dis gis> |
  <b=' dis gis>8 <ais cis fis> <gis b eis> %
  <gis=' b eis>8 <ais cis fis> <b dis gis> | <ais=' cis fis>2. |
  {{ template "rh1" (w `<dis,=' fis b>8\mf` ``) }}
  <e='' gis cis>8 <gis b e> <fis ais dis> %
  <e='' gis cis>8 <dis fis b> <e gis cis> |
  <dis='' fis b>8 <fis ais dis> <e gis cis> %
  <dis='' fis b>8 <cis e ais> <dis fis b> |
  <cis='' e ais>8 <b dis gis> <ais cis fis> %
  <gis=' b e>8 <fis ais dis> <e gis cis> | <dis=' fis b>8 8 8 4 r8 |

  <b'=' dis>8\p\< 8 8 8 8 \af 8\! 8 |
  <b=' dis>8\> <ais cis dis> <gis b dis> %
  <fisis=' ais dis>8 <eis gis dis'> \af 8\! <fisis ais dis> |
  <gis=' b dis>8\< <fisis ais dis> \af 8\! <gis b dis> %
  <ais=' cis dis>8\> <gis b dis> \af 8\! <ais cis dis> |
  <b=' dis>8\< 8 8 8 8 \af 8\! 8 |
  <b=' dis>8 <gis cis e> <gis dis' fis> %
  <gis=' e' gis>8 <gis cis e> <gis b dis> |
  <fis=' ais cis>8 <fis b dis> <fis cis' e> %
  <fis=' dis' fis>8 <fis b dis> <fis ais cis> |
  <e=' gis b>8 <e ais cis> <e b' dis> %
  <e=' cis' e>8 <e ais cis> <e gis b> |
  <fisis=' ais>8 <dis gis b> <dis ais' cis> %
  <dis=' ais' cis>8 <dis gis b> <dis fisis ais> |
  gis='8 <dis b' dis>8 8 8 8 8 |
  <dis=' ais' cis>8 <dis gis b> <dis ais' cis> %
  <dis=' gis b>8 <dis fisis ais> <dis gis b> |
  <dis=' fis ais>8 <fis ais dis> <ais dis fis> %
  <dis='' fis ais>8 <ais dis fis> <dis fis ais> |
  <cisis,=' eis ais>8 <eis ais cisis> <gis cisis eis> %
  <cisis='' eis ais>8 <ais cisis eis> <cisis eis ais> |
  <fis,=' ais dis>4. r8 <cis=' e fis ais>4 \fermata |

  {{ template "rh1" (w `<dis=' fis b>8\f` `_ \dCre`) }}
  {{ template "rh2" }}
  <ais=' cis fis>8_\dDim <gis b e> <fis ais dis> %
  <e=' gis cis>8 <dis fis b> <cis e ais> |
  {{ template "rh3" (w `<b= dis gis>8\mf`) }}
  {{ template "rh3" (w `<b= dis gis>8`) }}
  <b= dis gis>8 <ais cis fisis> <b dis gis> %
  <b= dis gis>8 <ais cis fisis> <b dis gis> |
  <cis=' e ais>8_\dCre <b e gis> <cis e ais> %
  <dis=' fis b>8 <cis fis ais> <dis fis b> |
  <e=' fis cis'>8 <dis fis b> <e fis cis'> %
  <fis=' b dis>8 <e b' cis> <fis b dis> |
  <gis=' b e>8 <gis b dis> <gis b e> %
  <b=' dis fis>8 <fis b dis> <b dis fis> |
  <b=' e gis>8 <gis' b e> <fis ais dis> %
  <e='' gis cis>8\> <dis fis b> <cis e ais> |
  <b=' dis gis>8 <ais cis fis> <gis b e> %
  <fis=' ais dis>8 <e gis cis> <dis fis b> |
  <cis=' e ais>8^\tRit <b dis gis> \af 16\! <ais cis fis> %
  \clef bass <gis= b e>8 <fis ais dis> <e gis cis> |
  <dis= fis b>8 <fis b dis>\< \clef treble <b dis fis> <dis fis b>-> %
  <fis=' b dis>8-> \af 8\! <b dis fis>-> |
  <dis='' fis b>4->\f r8 r4. \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \major
  {{ template "lh1" (w `b,=,8[-\stBass`) }}
  fis=,8 r r fisM! r r | gis r r gism! r r |
  cis=8 r r cis7! r r | fis gis fis e dis cis |
  {{ template "lh1" (w `b=,8[`) }}
  e,=,8 r r cis@m! r8 r | fis r r b@M! r8 r |
  fis=,8 r r fis7! r r | b=, r r bM!4 r8 |

  gis=,8 r r gism! r r | \rep 2 { gis=,8 r r dis@M! r8 r | }
  gis=,8 r r gism! r r | gis r r cis@m! r8 r |
  fis=,8 r r b@M! r8 r | e r r ais r r |
  dis=8[ r dis] dis[ r dis] | gis, r r gism! r r |
  ais=,8 r r b r r | ais r r dis@m! r8 r |
  ais=,8 r r aisM! r r | dis e dis cis( fis,=,4) \fermata |

  {{ template "lh1" (w `b=,8[`) }}
  \rep 2 { fis=,8 r r fisM! r r | }
  \rep 2 { gis=,8[ r gism!] r dis'= r | }
  gis,=,8 r r gism! r r | fis[ r fisM!] b[ r bM!] |
  ais=,8[ r fis@M!] a8[ r b@M!] | gis8[ r e@M!] fis8[ r b@M!] |
  e=,8 r r eM! r r | fis r r b@M! r8 r | fis[ r fis] fis[ r fis] |
  b=,4 b8 b[-> b-> b]-> | b=,4-> r8 r4. |
}
{{ end }}
