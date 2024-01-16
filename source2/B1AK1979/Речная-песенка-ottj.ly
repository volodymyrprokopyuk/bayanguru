{{ define "rh1" }}
  {{ .a }} a | a g2) | bes4( a g | d' \af 2\! c=''2)\> |
{{ end }}

{{ define "lh1" }}
  {{ .a }} fM! fM | g g7! g7 | c c7! c7 | f,=, fM! fM |
{{ end }}

{{ define "lh2" }}
  bes=,4 besM! besM | {{ .a }} f@M! fM4 | c {{ .b }} | f,=, fM! %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Con moto"
  \clef treble
  \key f \major
  \time 3/4
  {{ template "rh1" (w `c'='4(\mf\< f \af 4\!`) }}
  {{ template "rh1" (w `c,='4( f`) }}
  \repeat volta 2 {
    <bes=' d>4\f 2 | <a f'>4 <a c>2 | <g bes>4( a g | <f a d> <f a c>2) |
    <bes=' d>4 2 | <f f'>4 <f c'>2 | <g bes>4( a g | f f=') r |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  {{ template "lh1" (w `f,=,4-\stBass`) }}
  {{ template "lh1" (w `f=,4`) }}
  {{ template "lh2" (w `c=4` `cM! c7!`) }} fM |
  {{ template "lh2" (w `a=,4` `c7! c7`) }} r |
}
{{ end }}
