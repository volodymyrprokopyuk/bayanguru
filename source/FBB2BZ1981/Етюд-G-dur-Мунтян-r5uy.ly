{{ define "lh1" }}
  {{ .a }} <b d>) | fis( <b d>) | f( <g= b>) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Andante con moto"
  \clef treble
  \key g \major
  \time 2/4
  \meter 1/2 #'(1)
  g'='8\(\mp a b c | d\< e d4 | b8 c d e | \af 2\! d2\) |
  e=''8\( d c b | c\> d c4 | d8 c b a | \af 2\! b2\) |
  g='8\(\< a b c | d e \af 4\! d4 | d8 e d e | g4~ g8\) g,( |
  g='8 a g a | d\> b g e | d4)-. \af 4\! <c fis b>4-. | <b= d g>2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  {{ template "lh1" (w `g=4(-\frBass`) }} | e( b') | gis( e) |
  a=4( g) | fis( d) | g( d) |
  {{ template "lh1" (w `g=4(`) }} | e( <g c>8) r | ees4( <g cis>) |
  d=4( <g b>) | d-. d-. | <g,=, d'>2 |
}
{{ end }}
