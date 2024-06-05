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
  e=2\(-\puBass d | c b | a fis | b1\) | e2\( d | c b | a fis | b=,1\) |
  R1 \clef treble e'='1---\frBass | R1 | c-- | r2 e | dis( b=) \clef bass |
  e,=2(_~ <e a>_~ <e= g>1) |

  r4 a=4-.-\puBass g-. fis-. | e-. d-. c-. b-. | a-. g-. fis-. a-. | b( c b2) |
  r4 a'=4-. g-. fis-. | e-. d-. c-. b-. | a-. g-. fis-. e-. | dis( cis b=,,2) \clef treble |
  r4 d'''=''4(-\frBass c b | a g a2) | r4 b( a g | fis e fis2) |
  r4 fis='4-. e-. fis-. | dis-. b-. cis-. dis-. | e-. b-. a-. b=-. \clef bass |
  g=4-. fis-. e2-- | r4 b-\puBass a b | g fis e=,2 \fermata |
}
{{ end }}
