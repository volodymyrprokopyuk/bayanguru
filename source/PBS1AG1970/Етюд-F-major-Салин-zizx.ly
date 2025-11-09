{{ define "rh1" }}
  {{ .a }} e f c a f a c | f e f d bes f bes d | f e f c a f a d | c=''2 |
{{ end }}

{{ define "lh1" }}
  {{ .a }} fM! fM fM | f[ bes@M! besM8 besM] | \rep 2 { f=,8 fM! fM fM | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 2/4
  {{ template "rh1" (w `f''=''16\f`) }}
  c=''16\mf d c bes g e g a | bes c bes g e c d e | f c d e f g a bes | c2 |
  {{ template "rh1" (w `f=''16\f`) }}
  c=''16\mf d c bes g d g bes | c d c a f c f a | g a g e c d e g | f='2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  \meter 1/2 #'(1)
  {{ template "lh1" (w `f,=,8-\stBass`) }}
  \rep 2 { c'=8 c7! c7 c7 | } | \rep 2 { f,=,8 fM! fM fM | }
  {{ template "lh1" (w `f=,8`) }}
  g=,8 gm! gm gm | c[ f@M! fM8 fM] | c= c7! c7 c7 | f+fM!2 |
}
{{ end }}
