{{ define "rh1" }}
  \duo { e'='2. | g,4.( c8 b4) | } { c'='2.( | g=) | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key e \minor
  \time 3/4
  b'='8(\mf g' fis4 e | dis4. fis8 b,4) |
  b='8( e d4 c | b2) r4 |
  b='8( g' fis4 e | dis4. fis8 b,4) |
  b='8(\> c g4 fis | \af 2.\! e2.) |
  e='8(\p fis g4 \af 4\! a | b4. e8 d4) |
  e,='8( fis g4 a | fis4.\> e8 \af 4\! d4) |
  e='8(\mf\< fis g4 \af 4\! a | b4. e8 d4) |
  e,='8(^\tRit fis g4 a | fis2\> \af 4\! b4) |
  b='8(\p^\tATem g' fis4 e | dis4. fis8 b,4) |
  b='8(\>^\tRit c g4 fis | \af 2.\! e='2.) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  <e'=' g>4(-\frBass a ais | b) r r | g( fis e | <dis fis>2 b4) |
  r4 a'='4( ais | b) r r | r e,( <b dis> | e2.) |
  {{ template "rh1" }} | <c=' e>2( cis4 | d4. cis8 d4) |
  {{ template "rh1" }} | <c=' e>2.( | <b dis>) |
  <e=' g>4( a ais | b) r r | r e,( <b dis> | e='2.) |
}
{{ end }}
