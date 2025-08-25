{{ define "rh1" }}
  {{ .a }} b8 a4 fis | g e a='2) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \major
  \time 4/4
  {{ template "rh1" (w `a'='4.(\f`) }}
  {{ template "rh1" (w `a='4.(`) }}
  fis='4( a e2) | fis4( d g2) | a4.( b8 a4 fis | g\> e \af 2\! d='2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  <d= a'>1~-\frBass | 1 | 1~ | 1 | fis4( a e2) | fis4( d g2) | <d= a'>1~ | 1 |
}
{{ end }}
