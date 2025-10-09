{{ define "rh1" }}
  {{ .a }} c)-. g( c)-. | a( c)-. g2 | f4(\> g a \af 4\! f=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key f \major
  \time 4/4
  {{ template "rh1" (w `a'='4(\mf`) }} | g='2\mp g |
  {{ template "rh1" (w `a='4(\mf`) }} | g='4(\mp^\tRit e f='2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key f \major
  f'='2(-\frBass e) | f( c) | d( c) | d( c) | f( e) |
  f='2( c) | d4( bes c2) | bes4 c f,=2 |
}
{{ end }}
