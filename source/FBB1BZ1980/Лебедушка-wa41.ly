{{ define "rightHand" }}
\relative {
  \tempo "Andante cantabile"
  \clef treble
  \key a \minor
  \time 2/4
  \meter 1/2 #'(1)
  c''=''4(\mp c8 d | e f e4 | a,2) | c4( c8 d | e f e d |
  a='4) c8(\mf e | d c b a | e4 fis8 gis | a4) c8(\p e |
  d=''8 c b a | e4^\tRit gis | \af 2\! a='2)\> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  \meter 1/2 #'(1)
  a=4(-\frBass a8 b | c d c4 | a2) | a4( a8 b | c d c b |
  a=4) e'( | f f | e4. d8 | c4) a( | f' f | e2 | a,=) |
}
{{ end }}
