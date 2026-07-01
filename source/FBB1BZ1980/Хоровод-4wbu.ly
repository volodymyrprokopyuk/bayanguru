{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \major
  \time 2/4
  g'='8\mp\< g g4 | b \af 4\! g | a b8 a | \af 2\! g2\> |
  b='8\mf b b4 | d b | c d8 c | b4 d | c\f b8 a | g4 <d' g> |
  <c='' fis>8 <c e> <b d> <a c> | <g b>2 | <a c>4\p <c e> |
  <b=' d>4 <g c>8 <b g> | <fis c'>^\tRit <fis d'> <fis b> <fis a> |
  \af 2\! g='2\> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \major
  \rep 4 { R2 | } | g'='8-\frBass g g4 | b g | a b8 a | g2 | fis |
  g='4 b | a d, | g8 fis e4 | a fis | g e | d d8 c | b=2 |
}
{{ end }}
