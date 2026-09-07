{{ define "rightHand" }}
\relative {
  \tempo Lento
  \clef treble
  \key a \minor
  \time 4/4
  \duo {
    e'='8(\pp a b d16 c b4 a) | e8( a b d16 c b4 a) |
    d=''8(\p d d c b4 a) | d8( d d c b4 a) |
    \rep 2 { e'=''8( a b d16 c b4 a='') | }
    \rep 2 { d='''8( d d c b4 a='') | }
    e,='8(\p a b d16 c b4 a) | e8(\> a b d16 c b4 \af 4\! a) |
    c'='''4.(\pp a8 e'='''2) \fermata \bar "|."
  } {  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
