{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key a \major
  \time 2/4
  \partial 8 { e''=''8\mf | }
  a=''16( gis fis e d cis b a) | a4( gis8) \noBeam e' |
  b'=''16( a gis fis e d cis b) | bis4( cis8) \noBeam cis |
  d=''16( fis e d cis e d cis | b d cis b a cis b a) |
  gis='16( b a gis fis a gis fis | e\< fis gis a b cis d \af 16\! e='') |

  <a,=' cis>8 r <cis a'>4 | <d a'>16( gis fis e d cis b a |
  gis='8) r <d' b'>4 | a'16( gis fis e d cis b a) |
  <d='' fis>4. 8 | <d fis>( <cis e>)-. <b d>-. <a cis>-. |
  b='16( ais b cis d e fis gis | a=''8) r r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \major
  \partial 8 { r8 | }
  a+aM!8-\stBass r r4 | r8 b+e@7![ b+e78] r |
  gis+e@7!8 r8 r4 | r8 a+aM![ a+aM] r |
  fis+d@M!8 r8 e+em! r | d+b@m! r8 cis+a@M! r8 |
  b+e@M!8 r8 b+b7!4 | e+eM!8 r r4 |

  a,=,16(-\puBass b cis d e fis gis, a | b8) r r4 |
  b=,16( cis d e fis gis, a b | cis8) r r4 |
  d=16( e fis gis, a b cis d | e8) r r4 |
  e=8 r e+e7!4 | a+aM!8 r r %
}
{{ end }}
