{% macro rh1(a) %}
  {{ a }} d | a8-. c-. b-. a-. | g-. g-. g='4 |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  {{ rh1("b'='4\\mf") }}
  {{ rh1("b='4") }}
  e='4 a | d,8-. d-. b'-. a-. | g-. g-. g4 |
  e='8-. e-. a-. a-. | d,8-. d-. b'-. a-. | g8-. g-. g='4 \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  g,=,4-\stBass gM! | d' dM! | g, gM! |
  g+gM!4 b+g@M! | a+am!4 d+dM! | g gM! |
  a=,4 am! | d dM! | e em! | a, am! | d dM! | g,=, gM! |
}
{% endmacro %}
