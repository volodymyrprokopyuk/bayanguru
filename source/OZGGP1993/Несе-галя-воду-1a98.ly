{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \minor
  \time 2/4
  <bes'=' d>8\mf <bes d f> <a d f> <aes d f> |
  <g=' c ees>4 <fis bes d>8 <a c> |
  <g=' bes>16( <a c>) <bes d>8 8 8 |
  \time 3/4 \duo { c''=''4 g='2 | } { g'='8( fis) g='2 | }
  \time 2/4 g='8\mp <g bes>8 8 8 |
  \time 3/4 <fis=' a>4 g2 |
  \time 2/4 bes='8 <bes d>8 8 8 |
  \time 3/4 <a=' c>4 bes2 |
  \repeat volta 2 {
    \time 2/4 <bes=' d>8 <d f>8 8 8 | <c ees>4 <bes d>8( <a c>) |
    <g=' bes>16( <a c>) <bes d>8 8 8 |
    \time 3/4 <a=' c>4 g='2 |
  }

}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  bes=4-\frBass d | c8 ees d d, | <g d'>4 4 |
  \duo { c'='4 bes=2 | } { ees=8( d) g=2 | }
  g=8 d'4 8 | g,[ <c d>] g <bes d>4 8 |
  bes=8 f'4 f8 | f, ees' bes <d f>4 8 |
  bes=8 <bes d> f <bes d> | c, <g' ees'> d <fis c'> |
  g=8 <bes d> f <bes d> | <ees, g>( <d fis>) <g= bes>2 |
}
{{ end }}
