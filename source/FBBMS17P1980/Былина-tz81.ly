{{ define "rh1" }}
  {{ .a }} bes' | \time 3/4 aes8 g f ees bes'4) |
  {{ .b }} c bes aes g f | \time 2/4 bes4--\> \af 4\! ees,=') |
{{ end }}

{{ define "rh2" }}
  {{ .a }} |
  \duo { \time 3/4 d''=''4( f ees) | b \rest a( b | \time 2/4 c=''2) | }
  { c''=''2. | s4 g2~ | g=' | }
{{ end }}

{{ define "lh1" }}
  {{ .a }} | 2. | f'4( <bes d>2) | <f aes>4(-- <g= bes>) |
{{ end }}

{{ define "lh2" }}
  f=8 g aes f g4) | f8( f f ees d g= |
{{ end }}

{{ define "lh3" }}
  <ees,=, bes'>2 \clef treble | ees''='4( bes' aes8 g | f4 bes,=2) \clef bass |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Grave
  \clef treble
  \key ees \major
  \time 2/4
  {{ template "rh1" (w `ees'='4(\f` `aes='8(`) }}
  {{ template "rh1" (w `ees='4(\mp` `ees=''8(`) }}
  {{ template "rh2" (w `R2\mf`) }} {{ template "rh2" (w `R2`) }}
  ees'=''4(\f bes' | \time 3/4 aes8 g f ees bes'4) |
  aes=''8( bes16 c bes8 aes g f | \time 2/4 bes4--\> \af 4\! ees,) |
  ees'='''4( bes | \time 3/4 aes8 g f ees bes'4) |
  aes=''8(\>^\tRit bes16 c bes8 aes g \af 8\! bes |
  ees='''2.)\p \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key ees \major
  {{ template "lh1" (w `<ees,=, bes'>2~_\frBass`) }}
  {{ template "lh1" (w `<ees,=, bes'>2~`) }}
  c,=4(-- g' | {{ template "lh2" }} | ees4 c) |
  c'='4(-- g | {{ template "lh2" }} c,2) |
  {{ template "lh3" }} | <f= aes>4(-- <g bes>) |
  {{ template "lh3" }} | <ees,= g>2. \fermata |
}
{{ end }}
