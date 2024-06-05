{{ define "rh1" }}
  {{ .a }} d b d a d g, d' | fis, d' e, d' {{ .b }} |
{{ end }}

{{ define "rh2" }}
  {{ .a }} <b e>-. <a e'>-. <d e>-. | <cis e>-. <d e>-. <cis e>-. {{ .b }} |
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
  \clef bass
  \key d \major
}
{{ end }}
