{{ define "rh1" }}
  <b=' d>4. <a c>8 | <g b>8 8 <fis a>4 | \af 4.\! g='4.\> r8 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Vivo
  \clef treble
  \key g \major
  \time 2/4
  \meter 1/2 #'(1)
  g'='8\mf g <g b> <a c> | {{ template "rh1" }}
  g='4\mf <g b>8( <a c>) | {{ template "rh1" }}
  <g=' b>8\mf <g d'> <fis a>8 8 | <g b> <fis b> <e c'> <fis a> |
  <g=' b>8 <g d'> <fis a>8 8 |
  \duo { b'='8[ a16( b=']) } { g'='8[ fis='] } <e=' c'>8 <fis a> |
  <g=' b>8 <a c> <fis d'>4 | g4. r8 |
  <g=' b>8 <e b'> <fis a>4 | \af 4.\! g='4. \> r8 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  \meter 1/2 #'(1)
  R2 | g,=,8-\frBass g b c | d4. c8 | b a g4 | R2 | g4 b8 c |
  d=4. c8 | b a g4 | R2 | b'8 d a a | b b c a | b d a a | b[ a16 b] c8 a= |
  \duo { s4 b=4 | c2 | b=4. } { b=8[ <a c>] g fis | e c d4 | g8[ d] g,=, } r8 |
}
{{ end }}

{{ define "lyrics" }}
\lyrOneColThree
"1." \column {
  "Ой на горі жито..."
  "Сидить зайчик."
  "Він ніжками чеберяє."
  \lyrChorus
  "Коли б такі ніжки мала,"
  "То я б ними чеберяла,"
  \lyrRep "Як той зайчик." 2
}
"2." \column {
  "Ой на горі просо..."
  "Сидить зайчик."
  "Він ніжками чеберяє."
  \lyrChorus
}
"3." \column {
  "Ой на горі гречка..."
  "Сидить зайчик."
  "Він ніжками чеберяє."
  \lyrChorus
}
{{ end }}
