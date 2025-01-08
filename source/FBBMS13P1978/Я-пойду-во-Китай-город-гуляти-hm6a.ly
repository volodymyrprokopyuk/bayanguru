{{ define "rh1" }}
  {{ .a }} g16 aes bes8. aes16 | g8 bes f {{ .b }} | ees16( f g aes bes4) |
  g='8( ees'16 d c4) | bes8( \tuplet 3/2 { bes='16 aes g } aes8 aes |
  g='8 ees f {{ .b }} | ees( g bes16 aes g f | \af 2\! ees='2)\> |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key ees \major
  \time 2/4
  {{ template "rh1" (w `ees'='8(\mf` `bes,)`) }}
  \duo {
    {{ template "rh1" (w `ees'='8(\p` `d)`) }}
  } {

  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key ees \major
}
{{ end }}
