{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 4/4
  \repeat volta 2 {
    c'='2(\f d | c4 d e2) | c2( d | e4 f g2) |
    g='2( a | g4 f e2) | e2(\> f | e4 d \af 2\! c='2)\p |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  R1 | R1 | c'='2(-\frBass d | c4 d e2) | e2( f | e4 d c2) | c( d | g, c=') |
}
{{ end }}
