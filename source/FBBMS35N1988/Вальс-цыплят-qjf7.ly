{{ define "lh1" }}
  {{ .a }} <c e>) 4-. | a( <d=' f>) 4-. |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key a \minor
  \time 3/4
  c'''='''8(->\mf a e4) g-. | f2. | e8(\< f fis4) \af 4\! gis-. |
  \af 2.\! a=''2.->\> | e'='''8(->\f c) e-. c-. b-. a-. |
  \af 2.\! b=''2.\> | e,8(\< f) fis-. g-. gis-. \af 8\! b-. |
  \af 2.\! a=''2.\> | g8(\p a) g-._\dCre f-. e-. g-. |
  f=''4( \acc { gis=''8 } a4) a-. | b8( c) b-. fis-. g-. a |
  \acc { ais=''8 } b=''4->\f\> <dis, e>4-- \af 4\! 4-- |
  c'='''8(->\f a e4) g-. | \af 2.\! f2.\> |
  e=''8-.\< f-. e-. f-. fis-. \af 8\! gis-. |
  a=''2\>^\tRit \ottava #1 \acc { gis'='''8 } %
  \af 4\! a='''4-. \ottava #0 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  {{ template "lh1" (w `a=4(-\frBass`) }} | gis,=4( <d' e>) 4-. |
  \rep 2 { a=4( <c=' e>) 4-. | } | a( <d f>) 4-. | b( <d e>) 4-. |
  c='4( <e a>) 4-. | cis( <e g>) 4-. | d( <f a>) 4-. |
  dis='4( <a' b>) 4-. | e( d8 c b4) | {{ template "lh1" (w `a=4(`) }} |
  e='8-. d-. e-. d-. c-. b-. | a4-. e'-. a='-. \bar "|."
}
{{ end }}
