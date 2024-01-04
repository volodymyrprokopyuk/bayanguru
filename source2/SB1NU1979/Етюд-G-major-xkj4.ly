{% macro rh1(a) %}
  {{ a }} a b c d e d \af 8\! g) | e( d c e d4 g='') |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} r b+g@M! r4 | c+cM!4 r b+g@M! r4 |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 4/4
  {{ rh1("g'='8(\\f\\<") }}
  c,=''8( d e c) b( c d b) | d(\> c b c b4 \af 8\! a) |
  {{ rh1("g='8(\\<") }}
  e=''4( c8 e) d4( c8 b) | a(\> b c a \af 2\! g='2) \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  {{ lh1("g+gM!4-\\stBass") }}
  c+cM!4 r g+gM! r | d+dM!4 r d+dM! r |
  {{ lh1("g+gM!4") }}
  c+cM!4 r b+g@M! r4 | d+dM!4 r g+gM!2 |
}
{% endmacro %}
