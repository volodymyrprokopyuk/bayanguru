{% macro rh1(a, b) %}
  {{ a }} d e f g8) g | a16( g f a g4) |
  f='16( e d f {{ b }} c b d c='4) |
{% endmacro %}

{% macro lh1(a, b, c) %}
  {{ a }} cM! e c@M | f8 fM! e c@M! | {{ b }} g, c@M! | g=,8 g7! {{ c }} |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  {{ rh1("c'='16(\\mf", "e='8) e | d16(") }}
  {{ rh1("c='16(", "e='16 d c e | d16") }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  {{ lh1("c=8-\\stBass", "f=8 fM!", "c= cM!") }}
  {{ lh1("c=8", "d=8 dm!", "c+cM!4") }}
}
{% endmacro %}
