{% macro rightHand() %}
\relative {
  \tempo "Con moto"
  \clef treble
  \key g \major
  \time 2/4
  \repeat volta 2 {
    d''=''8[-.\mp e-. d-. b]-. | d-. d-. d4 | g, b |
    d=''8[-. e-. d-. c]-. | b-. b-. a4 | g4 g=' |
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  g,=,8-\stBass gM! g gM | g gM g gM | g gM g gM |
  g=,8 gM! c cM! | g gM! d' dM! | g, gM! g=, gM |
}
{% endmacro %}
