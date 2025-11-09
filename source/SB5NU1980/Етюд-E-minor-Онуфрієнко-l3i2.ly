{{ define "lh1" }}
  {{ .a }} r em! r | b r e@m! r8 | g r e@m! r8 | a r am! r |
  d=8 r d7! r | a r d@7! r8 | g r gM! r | d' r g@M! r8 |
  a=,8 r am! r | fis r a@m! r8 | b r e@m! r8 | g r e@m! r8 |
  a=,8 r am! r | b=, r b7! r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key e \minor
  \time 2/4
  \duo { <b'=' b'>4\mf } { r8 <e''='' g> } <ais'=' ais'> <b b'> |
  \duo { <g'=' g'>4 } { r8 <b'=' e> } <fis=' fis'> <g g'> |
  \duo { <e'=' e'>4 } { r8 <g'=' b> } <dis=' dis'> <e e'> |
  \duo { <g'=' g'>4 } { r8 <c''='' e> } <fis=' fis'> <e e'> |
  \duo { <d'=' d'>4 } { r8 <fis'=' c'> } <cis=' cis'> <d d'> |
  \duo { <e'=' e'>4 } { r8 <a'=' c> } <d=' d'> <c c'> |
  \duo { <b= b'>4 } { r8 <d'=' g> } <ais= ais'> <b b'> |
  \duo { <g= g'>4 } { r8 <b= d> } <fis= fis'> <g g'> |
  \duo { <a= a'>4 } { r8 <c'=' e> } <gis= gis'> <a a'> |
  \duo { <c'=' c'>4 } { r8 <e'=' a> } <b= b'> <a a'> |
  \duo { <g= g'>4 } { r8 <b= e> } <fis= fis'> <g g'> |
  \duo { <b= b'>4 } { r8 <e'=' g> } <a= a'> <g g'> |
  \duo { <fis= fis'>4 } { r8 <c'=' e> } <eis= eis'> <fis fis'> |
  \duo { <a= a'>4 } { r8 <c'=' fis> } <g= g'> <fis fis'> |
  <e= g b e>4 <dis fis b e> |
  <e= g b e>8 r \tuplet 9/8 { b''='32[( ais b cis dis e fis g a='']) } |

  \duo { <b'=' b'>4\f } { r8 <e''='' g>16 16 } <ais,=' ais'>8 <b b'> |
  \duo { <g'=' g'>4 } { r8 <b'=' e>16 16 } <fis=' fis'>8 <g g'> |
  \duo { <e'=' e'>4 } { r8 <g'=' b>16 16 } <dis=' dis'>8 <e e'> |
  \duo { <g'=' g'>4 } { r8 <c''='' e>16 16 } <fis=' fis'>8 <e e'> |
  \duo { <d'=' d'>4 } { r8 <fis'=' c'>16 16 } <cis=' cis'>8 <d d'> |
  \duo { <e'=' e'>4 } { r8 <a'=' c>16 16 } <d=' d'>8 <c c'> |
  \duo { <b= b'>4 } { r8 <d'=' g>16 16 } <ais= ais'>8 <b b'> |
  \duo { <g= g'>4 } { r8 <b= d>16 16 } <fis= fis'>8 <g g'> |
  \duo { <a= a'>4 } { r8 <c'=' e>16 16 } <gis= gis'>8 <a a'> |
  \duo { <c'=' c'>4 } { r8 <e'=' a>16 16 } <b= b'>8 <a a'> |
  \duo { <g= g'>4 } { r8 <b= e>16 16 } <fis= fis'>8 <g g'> |
  \duo { <b= b'>4 } { r8 <e'=' g>16 16 } <ais= ais'>8 <b b'> |
  \duo { <c'=' c'>4 } { r8 <e'=' a>16 16 } <b= b'>8 <c c'> |
  \duo { <dis'=' dis'>4 } { r8 a'='16 a } <d=' d'>8 <dis dis'> |
  \duo { <e'=' e'>4 } { r8 <gis'=' b>16 16 } <dis=' dis'>8 <e e'> |
  \duo { <eis'=' eis'>4 } { r8 b'='16 b } <e=' e'>8 <eis eis'> |
  \duo { <fis'=' fis'>4 } { r8 <c''='' e>16 16 } <eis=' eis'>8 <fis fis'> |
  \duo { <a'=' a'>4 } { r8 <c''='' e>16 16 } <g=' g'>8 <fis fis'> |
  \duo { <b'=' b'>4 } { r8 <e''='' g>16 16 } <ais=' ais'>8 <b b'> |
  \duo { <d''='' d'>4 } { r8 fis''=''16 fis } <c='' c'>8 <a a'> |
  \duo { <b'=' b'>4 } { r8 <e''='' g>16 16 } <ais=' ais'>8 <b b'> |
  \duo { <cis''='' cis'>4 } { r8 <fis''='' ais> } <dis='' dis'>8 <fis fis'> |
  <e='' g b e>4 <e a cis e> | <e='' g b e> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  {{ template "lh1" (w `e=8-\stBass`) }} | e@m!4 b=,4 | e+em!8 r r4 |

  {{ template "lh1" (w `e=8`) }} | e=8 r e7! r | gis, r e@7! r8 |
  a=,8 r am! r | fis r a@m! r8 | b r e@m! r8 | a r am! r |
  g=,8 r e@m! r8 | fis=, r b@7! r8 | e+em!4 a+aM! | e+em! r |
}
{{ end }}
