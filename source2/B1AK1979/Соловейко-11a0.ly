{% macro rh1(a) %}
  {{ a }} d b d | c( b a4) | b8( a g='4) |
{% endmacro %}

{% macro rh2(a) %}
  {{ a }} a d4 | b16( c b a g='4) |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} gM!) gM gM] | a[( d@7!) d78 d7] |
  d=8 d7! g,=, gM! |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  {{ rh1("d''=''8\\mf") }}
  {{ rh1("d'=''8\\mp") }}
  {{ rh2("a='8\\mf") }}
  {{ rh2("a='8\\p") }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  {{ lh1("g,=,8[(-\\stBass") }}
  {{ lh1("g=,8[(") }}
  d'=8 d7! fis d@7 | d8 d7! g, gM! |
  c=8 a@m! fis8 d@7! | d8 d7! g,=, gM! |
}
{% endmacro %}
