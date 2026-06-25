{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 4/4
  e'='1(\mp\< | \af 1\! f) | g4(\< a b \af 4\! d | d\>  e c \af 4\! b) |
  c=''2( b4 a) | g2.( f4) | e( f e d | a'='1) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  c'='2(-\frBass b4 a) | c2( b4 a) | b( c d e | f g e d) |
  e='2( d4 c) | b2( c4 d) | c( d c b | a=1) |
}
{{ end }}
