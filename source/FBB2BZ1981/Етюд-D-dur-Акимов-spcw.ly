{{ define "rh1" }}
  {{ .a }} d b d a d g, d' | \stemDown fis, d' e, d' \stemNeutral {{ .b }} |
{{ end }}

{{ define "rh2" }}
  {{ .a }} <b e>-. <a e'>-. <d e>-. | <cis e>-. <d e>-. <cis e>-. {{ .b }} |
{{ end }}

{{ define "lh1" }}
  {{ .a }} <d g>-. <d fis>-. <d e>-. | d-. <a cis>-. {{ .b }} |
{{ end }}

{{ define "lh2" }}
  cis='16( e d e cis e b e | a, e' gis, e'=' %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key d \major
  \time 2/4
  {{ template "rh1" (w `a'='16(\mp` `d, e fis g=')`) }}
  {{ template "rh1" (w `a='16(` `d, e fis g=')`) }}
  {{ template "rh2" (w `<a=' e'>8-.\mf` `<b=' e>-.`) }}
  {{ template "rh2" (w `<a=' e'>8-.` `r8`) }}
  {{ template "rh1" (w `a='16(\mp` `d, e fis g=')`) }}
  {{ template "rh1" (w `a='16(` `d,='4)--`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key d \major
  {{ template "lh1" (w `<d'=' fis>8-.-\frBass` `d='-. r`) }}
  {{ template "lh1" (w `<d=' fis>8-.` `d='-. r`) }}
  {{ template "lh2" }} a,=16 b cis d) | {{ template "lh2" }} a, g' fis e) |
  {{ template "lh1" (w `<d=' fis>8-.` `d='-. r`) }}
  {{ template "lh1" (w `<d=' fis>8-.` `d='4--`) }}
}
{{ end }}
