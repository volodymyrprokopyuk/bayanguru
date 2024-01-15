{{ define "rh1" }}
  {{ .a }} d bes bes | c( f,) bes='4-> |
{{ end }}

{{ define "rh2" }}
  ees=''8 ees ees ees | d( bes) bes r |
  c=''8 c g( a) | bes d {{ .a }} |
{{ end }}

{{ define "lh1" }}
  {{ .a }} cm! f, f7! | bes besM! f=, bes@M |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key bes \major
  \time 2/4
  {{ template "rh1" (w `d''=''8\mf`) }}
  {{ template "rh1" (w `d=''8`) }}
  {{ template "rh2" (w `bes='8 r`) }}
  {{ template "rh2" (w `bes='4->`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key bes \major
  bes,=,8-\stBass besM! f bes@M | f8 f7! bes besM! |
  bes=,8 besM! f bes@M | a8 f@7! bes8 besM! |
  {{ template "lh1" (w `c=8`) }}
  c'=8 cM! f, f7! | bes besM! f bes@M |
  {{ template "lh1" (w `c'=8`) }}
  c'=8 cm! f, f7! | bes=, besM! bes+besM4-> |
}
{{ end }}
