{{ define "rh1" }}
  a='8 g f e | {{ .a }} f e d | c\) c g'\( c | a g f e |
  {{ .a }} f e d | c='4\) %
{{ end }}

{{ define "lh1" }}
  {{ .a }} fM! d' f@M | g,8 gM! g=, gM |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  \partial 4 { g'='8\(\p c | }
  {{ template "rh1" (w `d='8`) }} g'8\( c |
  {{ template "rh1" (w `g='8`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \partial 4 { r4 | }
  {{ template "lh1" (w `f,=,8-\stBass`) }} c cM! e c@M |
  \rep 2 { {{ template "lh1" (w `f,=,8`) }} c cM! e c@M | }
  {{ template "lh1" (w `f,=,8`) }} c+cM!4 %
}
{{ end }}
