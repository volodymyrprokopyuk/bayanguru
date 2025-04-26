{{ define "rh1" }}
  {{ .a }} <bes d>8 {{ .b }} 8 8] | <g bes>16 <a c> <bes d>8 <g bes> g=' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} d' {{ .b }} f, d' | e, d' ees, d'=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key g \minor
  \time 2/4
  \repeat volta 2 {
    {{ template "rh1" (w `g'='8[\mf` `_ \aSta`) }}
    {{ template "rh1" (w `g='8[` ``) }}
    <g=' bes>8( <fis a>) g4-- | <g bes>8[ <fis a> g g='] |
    g='8[ <g bes> <bes d> <a c>] | <g bes>( <fis a>) g='4-- |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  \meter 1/2 #'(1)
  {{ template "lh1" (w `g=8-\frBass` `_ \aSta`) }}
  {{ template "lh1" (w `g,=8` ``) }}
  d,=8( a') g4-- | d8 a' g g | g <f g> <e g> <ees g> |
  <d= g>8( <d a'>) <g,=, g'>4-- |
}
{{ end }}
