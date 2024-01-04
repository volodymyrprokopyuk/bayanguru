{% macro rh1(a) %}
  {{ a }} g)-. g-. g-. | fis( a) a4 | b8 b( c a | g)-. g-. g='4 |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} gM!) gM gM | d'( dM!) dM dM | g,[ gM!] d'= d7! |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegro
  \clef treble
  \key g \major
  \time 2/4
  {{ rh1("d'='8(\\mf") }}
  d'=''8(\< b) b g | g( e) \af 4\! e4 |
  c'=''8(\> b) a g | fis( e) \af 4\! d4 |
  {{ rh1("d='8(\\p") }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  \meter 1/2 #'(1)
  {{ lh1("g,=,8(-\\stBass") }} | g,( gM!) gM gM |
  g=,8( gM!) gM gM | e'( em!) em em |
  a,=,8( am!) am am | d( dM!) dM dM |
  {{ lh1("g,=,8(") }} | g,=,8 gM! g+gM4 |
}
{% endmacro %}
