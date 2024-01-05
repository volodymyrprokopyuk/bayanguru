{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  \duo {
    e'='4\p a8 c | b4 a8 a | b c b4 | a a |
    e='8 e a c | b4 a8 a | <gis b> <a c> <gis b>8 8 | a2 |
    \rep 2 { b='4 a8 a=' | } <a b> <a c> <gis b>4 | a4 a |
    \rep 2 { b='4 a8 a=' | } <gis b> <a c> <gis b>4 | a='2 \fermata \bar "|."
  } {
    e'='2~ | e | f4 f8( e) | c( e) dis( e) |
    e='8 e4 e8 | d2 | <d e> | r8 <c e> <c f> <c e> |
    f='2 | e4. e8 | dis4 f8( e) | f'( e) c( e,) |
    f='4. e8 | dis2 | d4 f8( e) | f( e) a,=4 \fermata |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,8-\stBass am! am am | c a@m! am8 am |
  d=8 dm! e e7! | a, am! r am |
  c=8 a@m! am8 am | f, d@m! r8 dm |
  e'=8 e7! r e7 | a, am! r am |
  d=8 dm! r dm | c a@m! r8 am |
  f,=,8 fM! e' e7! | a, am! r am |
  d=8 dm! r a@m! | b8 b7! r b7 |
  e=8 e7! r e7 | a,=, am! r am \fermata |
}
{{ end }}
