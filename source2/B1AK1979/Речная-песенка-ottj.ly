{% macro rh1(a) %}
  {{ a }} a | a g2) | bes4( a g | d' \af 2\! c=''2\>) |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} fM! fM | g g7! g7 | c c7! c7 | f,=, fM! fM |
{% endmacro %}

{% macro lh2(a, b) %}
  bes=,4 besM! besM | {{ a }} f@M! fM4 | c {{ b }} | f,=, fM! %
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Con moto"
  \clef treble
  \key f \major
  \time 3/4
  {{ rh1("c'='4(\\mf\\< f \\af 4\\!") }} {{ rh1("c,='4( f") }}
  \repeat volta 2 {
    <bes=' d>4\f 2 | <a f'>4 <a c>2 | <g bes>4( a g | <f a d> <f a c>2) |
    <bes=' d>4 2 | <f f'>4 <f c'>2 | <g bes>4( a g | f f=') r |
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key f \major
  {{ lh1("f,=,4-\\stBass") }} {{ lh1("f=,4") }}
  {{ lh2("c=4", "cM! c7!") }} fM |
  {{ lh2("a=,4", "c7! c7") }} r |
}
{% endmacro %}
