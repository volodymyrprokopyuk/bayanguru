{% macro rh1() %}
  b='8-. b-. a( fis)-. g-. g-. a( fis)-. |
  g='8-. g-. fis-. dis='-. %
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key g \major
  \time 4/4
  \meter 1/4 1,1,1,1
  b'='8(\mf e b b c a b b) | b( g' fis e c a b4) |
  {{ rh1() }} e( fis g a) |
  {{ rh1() }} e-. e-. e='4 \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  \meter 1/4 1,1,1,1
  e=4-\stBass em! a@m! e@m!4 | e em! a@m! e@m!4 |
  e=8 em! b bM! e em! a, am! |
  b=,8 e@m! b8 bM! e+em!4 r4 |
  g=,8 gM! d' dM! e em! a, am! |
  b=,8 e@m! b8 bM! e= em! e+em4 |
}
{% endmacro %}
