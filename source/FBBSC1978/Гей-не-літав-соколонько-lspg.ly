{{ define "rightHand" }}
\relative {
  \tempo Sostenuto
  \clef treble
  \key e \minor
  \time 2/4
  e'='8[(\mp b' b b] | a a g16 fis e8) | e( b' a16 g a8 | b4 b) |
  e,='8[(_\dCre b' b b] | a a g16 fis e8) | g( g fis16 e fis8 |
  e='4)_\dDim <g,= b e>-- |

  <g= b e>8[\f <g' b>8 8 8] |
  \duo { a'='4( g16 fis e='8) | } { e'='8 dis e b= | }
  <g,= b e>8 <g' b>8( a16 g <fis a>8) | \duo { b'='2 | } { g'='4( fis=') | }
  <g,= b e>8[\mf <g' b>8 8 8] | <fis a>8 8 <e g>16( fis <c e>8) |
  <e=' g>8_\dDim 8 fis16( e fis8) | <g, b e>4-- <g'=' b e>-- \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  \rep 4 { R2 | }
  \duo { e'='2~ | e=' \clef bass | r8 b=16( cis~ <ais cis>8) <a= c> | }
  { r4 d'='4 | cis8( c b16 a g=8) \clef bass | e=2 | } <e g b>4 <e,=, e'>-- |

  \clef treble e'=8[( e' cis d] | cis c b16 a g8) | e( e' <c d>8) 8 |
  \duo { d'='4( dis=') | } { b=2 | }
  e,=8[( e' cis d] | <c e>) <b dis> b16( a g=8) \clef bass |
  <g= c>8 <g b> <ais cis> <a c> | \duo { e=2 | } { r4 e,=,4 | }
}
{{ end }}
