{% macro rh1(a) %}
  {{ a }} c c e | g g g e | d d g f | e2 c='' |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} cM! cM cM | c cM cM cM |
  g=,4 g7! g7 g7 | c= cM! cM cM |
{% endmacro %}

{% macro lh2(a, b) %}
  {{ a }} eM! eM eM | a, am! am am |
  e'=4 e7! e7 e7 | a,=, am! {{ b }}
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 4/4
  {{ rh1("c''=''4\\f") }}
  {{ rh1("c=''4") }}
  e=''4\(\mp d c b | a b c d\) |
  e=''4\( d c b | a2 a'\) |
  e=''4\( d c b | a b c2\) |
  e=''4\( d c b | a2\) a=' \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \minor
  {{ lh1("c=4-\\stBass") }}
  {{ lh1("c=4") }}
  {{ lh2("e=4", "am am") }}
  {{ lh2("e'=4", "am2") }}
}
{% endmacro %}
