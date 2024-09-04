{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  a''=''8-.\mf\< a-. a16( g f \af 16\! e) | g8.(\> f16 e8 \af 8\! c) |
  a'=''8\< a16( b) c8 b16( \af 16\! a) |  g8.(\> f16 e8 \af 8\! e) |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
