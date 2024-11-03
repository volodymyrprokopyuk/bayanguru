{{ define "rh1" }}
  \duo { a'='8[\< e' d c] | \af 8.\! c4 b=' | } { a'='4 gis8 a | <f=' a>2 | }
  {{ .a }} e <dis fis> \af 8\! <d=' gis>] |
{{ end }}

{{ define "lh1" }}
  c+cM!4 e+c@M! | g+gM!4 gis+e@7! | a+am!4 d+dm! | {{ .a }} |
  c=4( b8 a | d4) dm! | e r8 e= |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  R2\p | b'='4 b | c8[ c b a] | gis[\> fis gis e] | \af 8.\! a4 r |
  b='8\< c16 d c8 \af 8\! b | b[ a c b] | b[\> a a \af 8\! gis] |
  \af 4\! a='4\<^\tRit g='->\mf |
  c=''8--^\tATem e-- g8. e16 | d8 e16 f e8 d | c d16 c b8 a |
  gis='4.\> \af 8\! e8 | {{ template "rh1" (w `<c=' e>8[\>`) }}
  <c=' a'>8^\tRit r g'='4\sf |
  c=''8\f\< e g8. \af 16\! e16 | d8 e16 f e8 d |
  c=''8.\> c16 d8. \af 16\! c16 | b4 r |
  {{ template "rh1" (w `<c,=' e>8[\>`) }} | <c=' a'>2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,8-\stBass am! a am | gis e@7! e'8 e7 | a, am! e' a@m |
  b=,8 e@7! e8 e7 | a, am! e' a@m | gis,8 e@7! e'8 e7 |
  a,=,8 em! d dm! | e a@m! e8 e7! | a,=, am! b+g@7!4-> |
  {{ template "lh1" (w `e+eM!4. r8`) }} | a,=, r b+g@7!4 |
  {{ template "lh1" (w `e+eM!4 r4`) }} | a+am!2 |
}
{{ end }}
