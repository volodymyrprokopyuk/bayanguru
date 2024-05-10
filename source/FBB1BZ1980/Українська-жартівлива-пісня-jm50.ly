{{ define "rh1" }}
  {{ .a }} c e g | c4) g8( a | g f e=''4) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key c \major
  \time 2/4
  {{ template "rh1" (w `c''=''8(\f`) }}
  {{ template "rh1" (w `c=''8(\mf`) }}
  g=''8(\f g f e | d4) d8( f | e d c4)
  g'=''8(\mf g f e | d4) d8(\<^\tRit f | e d \af 4\! c=''4\f) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  c'='2-\frBass | e | g | c4 g | e2 | d4 c |
  e='4 c | a f | g c | e c | f a, | b c=' |
}
{{ end }}
