{% macro rh1(a) %}
  {{ a }} e-. c-. e-. | d4( b8 d) | c-. b-. a='4 |
{% endmacro %}

{% macro rh2(a) %}
  e'=''8-. e-. e,4 | <dis a'>8-. <dis a'>-. 4 |
  e'=''8-. e-. e,-. e-. | {{ a }} |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} r g r | f4 r | e8 r a=4 |
{% endmacro %}

{% macro lh2(a, b) %}
  {{ a }} e= | f@M!8[ fM8] fM4 | r4 e= | {{ b }} |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  {{ rh1("c''=''8-.\\mp") }}
  {{ rh1("c=''8-.") }}
  {{ rh2("<f=' a>8-. <f=' a>-. 4") }}
  {{ rh2("a='8-. a-. a='4") }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \minor
  {{ lh1("a=8-\\puBass") }}
  {{ lh1("a=8") }}
  {{ lh2("r4-\\stBass", "f@M!8[ fM8] fM4") }}
  {{ lh2("r4", "f=8-. d-. a+am!4") }}
}
{% endmacro %}
