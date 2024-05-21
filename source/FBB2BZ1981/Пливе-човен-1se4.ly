{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key g \minor
  \time 3/4
  \meter 1/4 1,1,1
  \repeat volta 2 {
    bes'='4(\mf a8 bes16 a g8 a) |
    \duo { d''=''4( c8 d16 c bes8 bes=') | } { bes'='4( a8 fis g g=') | }
    <fis=' a>8\p\< 8 8( \af 8\! <g bes> <a c>\> \af 16.\! <g bes>) |
    <fis=' a>8\< 8 8( \af 16.\! <g bes> <a c> <g bes>16 <a c>) |
    \duo { d''=''4(\mf ees8 d c bes16 c | d4\> \af 4\! g,=') } %
    { bes'='8( a g4) g8 g( | fis4 g=') } r4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \minor
  \meter 1/4 1,1,1
  R2. | R2. | d'='8 d d d d d | d d d g f f | bes,4 c8 f ees ees | d4 g=' r |
}
{{ end }}
