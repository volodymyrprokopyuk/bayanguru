{{ define "rh1" }}
  {{ .a }} d b d | c b a='2) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 4/4
  {{ template "rh1" (w `b'='4(\mf`) }} | a='4( b c2 | b d) |
  {{ template "rh1" (w `b='4(`) }} | a='4( c b a | g2 g=') \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \major
  g'='1(-\frBass | d) | e2( fis | g1) | e( | a2 fis) | d( e4 fis | g2 g=') |
}
{{ end }}
