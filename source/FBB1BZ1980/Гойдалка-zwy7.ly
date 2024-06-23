{{ define "rightHand" }}
\relative {
  \tempo "Tempo di valse"
  \clef treble
  \key e \minor
  \time 3/4
  e'='4(\mf g b) | <fis b>2. | e4( g b) | <fis b>2. |
  e='4( g b) | a2. | b2.~ | b |
  e,='4( g b) | <e, a>2. | e4( g b) | <fis a>2. |
  g='2.( | fis) | e~ | e=' \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  e'='2.-\frBass | dis | e | dis | d | cis | dis( | b) |
  d='2. | cis | c | b | e2( b4 | dis2 b4) | e2.( | e,=) |
}
{{ end }}
