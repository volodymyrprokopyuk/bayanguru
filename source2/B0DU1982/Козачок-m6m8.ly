{% macro rh1(a, b) %}
  {{ a }} c8-. e-. | d16( c b8)-. c-. e-. |
  c=''8-. e-. c-. e-. | d16( c b8)-. {{ b }} |
{% endmacro %}

{% macro lh1(a, b) %}
  {{ a }} am! a am | e' e7! a, am! |
  a=,8 am! a am | e'= e7! {{ b }} |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Con moto"
  \clef treble
  \key a \minor
  \time 2/4
  {{ rh1("e''=''4\\mf", "c=''4") }}
  {{ rh1("e=''4", "a='4") }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \minor
  {{ lh1("a,=,8-\\stBass", "a,=, am!") }}
  {{ lh1("a=,8", "a+am!4") }}
}
{% endmacro %}
