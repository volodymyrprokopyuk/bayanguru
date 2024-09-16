{{ define "rightHand" }}
\relative {
  \tempo "Andante cantabile"
  \clef treble
  \key e \minor
  \time 4/4
  \meter 1/4 1,1,1,1
  g'='4(\p e b' g8 e | a g fis a e4 e) |
  \duo {
    g'='4(\< \af 4\! e b' e8 b | a fis a d \af 2\! b2)\> |
    e,='4(_\dCre fis g8 a b c | d4 c8 d b4 g'='') |
  } { s1 | s2 g'='8( a g fis) | c2( b8 c d e | fis d e fis g4 b=') | }
  <a=' fis'>8(\mf <c e> <b d> <a c> b4 g8 b |
  a='4\>^\tRit <g b>8 <fis a> \af 2\! <e=' e'>2)\p \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  \meter 1/4 1,1,1,1
  \duo { b=2(-\frBass d | c b8 c b a) | b2( d | c b=) | }
  { \rep 2 { e=1~ | e= | } } |
  a=2 g | d g | a8( c e fis g fis e d | c e b4 e,=2) |
}
{{ end }}
