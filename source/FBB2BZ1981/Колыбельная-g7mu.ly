{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key e \minor
  \time 4/4
  b'='4(\mp\< c_\aDol d \af 4\! b | e2\> b4 \af 4\! b) |
  e=''4(\> \af 8.\! c) e(\> \af 4\! b) | d2.\p r4 |
  g=''4(\mf\< fis e \af 4\! b | c2 e4\> \af 4\! e) |
  b='4(\> \af 8.\! c) b(\>^\tRit \af 4\! a) | <g=' e'>1\pp \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  R1 | <e'=' g>2.-\frBass r4 | <e g>2. r4 | <b g'>2. r4 |
  R1 | <a= e'>2. r4 \clef bass | b=2. fis4 | <e= b'>1 |
}
{{ end }}
