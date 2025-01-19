{{ define "rightHand" }}
\relative {
  \tempo Mederato
  \clef treble
  \key g \major
  \time 2/4
  e'='8\(\p\< g g g | a4 \af 4\! g | fis8\> e fis4 | \af 2\! e2\) |
  g='8\(\mp\< b b b | c4 \af 4\! b | a8\> g a4 | \af 2\! g2\) |
  b='8(\mf\< d d \af 8\! d | e4\> \af 4\! d) |
  g,='8(\mp\< b b \af 8\! b | c4\> \af 4\! b) | a8 g fis4 |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
}
{{ end }}
