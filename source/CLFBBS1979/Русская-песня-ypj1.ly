{{ define "rightHand" }}
\relative {
  \tempo Alegretto
  \clef treble
  \key a \minor
  \time 4/4
  a'='2\(\mp e' | d4_\aDol e8 d a4 b | c a  g a | e1\) |
  f='1\(\< | e2 a4 \af 4\! e | f2 c'4 b | e,1\) |
  a='2\(\p e' | d4 e8 d a4 b | c a  g a | e1\) |
  f='2\( c'4 b | e,2 b'4 a | d, e8 f e4 gis | a='1\) \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  \rep 3 { R1 | } | r4 d'='4\(-\frBass c b | d2 a4 b | c1 | d | e='\) |
  \rep 3 { R1 | } | r4 d='4\( c b | d1 | c | b2 c4 b | a=1\) \fermata |
}
{{ end }}
