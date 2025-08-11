{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  b'='8(\p d d d | c4 b8 g) | b( d \tuplet 3/2 { c=''8 b a=' } |
  g='4 d) | g( a | b c) | b8( g a4 | \af 2\! g2)\> |
  d'=''8(\mf c b a | g4 d) | g8( g a4 | b c) | d8( c b a | g4 c) |
  b='8( g a4 | \af 2\! g='2)\> |

  \duo {
    b'='8(\mp d d d | c4 b8 g) | b( d \tuplet 3/2 { c=''8 b a=' } |
    g='4 d) | g(\< a | b8 g \af 4\! c4) | b8(\> g a4 | \af 2\! g2) |
    d'=''8(\f c b_\dDim a | g4 d) | g8(\< g a4 | b \af 4\! c) |
    d=''8( c b a | g4 c) | b8(-- g^\tRit a4-- |
    \af 2\! g='2)--\> \fermata \bar "|."
  } {
    g'='4 fis | e d | dis e | b b | e8 b fis'4 | f e | e d8 c | b2 |
    e='4 d | b c8 c | d4 e | fis f | e ees | d ees | cis-- c-- | b=2-- |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  <g= d'>2-\frBass | \rep 3 { <g= d'>2 | }
  \duo { d'='2 | d4( e) | d='2 | } { g=4( fis) | g2 | g4( fis=) | }
  <g= d'>2 | b8( d d c | b4 a8 fis) | b( d \tuplet 3/2 { c='8 b a= } |
  g=4 d) | g( a | b e) | d( c | b8[) a,( b c]) | \rep 4 { <g=, d'>2 | }

  \duo {
    b=2 | g~ | g4 fis( | e d) | g( fis) | e( fis) | g2 | a4( gis) |
    a=4( g8 fis | e fis g4) | g(-- fis-- | d=2)-- |
  } {
    e=4( dis) | d( c | cis) d( | s4 g,) | a( d) | g,( a) | b( cis) |
    d=2 | c | b4 bes | a(-- d-- | g,=,2)-- \fermata |
  }
}
{{ end }}
