{{ define "rh1" }}
  {{ .a }} d ees d | ees f g4\) | aes8( g f=''4) |
{{ end }}

{{ define "rh2" }}
  {{ .a }} c,8\) c | c( d ees4) | f8( ees d=''4) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} eesM! | ees eesM | bes bes7! | ees= eesM! |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key ees \major
  \time 2/4
  \repeat volta 2 {
    {{ template "rh1" (w `ees''=''8\(\mf`) }} | g8( f ees4) |
    {{ template "rh1" (w `ees=''8\(\f`) }} | ees=''2 |
  }

  \repeat volta 2 {
    {{ template "rh2" (w `c'='''4\(\p`) }} | ees8( d c4) |
    {{ template "rh2" (w `c'='''4\(`) }} | c=''2 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key ees \major
  {{ template "lh1" (w `ees=4-\stBass`) }}
  {{ template "lh1" (w `ees=4`) }}

  \rep 2 { c=4 cm! | c cm | g g7! | c= cm! | }
}
{{ end }}
