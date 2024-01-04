{% macro rh1(a) %}
  {{ a }} g'8( f) | e-. c-. c=''4 |
{% endmacro %}

{% macro rh2(a) %}
  a='8 a d( c) | b-. g-. {{ a }} |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} gM! b g@M | c8 cM! e= c@M |
{% endmacro %}

{% macro lh2(a) %}
  d=8 dM! fis d@M | g,=,8 gM! {{ a }} |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Con moto"
  \clef treble
  \key c \major
  \time 2/4
  \repeat volta 2 {
    {{ rh1("g'='4\\mf") }}
    {{ rh1("g='4") }}
    {{ rh2("g='4") }}
    {{ rh2("g='8 r") }}
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  {{ lh1("g,=,8-\\stBass") }}
  {{ lh1("g,=,8") }}
  {{ lh2("b=,8 g@M") }}
  {{ lh2("g+gM r") }}
}
{% endmacro %}
