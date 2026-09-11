{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key cis \minor
  \time 2/4
  \meter 1/2 #'(1)
  <e''='' gis>8\(\p <cis a'>_\aDol <dis fis> <bis gis'> |
  <cis='' e>4_\aLeg <a fis'> | <bis dis>4 <gis e'> | <a cis>4~ 8\) r8 |
  <b=' dis>8\( <a cis> <gis b> <fis a> | <e gis>4 <cis e> |
  <dis=' fis>4 <bis gis'> | cis4~ cis='8\) r8 |

  <cis'='' e>4\(\< <e, gis> | <b' dis>4. <a cis>8 |
  <fis=' a>4 \duo { dis''=''8 cis='' | } { fisis'='4 | } |
  \af 2\! <gis=' b>2\) | <gis b>4\(\> <cis, e> | <fis a>4. <a, cis>8 |
  <gis= bis>4 \duo { gis'='8 fis=' | } { bis=4 | } |
  \af 4.\! <cis=' e>4.\) <dis fis>8\( | <e gis>4\< <cis' e> |
  <b=' dis>4. <gis b>8 | \duo { ais'='8 b cis=''4 | } { fis'='4 eis8 fis=' | }
  \af 2\! <gis=' b>2\) |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key cis \minor
}
{{ end }}
