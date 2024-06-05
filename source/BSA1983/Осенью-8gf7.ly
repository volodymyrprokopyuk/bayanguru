{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key e \minor
  \time 4/4
  <g= b>2\(\p <fis b> | <g e'> <gis d' e>\< |
  <a= c e>2 <c e a> | \af 1\! <b dis fis>1\) |
  <b= e g>2\(\< <e g b> | <g c e> \af 2\! <gis d' e> |
  <a=' c e>2 <e a> | <dis=' b'>1\)-- |
  e'=''2(\p\< \af 2\! <d e> | <c g'>\> \af 2\! <b g'>) |
  c=''2(\< \af 2\! <b c> | <a e'>\> \af 2\! <g e'>) |
  a='2( <g c>) | <fis b>( <fis a>) | g(\> \af 2\! <dis fis> | e='1) |

  b=2-- b-- | <g e'>--\< <gis d' e>-- |
  <a= c e>2-- \af 2\! <c e a>-- | <b dis fis>1-- |
  <b= e g>2--\< <e g b>-- | <g e'>-- \af 2\! <gis d' e>-- |
  <a=' c e>2--\> <e a>-- | \af 2\! <fis=' b>1-- |
  \duo {
    e''=''2-- \af 2\! e--\< | g--\> \af 2\! g-- |
    c,=''2-- \af 2\! c--\< | e--\> \af 2\! e=''-- |
  }
  { r2 e''=''4( d | c b c2) | r2 c4( b | a g a='2) | }
  a='2\(~ <a c> | b <fis a>\> | g \af 2\! <dis fis> | e='1\) \clef bass |
  g,=2 <dis fis>\> | \af 1\! e=1 \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
}
{{ end }}
