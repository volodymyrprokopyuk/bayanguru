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
  \duo { a'='8^\tSos b32[( b gis a] b8 cis='') | } { g'='2 | }
  <f=' d'>2 \fermata |

  \tempo "Allegro vivace"
  e'=''4\f f8 e | d4 a | e'8( f16 g f8 e | d4) r |
  d=''4\> c8 \af 8\! bes | a4\> c8 \af 8\! bes |
  a='8( bes32[ a gis a] f'8 e | d4) r |
  e=''4( \acc { g=''8 } f8 e | d4 a4) |
  e'=''4( \acc { g=''8 } f8 e | d4) r |
  d=''8( e16 d cis8 d) | f4 e8( d) | a4( a'8) \fermata cis,='' |
  \acc { d,='32 f a } d=''4->\ff \acc { f,='32 a d } f4-> |
  \acc { a,='32 d f } a=''4.-> gis16( bes) | \rep 2 { a=''8-> gis16( bes='') } |
  a=''8 d4-> a8 | a16( bes) g4-> g8 | g16( a) f4-> f8 |
  f=''16(-> g) e8 e16(-> f) d8 | d4 \acc { cis'='''8 } d='''8 r \fermata |

  \tempo Andante
  f,=''8( a)-> e( a)-. | d,( e32[ d cis d] f8 e) |
  a,='8( a') b,( cis | d) <a f'>[( <g cis> <f d'>]) |
  c'=''8( d32[ c b c]) d'8-.->^\aTen \hSpace c-.^\aTen |
  a,='8( bes32[ a gis a]) bes'8-.->^\aTen \hSpace a-.^\aTen |
  g,='8( a16 bes) a8( g | f) <c' a'>[( <bes e>\sf <a f'>]) |
  a='4(\p b8 cis) | d( e32[ d cis d]) e8 f |
  g,='16( a' g fis f e) \acc { g=''8 } f16( d | c4) r |
  \trio { <f'=' b>8 c'16 d c8 b=' | } { d'='2 | } { s4 cis'=' | }
  <c,=' e a>8 r a'' r | \acc { bes=''8 } a8-.^\tSos a-. a-. a-. |
  \acc { bes=''8 } a4. \trill gis16.^\aTen \hSpace a32 | d8 d,='' r4 \fermata |

  e=''4( \acc { g=''8 } f8 e | d4 a) |
  e'=''8( f32[ e dis e] \acc { g=''8 } f8 e | d4) r |
  d=''4( c8 bes | a4) c8 bes | a( bes32[ a gis a] f'8 e | d4) r |
  e=''4( \acc { g=''8 } f8 e) | d( bes' a) r |
  e=''4( \acc { g=''8 } f8 e) | d( d' a) r |
  d,=''8( e16 d cis8 d) | c'8.( bes16) g(^\tRit e d bes |
  a='4) \acc { bes'=''8 } \afterGrace 3/16 a4 \trill { gis=''16 a='' } |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
}
{{ end }}
