{{ define "rightHand" }}
\relative {
  \tempo "Tempo di marcia"
  \clef treble
  \key a \minor
  \time 4/4
  a'='4.\mf b8_\aNLeg c4 a | b gis e e | a4. b8 c b a4 | b4. gis8 e2 |
  <c'='' e>4 4 4 4 | <d f>8 <c e> <b d> <a c> <g b>4 <e e'> |
  <c'='' e>4. <b d>8 <a c>4 <gis b> | a2 a4 r |
  <g=' c e>4 4 4 4 | <d' f>8 <c e> <b d> <a c> <g b>4 g |
  <g=' c e>4. <f b d>8 <e a c>4 <d gis b> | <c=' a'>2 4 r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  R1 | r2 e'='4-\frBass d | c e a2 | e2. d4 |
  c='4 4 4 4 | g'2. e4 | c4 d e=' \clef bass e,= | a2 g8 f e d |
  c=4 4 4 4 | d8 e f fis g4 f | c d e e, | a=,2. r4 |
}
{{ end }}
