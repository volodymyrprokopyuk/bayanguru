{{ define "rh1" }}
  {{ .a }} f e f | e a g f | e\< f g a | b c d \af 8\! e=''\) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} d c d | c f e d | c d e f | g a b \af 8\! c=''\) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key c \major
  \time 2/4
  {{ template "rh1" (w `e'='8\(\mf`) }}
  f=''8\( e d e | d c d c | b\> a b a | g a g \af 8\! f\) |
  {{ template "rh1" (w `e='8\(\mf`) }}
  f=''8\(\> e d e | d c b \af 8\! a | g fis <f a>4\f | <e=' c'>2\) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  {{ template "lh1" (w `c'='8\(-\frBass`) }}
  d=''8\( c b c | b a b a | g f g f | e f e d\) |
  {{ template "lh1" (w `c='8\(`) }}
  d=''8\( c b c | b a g f | e dis d des | c='2\) |
}
{{ end }}
