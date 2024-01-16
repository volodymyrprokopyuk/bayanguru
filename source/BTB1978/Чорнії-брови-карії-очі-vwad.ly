{{ define "rh1" }}
  {{ .a }} gis a\< | e'2 \af 4\! cis4 |
  bes='4 a g | g2\> \af 4\! f4\) |
  e='4\(\< g \af 4\! bes | a2 g4 |
  g='4 f e\> | \af 2.\! d='2.\) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} a@7! a74 | a,4 a7! a7 |
  e'=4 a@7! a74 | d4 dm! dm |
  g,=,4 gm! gm | a4 d@m! dm4 | a=, a7! a7 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key d \minor
  \time 3/4
  d'='4\(\p f a\< | d2 \af 4\! d4 | cis b cis | d2 a4\) |
  f'=''4\( e d | c2 bes4 | bes a g\> | \af 2.\! a2.\) |
  {{ template "rh1" (w `a='4\(\mf`) }}
  {{ template "rh1" (w `a'='4\(\mf`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  d=4(-\stBass dm!) dm | f,( d@m!) dm4 | e'_\aSim a@7! a74 |
  \rep 2 { d=4 dm! dm | } e c@7! c74 | c c7! c7 | f, fM! fM |
  {{ template "lh1" (w `e'=4`) }} | d dm! dm |
  {{ template "lh1" (w `e=4`) }} | d+dm!2. |
}
{{ end }}
