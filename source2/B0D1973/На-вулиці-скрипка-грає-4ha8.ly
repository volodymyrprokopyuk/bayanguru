{% macro rh1() %}
  d=''8 d c c | b b a a | e e a='4 |
{% endmacro %}

{% macro lh1(a) %}
  d=8 dm! a am! | e' eM! a, am! | e'= eM! {{ a }} |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Con moto"
  \clef treble
  \key a \minor
  \time 2/4
  a'='8\mp e' e e | f f e e |
  {{ rh1() }}
  {{ rh1() }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \minor
  a,=,8-\stBass am! a am | d dm! a am! |
  {{ lh1("a,=,4") }}
  {{ lh1("a+am!4") }}
}
{% endmacro %}
