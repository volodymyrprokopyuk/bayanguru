{{ define "rh1" }}
  {{ .a }} d e f g a g c | a g f a g4 \af 4\! c=''') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key c \major
  \time 4/4
  {{ template "rh1" (w `c''=''8(\p\<`) }}
  f,=''8(\mf\> g a f e f g e | g f e f e4 \af 4\! d) |
  {{ template "rh1" (w `c=''8(\p\<`) }}
  a=''4\mf\> f8( a g4) f8( e | d^\tRit e f d \af 2\! c=''2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=2-\frBass e | f e | d c | g' g, | c e | f e | f e | g, c= |
}
{{ end }}
