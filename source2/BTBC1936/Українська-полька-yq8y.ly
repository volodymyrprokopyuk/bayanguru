{{ define "lh1" }}
  {{ .a }} am! a am | d r d dm! | e r e e7! | a,=, am! am4 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Con moto"
  \clef treble
  \key a \minor
  \time 2/4
  \repeat segno 2 {
    \volta 1
    e'='8(\mf c') c c | c( b) b a | a( gis) gis b | b( a) a4 |
    e='8( c') c c | c( bes) bes a | gis( b) e gis, | a a a='4 \fine \bar "||"

    \volta 2
    g='4\(\f fis8 f | e g c a\) | g4\( fis8 f | e g c4\) |
    g='4\( fis8 f | e g c a\) | d8\( c b a | gis\> b \af 4\! e,='4\) \bar "|."
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `a,=,8-\stBass`) }}
  {{ template "lh1" (w `a=,8`) }}

  b=,8 g@7! g8 g7 | c cM! c cM | b g@7! g8 g7 | c cM! cM4 |
  b=,8 g@7! g8 g7 | c cM! c cM | b d@m! r8 dm | e=8 e7! r e7 |
}
{{ end }}
