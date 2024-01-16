{{ define "rh1" }}
  {{ .a }} b' b16( a g8) | g-. b-. <b=' d>4-> |
{{ end }}

{{ define "rh2" }}
  {{ .a }} <g b d>16-. 8-. 8-. | <g b e>8-. 8-. <fis=' b d>4 |
{{ end }}

{{ define "rh3" }}
  {{ .a }} b'16( a8) g | r8 <fis a>[ r <fis b>] |
  <e=' c'>8. b'16( a8) g=' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} b-. c-. e-. | fis-> d-. b-> d-. |
  a=,8-. b-. c-. e=-. |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key g \major
  \time 2/4
  {{ template "rh1" (w `d'='8\mf`) }}
  {{ template "rh1" (w `d,='8`) }}
  {{ template "rh2" (w `<g=' b g'>8.->\f`) }}
  {{ template "rh2" (w `<g=' b g'>8.->`) }}

  {{ template "rh3" (w `<e=' c'>8.\mf`) }} | r8 <d a'> <d b'>4 |
  {{ template "rh3" (w `<e=' c'>8.\f`) }} | r8 <d fis a> <b= d g>4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g,=,8-\stBass gM! g gM | g gM g gM |
  g=,8 gM! g gM | g gM g gM |
  \rep 2 { g=,8.[-> gM!16 gM8 gM] | e-. g-. b=,4-. | }

  {{ template "lh1" (w `a=,8-.-\puBass`) }} | fis( d@M!) g,8( gM!) |
  {{ template "lh1" (w `a=,8-.`) }} | d= dM! g+gM!4 |
}
{{ end }}
