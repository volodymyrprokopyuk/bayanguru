{{ define "rightHand" }}
\relative {
  \tempo "Con moto"
  \clef treble
  \key a \minor
  \time 2/4
  \repeat volta 2 {
    f'='16(_\markup \dAlt p mf e f e f e a c | f, e f e f e gis b) |
    f='16( e f e f e gis b | f e f e f e a c) |
    bes='16( a bes a bes a cis e | bes\< a bes a bes a d \af 16\! f) |
    \alternative {
      \volta 1 { c=''16( b c b c b dis fis | c\> b c b c b gis \af 16\! e=') | }
      \volta 2 { e'=''16( e, f e f e gis b | a4\> \af 4\! a'='') \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  <a= c>4-\frBass 8-. e-. | \rep 2 { <gis= d'>4 8-. e=-. | }
  <a= c>4 8-. e=-. \clef treble <cis'=' g'>4 8-. a-. | <d f>4 8-. a-. |
  <dis=' a'>4 8-. b-. | <e=' gis>4 8-. \clef bass e,=-. |
  <a= c>4 <gis d'>8-. e-. | <a= c>4 r |
}
{{ end }}
