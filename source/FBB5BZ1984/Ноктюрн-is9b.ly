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
  <b=' dis>4. <gis b>8 | \duo { ais'='8 b cis=''4 | } { fisis'='4 eis8 fisis=' | }
  \af 2\! <gis=' b>2\) |
  \duo {
    ais'='4\(\> gis | <dis b'>4. <cisis eis>8 | <cis fisis>2 | \af 2\! gis'='2\) |
  } { e'='2 | s2 | s2 | b=8 cis cisis dis=' | }

  <fis=' a>4(\mf <b, dis>_\dCre | <e gis>2) | <dis fis>4( <gis, bis> |
  <ais= cis>8 <bis dis> <cis e> <dis=' gis>) |
  \duo {
    ais'='4\( gis | <dis b'>8 gis fis e | dis4 <cis fisis> |
    <bis= gis'>8 bis' <ais cis> <bis=' dis>\) |
  } { e'='2 | s2 | s2 | s2 | }
  <cis'='' e>4\(\f <e, gis> | <b' dis>4. <a cis>8 |
  <fis=' a>4 \duo { dis''=''8 cis='' | } { fisis'='4 | } | <gis=' b>2\) |

  <gis=' b>4\( <cis, e> | <fis a>4. <a, cis>8 |
  <gis= bis>8 <e' gis> <fis ais> <gis bis> |
  <ais=' cis>8 <bis dis> <cis e> <dis fis>\) |
  <e='' gis>8\( <cis a'> <dis fis> <bis gis'> | <cis e>4 <a fis'> |
  <bis=' dis>4_\dDim <gis e'> | <a cis>4~ 8\) r |
  <b=' dis>8\( <a cis> <gis b> <fis a> | <e gis>4 <cis e> |
  <dis=' fis>4^\tRit <bis gis'> | <cis=' cis'>4~\p 8\) r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key cis \minor
  \meter 1/2 #'(1)
  \rep 3 { R2 | } | r8 cis=8---\frBass dis-- eis-- |
  fis=8\( fisis gis a | ais4 b | bis e | cis8 a gis e=\) |

  \duo {
    r4 <e= gis>4 | r a | r <a b> | r <gis b> | r <e a> | r <fis a> |
    r4 <dis= gis>4 | r <e gis>8 d \rest | r4 <gis cis> | r <gis= b> |
  } { cis=2 | fis | dis | e | a, | dis | gis, | cis4~ cis8 s8 | cis2 | dis= | }
}
{{ end }}
