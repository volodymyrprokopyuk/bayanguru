{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 4/4
  e''=''4(\p f8 e d4 e8 d | c2 d='') | e=''4( f8 e d4 e8 d | c2 d='') |
  e=''8( g f e d f e d | c2 d) | e8( g f e d f e d | c=''1) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \clef treble
  \key c \major
  c'='2(-\frBass g' | e g) | \rep 2 { c,='( g' | e g=') | } c,( g' | e c=') |
}
{{ end }}
