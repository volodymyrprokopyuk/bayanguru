{% macro rh1(a) %}
  {{ a }} d d d | c4 b8 b | a4 g=' |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} gM! b g@M | c8 cM! g gM! | d' d7! g,=, gM! |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  {{ rh1("d''=''8\\mf") }}
  {{ rh1("d'=''8") }}
  a='8\p a b b | c4( b8 d | a4 g) |
  a='8 a a b | c4 b8( d | a4 g=') \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  {{ lh1("g,=,8-\\stBass") }}
  {{ lh1("g=,8") }}
  d'=8 dM! g, gM! | c cM! g gM! | d' d7! g, gM! |
  d'=8 dM! g, gM! | c cM! d g@M! | d8 d7! g,=, gM! |
}
{% endmacro %}
