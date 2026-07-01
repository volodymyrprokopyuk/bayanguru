{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 3/4
  b'='4\(\mf\< d2 | a4 \af 2\! d2 | b4 c d | e g2\) |
  d=''2\( b4 | c2 a4 | b\> c d | \af 2.\! a2.\) |
  b='4\( d2 | a4 d2 | b4\< c d | e g \af 4\! e |
  d=''4 g b, | c e c | b2\> a4 | \af 2.\! g='2.\) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \major
  g'='2.\(-\frBass | fis | g2 b4 | c2.\) | b2\( g4 |
  a='2 d,4 | g2. | fis2 d4\) | g2.\( | fis | g2 b4 | c2.\) |
  b='2\( g4 | a2 fis4 | d4 e fis | g='2.\) |
}
{{ end }}
