{{ define "rh1" }}
  {{ .a }} dis fis | \duo { c''=''2 b='4 | } { e'='2. | }
  <fis=' a>4 <e g > <dis fis> | {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Moderato cantabile"
  \clef treble
  \key e \minor
  \time 3/4
  b'='4\(\p g e | fis dis b | b' c b | a g fis\) |
  {{ template "rh1" (w `b,=4\(` `e='2.\)`) }}
  e='4\(\< g b | <c e>2 \af 4\! <b d>4 | 4\mf <c e> <b d> |
  <a=' c>4\> <g b> \af 4\! <fis a>\) |
  {{ template "rh1" (w `b,=4\(\p` `e='2.\)\<`) }}
  e='4\( <e g> \af 4\! <g b> | <c e>2\f <b d>4 |
  <b=' d>4 <c e> <b d> | \acc { <a=' c>16 <b d> } %
  <a=' c>4\>^\tRit <g b> \af 4\! <fis a>\) |
  \duo {
    b=4(\p^\tATem dis fis | c'2 b4)^\tTen |
    <fis=' a>4\( <e g>^\tRit fis | e2.~ | e~ | e='\) \bar "|."
  } { s2. | e'='2. | s2. | r4 r b(\pp | c b a | e=2.) | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  R2. | b=2\(-\frBass a4 | g a g | fis e dis\) |
  r4 b'=2\( | a2 g4 | a b2 | a4 g fis\) |
  e=2( d4 | c) c( g | g gis2 | a4 b c) |
  r4 b=,4(-> a) | r a(-> g) | a( b2 | a4 g fis) |
  e=,2( d4 | c8 e g c e4) | e,( fis gis | a b c) |
  r4 b=,4(-> a) | r a(-> g)^\tTen | b8( c cis4 dis | e2.) |
  a,=,4( g fis | e=,2.) |
}
{{ end }}
