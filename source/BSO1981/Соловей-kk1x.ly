{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key d \minor
  \time 2/4
  <d'=' f a d>4\sf \duo { <d''='' e>8\p <e='' a> | } { a'='8 <g=' cis> | }
  <f=' d' a'>4 \arpeggio r4 | f'4 e | d f8( e) |
  a,='8( b32[ a gis a]) <gis b>8 <g cis> |
  <f=' d'>8 <a f'>[( <g cis>-> <f d'>] | c'4) d8(-> c) | a4 d8( c) |
  g='8( a16 bes a8 g | f) <c' a'>[( <bes e> <a f'>]) |
  a='4( bes8 cis | d4) e8(\< \af 8\! f | g, f' e d | c4) r4 |
  \trio { b'='8( c16 d c8 b | <c,=' e a>4.) } %
  { f'='4 gis=' | s4. } { d'='2 | s4. } a='8 |
  \duo { a'='8^\tSos b32[( b gis a b8 cis='']) | } { g'='2 | }
  <f=' d'>2 \fermata |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
}
{{ end }}
