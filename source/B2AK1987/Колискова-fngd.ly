{{ define "rh1" }}
  {{ .a }} g(\< c) c8( \af 8\! d | bes4 a8\> bes g4) \af 4\! g=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Lento
  \clef treble
  \key g \minor
  \time 4/4
  {{ template "rh1" (w `g'='4\p`) }}
  {{ template "rh1" (w `g='4`) }}
  fis='4\( d\< g \af 4\! bes | a fis\> g \af 4\! g\) |
  fis='4\( d\< g \af 4\! bes | a8 g fis\> a g4 \af 8\! g='\) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  g,=,4-\stBass gm!8 r ees'4 c@m!8 r8 | d4 d7!8 r g,4 gm!8 r |
  g=,4 gm!8 r ees'4 c@m!8 r8 | d4 d7!8 r g,4 gm!8 r |
  \rep 3 { d@7!4( d'=8) r g@m!4( d=8) r | }
  d@7!4( d=8) r g+gm!4 r |
}
{{ end }}
