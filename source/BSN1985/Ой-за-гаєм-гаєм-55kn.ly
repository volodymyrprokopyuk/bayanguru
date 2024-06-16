{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  c'='8[(\mf\< d e f] | g4 \af 4\! c) | a8(\> a c a | g4 \af 4\! e) |
  \repeat volta 2 {
    f='8\< f a f | e e g \af 8\! e | d[\> f e d] | c4 \af 4\! c=' |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  \meter 1/2 #'(1)
  c'='8-\frBass g c_\aSta g | c g c bes | a f a f | e g c cis |
  d='2( | c) | b( | c=') |
}
{{ end }}
