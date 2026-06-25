{{ define "rh1" }}
  {{ .a }} bes | d bes | d bes | g='2 |
{{ end }}

{{ define "rh2" }}
  {{ .a }} bes | g bes | g bes | g='2 |
{{ end }}

{{ define "lh1" }}
  {{ .a }} fis | f e | ees d | c bes= |
{{ end }}

{{ define "lh2" }}
  {{ .a }} bes | a g= \clef bass | f= ees= |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key g \minor
  \time 2/4
  {{ template "rh1" (w `d''=''4\mf`) }}
  {{ template "rh1" (w `d'=''4_\dCre`) }}
  {{ template "rh2" (w `g='4\f`) }}
  {{ template "rh2" (w `g='4_\dDim`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \minor
  {{ template "lh1" (w `g'='4-\frBass`) }}
  {{ template "lh1" (w `g'='4`) }}
  {{ template "lh2" (w `c='4`) }} | d=2 \clef treble |
  {{ template "lh2" (w `c'='4`) }} | <d= bes'>2 |
}
{{ end }}
