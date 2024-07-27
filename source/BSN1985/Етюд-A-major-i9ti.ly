{{ define "rightHand" }}
\relative {
  \tempo "Con moto"
  \clef treble
  \key a \major
  \time 2/4
  \duo {
    r16\p <cis'=' e>16_\aSta 16 16 <cis dis> <cis e> <cis fis> <cis e> |
    r16 <e=' gis>16_\dCre 16 16 <e fisis> <e gis> <e a> <e gis> |
    r16 <e=' a>16 16 16 <e gis> <e a> <e b'> <e a> |
    r16 <fis=' a>16 16 16 <f gis> <f a> <f b> <f a> |
    r16 <a=' cis>16 16 16 <a bis> <a cis> <a d> <a cis> |
    r16 <a=' cis>16 16 16 <a bis> <a cis> <a dis> <a cis> |
    r16\> <b=' e>16 16 16 <b dis> <b e> <b fis'> <b e> |
    r16 <cis='' e>16 16 16 <c dis> <dis gis> \af 8\! <cis='' e>8 |
  } { a=2 | b | cis | d | e | fis | gis | a=' | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \major
}
{{ end }}
