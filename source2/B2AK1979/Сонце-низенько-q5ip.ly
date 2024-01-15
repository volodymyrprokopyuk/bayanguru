{{ define "rh1" }}
  <e=' fis c'>8\mf <dis fis b>8.-> dis16( |
  fis='8\> \af 4\! e4) |
  <e=' fis c'>8\< <dis fis b>8.-> \af 16\! <a' b dis>16 |
  <a=' b fis'>8(\f\> \af 16.\! <g=' b e>) r |
{{ end }}

{{ define "lh1" }}
  {{ .a }} em! em | e em em | b b7! b7 | b=, b7 b7 |
{{ end }}

{{ define "lh2" }}
  a=,8 b4 | e8 em! em | a, b=,4 | b+b7!8( e+em!) r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key e \minor
  \time 3/8
  \set subdivideBeams = ##t
  e''=''8\(\p b b | b16 a c b a g\) |
  fis='16\( g a8[ a] | a16 fis b a g fis\) |
  g='16\( a b8[ b] | b16 a c b a g\) |
  fis='16\( g a8[ a] | a16 fis b a g fis\) |
  {{ template "rh1" }}
  \duo { e''=''4.~\mp | e | dis~ | dis | e~ | e | dis~ | dis='' | }
  {
    \set subdivideBeams = ##t
    e''=''8\( b b | b16 a c b a g\) |
    fis='16\( g a8[ a] | a16 fis b a g fis\) |
    g='16\( a b8[ b] | b16 a c b a g\) |
    fis='16\( g a8[ a] | a16 fis b a g fis='\) |
  }
  {{ template "rh1" }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  {{ template "lh1" (w `e=8-\stBass`) }}
  {{ template "lh1" (w `e=8`) }}
  {{ template "lh2" }}
  \rep 2 { e=8 em! em | g,[ e@m em8] | b b7! b7 | b=, b7 b7 | }
  {{ template "lh2" }}
}
{{ end }}
