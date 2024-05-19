{{ define "rightHand" }}
\relative {
  \tempo "Moderato cantabile"
  \clef treble
  \key g \minor
  \time 3/4
  \meter 1/4 1,1,1
  \repeat volta 2 {
    d''=''8(\mf c bes a g bes | a fis \af 2\! d2)\> |
    d'=''8(\< c bes d f \af 8\! d | \af 2 \! c2) \> r4 |
    c=''8( ees d c bes a | g8. a16 bes4)-- r |
    a='8( a d f e cis | \af 2.\! d=''2.)\> |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  \meter 1/4 1,1,1
  <g= bes>4-\frBass 2 | <d fis>4 2 | <bes d> <d f>4 | <f a>2 r4 |
  <ees= g>8( c <d fis>) r d'( c | bes8. a16 g=4)-- r \clef treble |
  <a= f'>2 <a g'>4 | <d=' f>2. \clef bass |
}
{{ end }}
