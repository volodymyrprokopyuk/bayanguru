{% macro rightHand() %}
\relative {
  \tempo Cantabile
  \clef treble
  \key e \minor
  \time 2/4
  R2\p | \rep 3 { R2 | } | r8 g''=''8-. c-. g-. | r g-. b-. g-. |
  r8 c='''8-. d-. a-. | r g-. b-. a-. |
  \duo { \stemDown <e''='' g>4\( e | \stemUp b' d8 b | a4 g8 fis | e=''2\) | }
  { s2 | g''=''2 | b, | c4 b=' | }
  <e,=' g>4\( fis8 e | <g b>4. <fis a>8 | <a c>4 <g b>8 <fis a> | e='2\) |

  R2\mp | \rep 3 { R2 | } | <g=' b>4--\mf <g c e>-- | <g d'>4.-- <g b>8-- |
  <g=' c e>4-- <g c fis>8-- <g c e>-- | <g b>4-- fis-- |
  \duo {
    <e'=' g>4\(\p s4 | b' d8 b | s4 g8 fis | <c e>2\) |
    <e=' g>4\( fis8 e | b'4. a8 | c4 b8^\tRit a | e='2\) \bar "|."
  } {
    s4 \stemUp e'='4~ | \stemDown e2~ | \stemUp <e a>4 s4 | s2 |
    s2 | \stemDown d='2~ | d='( | s2) |
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef treble
  \key e \minor
  b'='4.\(-\frBass e,8 | g4 fis8 e | d e fis g | e2\) |
  b'='4\( e | d4. b8 | e4 fis8 e | b2\) | <e, b'>2 | 2 | fis8 b, d4 | e='2 |
  \clef bass e,=2 | d4 c | b2 | <e= b'> |

  b'=4.\( e,8 | g4 fis8 e | d e fis g | e2\) |
  e=8 d c e | g a b g | c b a4 | b a8 b |
  e,=8 \noBeam e( fis g) | r g( fis g) | r c( b a) | r fis( g a) |
  b=8\( e, g4 | b8 e, fis4 | a8 fis g b, | e=2\) |
}
{% endmacro %}
