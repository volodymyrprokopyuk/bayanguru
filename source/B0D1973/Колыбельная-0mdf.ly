{{ define "lh1" }}
  a@m!4( e@M!4 | a@m!8[ d@m!8] {{ .a }}) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key a \minor
  \time 2/4
  \repeat volta 2 {
    e'='8\(\p e a a | c a b4\) |
    c=''8\( a gis e | a a a='4\) |
  }
  c=''8( a e'4) | c8( a e'4) |
  c=''8\( a gis e | a a a='4\) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,8-\stBass r am! r | a@m!4( e@M!4) |
  {{ template "lh1" (w `a@m!4`) }}
  \rep 2 { a@m!8[( d@m!8] a@m!4) | }
  {{ template "lh1" (w `a+am!4`) }}
}
{{ end }}
