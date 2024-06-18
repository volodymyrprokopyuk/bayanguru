{{ define "rh1" }}
  {{ .a }} a b \af 8\! c | b\> a \af 4\! g='4) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \major
  \time 2/4
  \meter 1/2 #'(1)
  {{ template "rh1" (w `g'='8(\mp\<`) }}
  {{ template "rh1" (w `g='8(\<`) }}
  \repeat volta 2 {
    d'=''8(\mf\< d c b | a g \af 4\! d4) | a'8(\> c b a | g4 \af 4\! g=') |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \major
  \meter 1/2 #'(1)
  R2 | R2 | g'='8(-\frBass fis g e | d4 g) | e2( | ees4 d) | fis2( g4 g,=) |
}
{{ end }}
