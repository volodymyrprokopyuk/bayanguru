{{ define "rh1" }}
  {{ .a }} bes' | \time 3/4 aes8 g f ees bes'4) |
  {{ .b }} c bes aes g f | \time 2/4 bes4--\> \af 4\! ees,=') |
{{ end }}

{{ define "rh2" }}
  \duo { {{ .a }} | \time 3/4 d''=''4( f ees) | r a,( b | \time 2/4 c=''2) | }
  { s2 | c''=''2. | s4 g2~ | g=' | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Grave
  \clef treble
  \key ees \major
  \time 2/4
  {{ template "rh1" (w `ees'='4(\f` `aes='8(`) }}
  {{ template "rh1" (w `ees='4(\mp` `c=''8(`) }}

  {{ template "rh2" (w `R2\mf`) }}
  {{ template "rh2" (w `R2`) }}
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key ees \major
}
{{ end }}
