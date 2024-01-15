{{ define "rh1" }}
  {{ .a }} c c e | g g g e | d d g f | e2 c='' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} cM! cM cM | c cM cM cM |
  g=,4 g7! g7 g7 | c= cM! cM cM |
{{ end }}

{{ define "lh2" }}
  {{ .a }} eM! eM eM | a, am! am am |
  e'=4 e7! e7 e7 | a,=, am! {{ .b }}
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 4/4
  {{ template "rh1" (w `c''=''4\f`) }}
  {{ template "rh1" (w `c=''4`) }}
  e=''4\(\mp d c b | a b c d\) |
  e=''4\( d c b | a2 a'\) |
  e=''4\( d c b | a b c2\) |
  e=''4\( d c b | a2\) a=' \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `c=4-\stBass`) }}
  {{ template "lh1" (w `c=4`) }}
  {{ template "lh2" (w `e=4` `am am`) }}
  {{ template "lh2" (w `e'=4` `am2`) }}
}
{{ end }}
