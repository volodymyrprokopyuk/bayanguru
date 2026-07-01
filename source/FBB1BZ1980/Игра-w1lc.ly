{{ define "rh1" }}
  {{ .a }} d e4) | e8( f \af 4\! g4) | a8( g a b=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key c \major
  \time 2/4
  {{ template "rh1" (w `c'='8(\mf\<`) }} | c=''4\> \af 4\! g=') |
  c,='8(\< d e4) | e8( f \af 4\! g4) | a8( b c d | \af 2\! g,='2)\> |
  {{ template "rh1" (w `c,='8(\<`) }} | c=''4 e='') |
  f=''8\(\f e d c | d\> c b a | g f e d | \af 2\! c='2\) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  c'='2-\frBass | c8( d e4) | f8( e f4 | e2) | c |
  c='8( d e4) | fis( d | g8 f e d) | c2 |
  c='8( d e4) | f8( e f4 | e8 c' b bes) |
  a='8( g f e | f e d c | b4 b | c='2) |
}
{{ end }}
