{% macro rh1() %}
  c=''8-. d-. e-. c-. | b-. b-. a4 | g8-. g-. g='4 |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} gM! fis d@M! | g8 gM! d' dM! | g, gM! c cM! |
  c=8 cM! a c@M | d8 g@M! d8 dM! | g,=, gM! gM4 |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  g'='8-.\mf b-. d-. c-. | b-. b-. a4 | b8-. g-. c4 | {{ rh1() }}
  \repeat volta 2 {
    g'=''8-. g-. d-. c-. | b-. b-. a4 | b8-. g-. c4 | {{ rh1() }}
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  {{ lh1("g,=,8-\\stBass") }}
  {{ lh1("g=,8") }}
}
{% endmacro %}
