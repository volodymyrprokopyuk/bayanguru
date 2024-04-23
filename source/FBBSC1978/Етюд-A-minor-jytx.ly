{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  <c'=' a'>16(\mf e) e a <d, b'>( e) e b' |
  <e,=' c'>16( a) a c <f, d'>( b) b d |
  <e,=' c'>16( a) a c <d, b'>( gis) <d gis> b' |
  <c,=' a'>16-. b'-. <e, c'>-. a-. <d, gis b>8 <e=' d'> |

  \duo { a'='16( e) e( a) b( e,) e( b') | c( a) a( c) d( b) b( d='') | }
  { c'='4( d | e f=') | }
  <e=' c'>16( e') e( <c a'>) <c a'>( gis') <b, d gis>-. b'-. |
  <c,='' e a>8-. <b d gis>-. <c e a> a'32( g fis g='') |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
