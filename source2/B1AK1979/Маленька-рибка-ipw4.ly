{% macro lh1() %}
  d=8 dM! d dM | dis b@7! e8 em! | a, a7! a=, a7 |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Andante
  \clef treble
  \key d \major
  \time 2/4
  <fis'=' a>8-.\mf 8-. 4 | <d fis>8-. 8-. 4 | fis8( g a b | a4 g) |
  <e=' g>8-. 8-. 4 | <cis e>8-. 8-. 4 | e8( fis g a g4 fis) |
  d='8(\p e fis fis | fis g e4) | e8( fis g g | g a fis4) |
  d='8(\mf e fis4) | fis8( g e4) | a8 a( g cis,) | e4 d=' \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key d \major
  d+dM!8-\stBass d+dM d+dM4 | d+dM8 d+dM d+dM4 |
  a,=,8 a7! d dM! | dis b@7! e8 em! |
  e+em!8 e+em e+em4 | a+a7!8 a+a7 a+a74 |
  a,=,8 a7! a a7 | \duo { r4 dM! | } { d=2 | }
  {{ lh1() }} | e' a@7! d8 dM! |
  {{ lh1() }} | \duo { r8 g@M! d@M!4 | } { d=2 | }
}
{% endmacro %}
