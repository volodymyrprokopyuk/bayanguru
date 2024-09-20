{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 2/4
  a'='8(\mp e' e e | c b a4) | a8( e' e e | c b16 c a4) |
  a='8( c b c | b b a4) | a8( c a4) | e8( g a4) |
  a='8( e' e e | c b a4) | a16( b e8) 8 8 | c( b16 c a4) |
  a='8(^\tRit c b c | b b a a) |
  \duo { a'='8( c a g | e <d g> <c=' e a>4) \bar "|." } { f'='2 | s2 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  a'='2~ | a | g~ | g | fis( | f4~ f8 e16 d) |
  c='8( e g16 f e d) | e( d c b a4) |
  <a= g'>2~ | 2 | <g f'>~ | 2 | \duo { e'='4 dis=' | } { f=2 | } \clef bass |
  <e= d'>4 <ees des'> | <d c'>2 | r8 <a g' b> <a=, a'>4 |
}
{{ end }}
