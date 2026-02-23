{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key c \major
  \time 2/4
  \meter 1/2 #'(1)
  e''=''4(\p e | f e8 d) | c4( a | d f) | e( e | g8 f e d) |
  c=''4(\< a | a8 b c \af 8\! d) | e4(\mf g | f e8 d) |
  c=''8( b a4 | d f) | e(_\dDim g | g8 f e d | a4) a |
  a='2( | e'\>^\tRit | \af 8.\! a=''4) r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  \meter 1/2 #'(1)
  R2 | R2 | e'='4(-\frBass e | f e8 d) | c4( a | d f) |
  e='4( e | g8 f e d) | c4( a  | a8 b c d) | e4( g | f e8 c) |
  c='8( b a4 | d f) | e\( g | g8 f e d | c4 a | a=\) r |
}
{{ end }}
