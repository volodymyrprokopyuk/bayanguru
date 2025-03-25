{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key d \minor
  \time 2/4
  \meter 1/2 #'(1)
  \repeat volta 2 {
    <f'=' a d>4\mf a | \duo { c''=''8( bes a) g=' | } { g'='4 r | }
    f='8 g <e a>4 | d='2 |
  }
  f='8 f f a | <f c'>4. 8 | <f d'>8 8 8 8 | <a c>( <g bes> <f a>) <e g> |
  <d=' f>8 <e g> <cis a'>4 | d2 | <d bes' d>\f |
  <a'=' c>8 <g bes> <f a> <g bes> | <d f a>2 |
  <f=' a c>4 <f bes d> | <a c>8( <g bes> <f a>) <e g> |
  <d=' f>8 <e g> <cis a'>4 | <d=' d'>2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  \meter 1/2 #'(1)
  <d= a' d>4-\frBass r | <g bes d> r | <a d>8 r <a cis> r | d='2 |
  <f,= a c>8 r8 8 r8 | <ees a c>4. 8 | <d bes'>8 8 8 8 |
  <f= c'>8 g a bes | a4 a, | <d f>2 | <bes bes'> |
  <f'= c'>8 bes a bes | <f c'>2 | 4 bes | <f c'>8 g a bes | a4 a, | <d= f>2 |
}
{{ end }}

{{ define "lyrics" }}
{{ end }}
