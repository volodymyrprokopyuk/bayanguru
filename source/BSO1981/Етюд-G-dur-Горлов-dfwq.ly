{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \major
  \time 3/4
  \meter 1/4 1,1,1
  g'='8\p\< b_\aLeg a c b d | c e d fis e \af 8\! g |
  g=''8\mf\> e fis d e b | d c b g \af 4\! a='4 |
  g'=''4\mf\< fis f | e d \af 4\! c |
  d=''8\> b g a e fis | g2 \af 4\! g'=''4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  \meter 1/4 1,1,1
  g=4-\frBass fis f | e d c | b a gis | a d e8 fis |
  g,=,8 b a c b d | c e d fis e g |
  b,=,8 d g fis e d | c b a b g=,4 |
}
{{ end }}
