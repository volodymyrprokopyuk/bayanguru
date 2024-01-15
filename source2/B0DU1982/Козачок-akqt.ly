{{ define "rh1" }}
  {{ .a }} g'8( f) | e-. c-. c=''4 |
{{ end }}

{{ define "rh2" }}
  a='8 a d( c) | b-. g-. {{ .a }} |
{{ end }}

{{ define "lh1" }}
  {{ .a }} gM! b g@M | c8 cM! e= c@M |
{{ end }}

{{ define "lh2" }}
  d=8 dM! fis d@M | g,=,8 gM! {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Con moto"
  \clef treble
  \key c \major
  \time 2/4
  \repeat volta 2 {
    {{ template "rh1" (w `g'='4\mf`) }}
    {{ template "rh1" (w `g='4`) }}
    {{ template "rh2" (w `g='4`) }}
    {{ template "rh2" (w `g='8 r`) }}
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  {{ template "lh1" (w `g,=,8-\stBass`) }}
  {{ template "lh1" (w `g,=,8`) }}
  {{ template "lh2" (w `b=,8 g@M`) }}
  {{ template "lh2" (w `g+gM r`) }}
}
{{ end }}
