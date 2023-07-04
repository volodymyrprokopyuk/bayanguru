{% macro rh1(a) %}
  {{ a }} g)-. g-. g-. | fis( a)-. a-. a-. |
  b='8( a g fis | e4) e=' |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} gM! gM gM | g=, gM gM gM |
{% endmacro %}

{% macro lh2(a, b) %}
  {{ a }} em! e em | a, am! a am |
  b=,8 bM! b bM | {{ b }} |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  \meter 1/2 #'(1)
  d''=''4(\mf b)-. | d( b)-. |
  d=''8-. d-. d-. e-. | d4( b)-. |
  {{ rh1("e,='8(") }}
  {{ rh1("e='8(") }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  \meter 1/2 #'(1)
  {{ lh1("g,=,8-\\stBass") }}
  {{ lh1("g=,8") }}
  \meter 1/4 1,1,1,1
  {{ lh2("e'=8", "e em! e= em") }}
  {{ lh2("e=8", "e=4 em!") }}
}
{% endmacro %}
