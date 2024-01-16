{{ define "lh1" }}
  {{ .a }} cM! cM cM | f, fM! fM fM | g g7! g7 g7 | c= cM! cM cM |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key c \major
  \time 4/4
  e''=''4(\mp d c b) | b( a) a2 | d4( g, e' d | c1) |
  e=''4( d c b) | b( a) a2 | g4( e' d g, | c1) |
  e=''4(\mf f e d | c b a2) | e'4( f e d | d2 c4) r |
  d=''4(\< d e \af 4\! f | g\f c, d e) | f(\> a, e' d | \af 1\! c=''1) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  {{ template "lh1" (w `c=4-\stBass`) }} {{ template "lh1" (w `c=4`) }}
  \rep 2 { gis=,4 e@7! e74 e7 | a=, am! am am | }
  g=,4 gM! gM f | e c@M! cM4 c' | d dm! g, g7! c= cM! cM r |
}
{{ end }}
