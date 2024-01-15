{{ define "rh1" }}
  g'=''8-. c,-. g'-. c,-. | a'4( g) |
  c,=''8-. f-. e-. g-. | f=''2 |
{{ end }}

{{ define "lh1" }}
  e=8 c@M! c8 cM | f, fM! g gm! | c f@M! c=8 {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Con moto"
  \clef treble
  \key f \major
  \time 2/4
  a'='8-.\mp bes-. c-. f-. | c4( a) |
  a='8-. bes-. c-. f-. | c2 |
  {{ template "rh1" }}
  f=''8-. d-. bes-. d-. | c4( f,) |
  f'=''8-. d-. bes-. d-. | c2 |
  {{ template "rh1" }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  f=8[-\stBass fM! fM fM] | f@M![ fM8 fM fM] |
  f=8[ fM! fM fM] | f@M![ fM8 fM fM] |
  {{ template "lh1" (w `cM!`) }} | f[ fM! fM fM] |
  \rep 2 {
    bes@M![ besM8 besM besM] | f@M![ fM8 fM fM] |
  }
  {{ template "lh1" (w `c7!`) }} | f,=,4 fM! |
}
{{ end }}
