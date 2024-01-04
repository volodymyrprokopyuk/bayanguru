{% macro rh1(a) %}
  {{ a }} g-. g-. e-. f-. e-. d4 |
{% endmacro %}

{% macro rh2(a) %}
  {{ a }} c-. d4 e8-. e-. f4 | g8-. e-. f-. d-. c-. c-. c4 |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} cM! a c@M d8 f@M! g,=,8 gM! |
{% endmacro %}

{% macro lh2(a) %}
  c=8 cM! g gM! c cM! a f@M! |
  g=,8 c@M! g8 gM! c= cM! {{ a }} |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Con moto"
  \clef treble
  \key c \major
  \time 4/4
  \meter 1/4 1,1,1,1
  {{ rh1("g''=''8-.\\mf") }}
  {{ rh1("g,='8-.") }}
  {{ rh2("c='8-.") }}
  {{ rh2("c'=''8-.") }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  \meter 1/4 1,1,1,1
  {{ lh1("c=8-\\stBass") }}
  {{ lh1("c=8") }}
  {{ lh2("cM4") }}
  {{ lh2("c+cM4") }}
}
{% endmacro %}
