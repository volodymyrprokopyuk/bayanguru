{{ define "lh1" }}
  r2 <d= c'>2( <g= b>) |
{{ end }}

{{ define "lh2" }}
  r2 \duo { c'='4 b~ \l b=2 | } { dis=2( \l e=) | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key e \minor
  \compoundMeter #'((4 4) (2 4))
  b=4(\p g' fis8 a g fis \l e2) | b4( g' a8 g fis d \l g2) |
  b='4( b c8 b a c \l b4 g) | a( g fis fis8 g \l e2) |
  b'='4( b c8 b e d \l c[ b a g]) | a4( g fis fis8 g) \l e='2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  r2 \duo { b=2~ \l b= | } { dis=2(-\frBass \l e=) | }
  \rep 2 { {{ template "lh1" }} } {{ template "lh2" }}
  {{ template "lh1" }} {{ template "lh2" }}
}
{{ end }}
