{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key c \major
  \time 2/4
  e'='4\mp f | g c | a c | g2 | c4 d | e c | d b | c2 |
  e=''4 d | c e | b d | a2 | c4 d | e c | d b | c=''2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  R2 | R2 | f'='2-\frBass | e | R2 | g f e | R2 | a | e | f |
  R2 | g='2 | f4 d | c='2 |
}
{{ end }}
