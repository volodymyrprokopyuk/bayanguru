{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key d \major
  \time 3/4
  \meter 1/4 1,1,1
  \partial 4 { <d'=' fis>8\mf <e g> | }
  <fis=' a>4. <a cis>8 8 <g b> |
  \duo { b'='16( cis b='4) } { g'='4. } <fis a>8 8 <e g> |
  \duo { g'='16( a g4) <g b>8 8 <fis a> | a16( b a4) b8 \rest d, e=' | }
  { e'='4. e8 cis cis | <d fis>4. s8 b cis=' | }
  \repeat volta 2 {
    <d=' fis>4. <fis a>8 <g b> <fis a> |
    <fis=' a>8( <e g>4) <fis a>8 <g b> <fis a> |
    <fis=' a>8( <e g>4) <e g b>8 <cis g' b> <cis fis a> |
    \alternative {
      \volta 1 { d='4. r8 <b d> <cis=' e> | }
      \volta 1 { d='4. r8 \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  \meter 1/4 1,1,1
  \partial 4 { r4 | }
  d=8-\stBass dM! a d@M g8 gM! | e' em! g, e@m b8 e@m |
  cis=8 a@7! a8 a7 cis a@7 | d8 dM! a d@M g4 |
  b=,8 bm! a b@7! b8 b7 | e em! b e@m g8 e@m |
  d'=8 e@m! cis8 a@7! a8 a7 | d dM! a d@M g4 | d'=8 dM!4 r8 %
}
{{ end }}
