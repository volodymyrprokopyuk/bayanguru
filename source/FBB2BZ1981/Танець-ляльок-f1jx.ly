{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \major
  \time 3/4
  \meter 1/4 1,1,1
  \repeat segno 2 {
    \volta 1
    <a'=' cis>8-.\p 8-. 8-. r <gis e'>4 |
    <cis='' e>8-. 8-. 8-. r <a fis'>4 |
    <cis='' e>8-.\< r8 8-. 8-. 8( \af 8\! a') |
    <d,='' a'>4(\> <d gis>8)-. r8 8-. \af 8\! r8 |
    <gis,=' b>8-. 8-. 8-. r <gis e'>4 |
    <b=' d>8-. 8-. 8-. r <gis fis'>4 |
    <b=' e>8-.\< r8 8-. 8-. 8( \af 8\! gis') |
    <bis,=' fis'>4(\> <cis='' e>8)-. r8 8-. \af 8\! r8 |

    <a=' cis>8-.\p 8-. <a d>-. r <gis e'>4 |
    <cis='' e>8-.\< 8-. <cis gis'>-. r <cis a'>4 |
    <e='' cis'>8-. r8 8-. 8-. <d b'>-. \af 8\! <cis a'>-. |
    <b=' gis'>4(\mf <d fis>8)-. r8 8-. r8 |
    <d='' b'>8-. 8-. 8-. r <bis fis'>4( |
    <cis='' a'>8)-.\> 8-. 8-. r <ais e'>4( |
    <e'='' gis>8 <d fis> <cis eis>)-. r \af 8\! <d e>8-. r |
    <cis='' a'>8-.\p r r4 r \fine \bar "||"

    \volta 2
    <a=' cis>8-.\p 8-. 8-. r <a fis'>-. r |
    <b=' cis>8-. 8-. 8-. r <b gis'>-. r |
    <ais=' cis>8-.\< 8-. 8-. r <ais g'>-. r |
    <b=' fis'>8( e) d-. cis-. b-. \af 8\! a-. |
    <fis=' gis>8-.\p 8-. 8-. r <fis d'>-. r |
    <fis=' a>8-. 8-. 8-. r <fis cis'>-. r |
    <fis=' gis>8-.\< 8-. 8( b <fis a> gis |
    <eis=' cis'>4) r8 \af 4.\! %
    \duo { cis''=''8~ cis=''4 | } { s8 bis'='( b=') | }

    <a=' cis>8-.\mp 8-. 8-. r <a fis'>-. r |
    <b=' cis>8-. 8-. 8-. r <b gis'>-. r |
    <ais=' cis>8-.\< 8-. 8-. r <ais g'>-. r |
    <b=' fis'>8-. r r4 <b gis'>8( \af 8\! <cis a'> |
    <d='' b'>8)-.\mf 8-. 8-. r <b gis'>4 |
    <cis='' a'>8-. 8-. 8-. r <a fis'>4 |
    <bis=' gis'>8-. 8-. <gis dis'>-. r <b=' eis>-. r |
    \duo { fis''=''4(\> eis \af 4\! e='')\p \bar "||" }
    { <a'=' cis>2 <b=' d>4 | }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \major
  a=4-\frBass r <cis e> | \rep 2 { a=4 r <cis=' e> | }
  b=4( b8)-. r <d e>-. r | \rep 3 { e,=4 r <b'= d> | }
  a=4( a8)-. r <cis e>-. r | \rep 2 { a=4 r <cis=' e> | }
  a=4 r <e'=' a> \clef treble |

  d='4( d8)-. r <fis a>-. r | d-. r r4 dis( |
  e='8)-. r r4 g4( | fis g8)-. r gis-. r | a-. r a,=-. r r4 |

  fis'='4 r fis8-. r | eis4 r eis8-. r | e4 r e8-. r |
  d='8 r r4 d8-. cis-. | b4 r bis8-. r | cis4 r a8( b |
  bis=4) r bis( | cis8 d cis d dis eis | fis4) r fis8-. r |
  eis='4 r eis8-. r | e4 r e8-. r | d( e eis fis b a |
  gis='8)-. r r fis-. eis4 | e8-. r r cis-. bis=4 \clef bass |
  gis=8-. r bis-. r cis-. r | fis,4( g gis=) |
}
{{ end }}
