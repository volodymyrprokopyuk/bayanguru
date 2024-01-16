{{ define "lh1" }}
  {{ .a }} am! c a@m | e4 e7! gis,=, e@7 |
{{ end }}

{{ define "lh2" }}
  {{ .a }} a7! cis a@7 | \rep 2 { d=4 dm! f= d@m | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Lento
  \clef treble
  \key a \minor
  \time 4/4
  e'='4.\p f8 e4.\< \af 8\! a,8 | c4 \af 2.\! b2.\> |
  e='4. f8 e4. a,8 | \af 4..\! c2\< \af 2\! b2\> |
  cis='4. d8 e4 g\< | f8 g \af 2.\! a2. |
  a='4.\< \af 8\! a8 c4 b | \af 2.\! gis2.\> r4 |
  a='4.\mp bes8 a4 g | f a2. | a4. a8 c4\< \af 4\! b |
  d=''2.\mf \fermata r4 | e4. e8 f4 e | d a2 b4 |
  e,='4. a8\> a gis fis \af 8\! gis | a='1\pp \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `a,=,4-\stBass`) }}
  {{ template "lh1" (w `a=,4`) }}
  {{ template "lh2" (w `a=,4`) }} | e4( e7!) e( e7) |
  {{ template "lh2" (w `a,=,4`) }} | e4( e7!2) \fermata e74 |
  a,=,4 a7! cis a@7 | d4 dm! f d@m |
  e=4 a@m! e4 e7! | a,=,( am!) am2 |
}
{{ end }}
