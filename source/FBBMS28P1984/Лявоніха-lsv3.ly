{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  g'='8\f b_\aNLeg d8. c16 | b8 b a4 | b8 g c4 | c8 d e8. c16 |
  b='8 b a4 | g8\> g \af 4\! g='4 |
  \duo {
    g''=''8\mf g d8. c16 | b8 b a4 | b8 g c4 | c8 d e8. c16 | b8 b a='4 |
  } { b'='4 a | g d | f e | g g | g fis=' | }

  g='8\> g g16( d e \af 16\! fis) | g(\mp\< a b c d8. \af 16\! c16) |
  b='16( a g8) a16( g fis8) | b16( g a b c4) | c16(_\dCre b c d e8. c16) |
  b='16( a g8) a16( g fis8) | g16( d g b g='4) |

  \duo {
    g'='8(\f b d8. c16 | b8 g a g | b g c4) | c8( d e4) | d8( g) c,( d='') |
  } { d'='4 f | e ees | d c | g' c8.( a16) | b8( g) a( fis=') | }
  <g=' g'>8-. 8-. <g=' b g'>4-> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  <g= d'>2~-\frBass | 2~ | 2 | 2~ | 2~ | 2 |
  \rep 2 { r8 <g= d'>8[ r <fis= d'>] | }
  r8 <g= d'>8[ r <g c>] | r <e c'>[ r8 8] |
  r <d= d'>8[ r <d c'>] | r8 <g b>[ r <g= c>] |

  \duo { r8 d'='8 r d | r d r c | r b r g= | } { g=4 fis | f ees | d c= | }
  a,=,8( b c e) | \duo { r8 g=8 r a= | } { d=4 d= | } g=8( d g,=,4) |

  b'=8( a g4) | a8( g fis4) | g8( f e d) | c( b a c) | d( b) d( a) |
  <g=, d'>8-. 8-. 4-> |
}
{{ end }}
