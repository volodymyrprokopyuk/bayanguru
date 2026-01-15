{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key g \minor
  \time 2/4
  g'='4\(\mf g8 a | bes c bes a | g\< fis g \af 8\! a | bes4\> \af 4\! f\) |
  <bes=' d>2\( | <a c>4 f'8 ees | <bes d>4\) r | <bes d>4\( 4 |
  <a=' c>4 <fis d'> | <g bes> a8 g | <ees a>4. c'8 | <fis, d'>\> c' bes a |
  \af 2\! g='2\) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  <g= bes>2-\frBass | <g d'> | <g bes>4 g8 f | <bes d>2 |
  <bes= f'>2 | <f f'> | <bes f'>4 r | <bes, bes'> <d bes'> |
  <f= c'>4 <d c'> | <g bes> ees | <c g'>4. r8 | <d c'>2 | <g= bes> |
}
{{ end }}
