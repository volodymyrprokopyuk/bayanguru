{% macro rh1() %}
  g='4 g | d8 f4 f8 | e d e f | d4 d=' |
{% endmacro %}

{% macro lh1(a) %}
  b=,8 g@M! bes8 g@m! | a8 d@m! dm8 dm |
  a=,8 d@m! a8 a7! | d= dm! {{ a }} |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key d \minor
  \time 2/4
  d''=''4\mf d | a8 c4 a8 | bes g d'4 | a8 f4 f8 |
  {{ rh1() }} {{ rh1() }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key d \minor
  d=8-\stBass dm! d dm | d dM! d d7! | g, gm! g gm | d' dm! d dm |
  {{ lh1("r dm") }} {{ lh1("d+dm4") }}
}
{% endmacro %}
