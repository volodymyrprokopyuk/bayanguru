{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 2/4
  e'='4\mp a | <e a c>4. a8 |
  b='8( d c b | a4 e) |
  <e=' a c>4 a | d8( c b a) |
  gis='8( a b gis | e4) e |
  <g=' c e>4\mf 4 | <c e g>4. <g c e>8 |
  <g=' b d>4 g'8( f | e4 d) |
  <a=' c>4. 8 | d8( c b a |
  <gis=' b e>2) | \af 4.\! <g=' b f'>2\<^\tRit |

  \repeat volta 2 {
    <g=' c e>4\f^\tATem 4 | <g c f> <g c e> |
    <g=' c e>8 <g b d>4 8 | 8 8 4 |
    <g=' b d>4 4 | <g b e>4 <g b d> |
    <e=' g d'>8 <e g c>4 8 | 8 8 4 |
    <e=' a c>4\mp 4 | <e a d>4 <e a c> |
    <f=' a c>8 <f a b>4 8 | 8 8 4 |
    <e=' gis b>4 <gis b f'> | <gis b e>4 <d e gis> |
    <c=' e b'>8 <c=' e a>4 8 | 8 8 4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  \meter 1/2 #'(1)
  a,=,8(-\stBass am!) am am | a( am) am am |
  e'=8( e7!) e7 e7 | a,( am!) am am |
  a=,8( am!) am am | d( dm!) dm dm |
  e=8( e7!) e7 e7 | e( e7) e7 e7 |
  c=8( cM!) cM cM | c( cM) cM cM |
  g=,8( gM!) gM gM | gis[( e@7!) e78 e7] |
  a=,8( am!) am am | d( dm!) dm dm |
  e=8( e7!) e7 e7 | g,=,( g7!) g7 g7 |

  \meter 1/4 1,1
  c=8 cM! c cM | c cM c cM |
  \rep 2 { g=,8 gM! g gM | g=, gM g gM | }
  c=8 cM! c cM | c cM c cM |
  a=,8 am! a am | a am a am |
  d=8 dm! d dm | d dm d dm |
  e=8 e7! e e7 | e e7 e e7 |
  a,=,8 am! a am | a am! a=,4 |
}
{{ end }}
