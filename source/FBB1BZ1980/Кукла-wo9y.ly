{{ define "rightHand" }}
\relative {
  \tempo Sostenuto
  \clef treble
  \key d \minor
  \time 3/4
  \repeat volta 2 {
    d''=''4(_\markup \dAlt mf p a a | g a2) | d4( a a | g a2) |
    f='4( f e | f g a) | f2( e4 | d='2.) |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key d \minor
  <d'='~ f>2.^(-\frBass | <d e>) | <d~ f>^( | <d e>) | c( | b) | bes( | a=) |
}
{{ end }}
