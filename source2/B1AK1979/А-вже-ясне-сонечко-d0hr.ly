{% macro rh1(a) %}
  {{ a }} b' a c | b4 a8 g\) |
  fis='8( a g4) | fis8( fis e='4) |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 2/4
  {{ rh1("e'='8\\(\\p") }}
  {{ rh1("e='8\\(") }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key e \minor
  e=8-\stBass em! e a@m! | e8 em! e em |
  a,=,8 am! b( e@m!) | b8( b7!) e( em!) |
  e=8 em! fis( a@m!) | g,8( e@m!) a8 b |
  c=8( a@m!) b8( e@m!) | b8( b7!) e=( em!) |
}
{% endmacro %}
