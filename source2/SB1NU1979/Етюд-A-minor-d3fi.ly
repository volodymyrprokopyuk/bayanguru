{{ define "rh1" }}
  {{ .a }} b c d] e) r | a,[(\< b c d] \af 8\! e) r |
  d=''8(\< e f g a \af 8\! f | \af 2.\! e2.)\> |
  f=''8[(->\mf\> e d c] \af 8\! b) r |
  e=''8[(->\mf\> d c b] \af 8\! a=') r |
{{ end }}

{{ define "lh1" }}
  {{ .a }} am! am | a am! am | d dm! dm | c a@m! am4 | d dm! dm | e= a@m! am4 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Tempo di valzer"
  \clef treble
  \key a \minor
  \time 3/4
  {{ template "rh1" (w `a'='8[(\mf`) }}
  b='8(\f c b fis gis a | \af 2.\! b2.)\> |
  {{ template "rh1" (w `a='8[(\mf`) }}
  e='8(\< fis gis a b \af 8\! c | \af 2.\! a='2.)\> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `a,=,4-\stBass`) }} | dis b@7! b74 | e e7! e7 |
  {{ template "lh1" (w `a,=,4`) }} | e e7! e7 | a,=, am!2 |
}
{{ end }}
