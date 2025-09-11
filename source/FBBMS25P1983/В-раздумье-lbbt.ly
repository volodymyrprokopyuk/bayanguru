{{ define "lh1" }}
  r2 <d= c'>2( <g= b>) |
{{ end }}

{{ define "lh2" }}
  r2 \duo { c'='4 b~ | b=2 | } { dis=2( | e=) | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key e \minor
  \compoundMeter #'((4 4) (2 4))
  b=4(\p g' fis8 a g fis | e2) | b4( g' a8 g fis d | g2) |
  b='4( b c8 b a c | b4 g) | a( g fis fis8 g | e2) |
  b'='4( b c8 b e d | c b a g) | a4( g fis fis8 g) | e='2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  r2 \duo { b=2~ | b= | } { dis=2( | e=) | }
  \rep 2 { {{ template "lh1" }} } {{ template "lh2" }}
  {{ template "lh1" }} {{ template "lh2" }}
}
{{ end }}
