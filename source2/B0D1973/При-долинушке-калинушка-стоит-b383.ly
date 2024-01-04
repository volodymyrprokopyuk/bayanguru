{% macro rh1(a) %}
  {{ a }} d-. e-. c-. | d( c d e | c4)
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} c@M!4 | d+dm!4 g+gM! | c+cM!
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Con moto"
  \clef treble
  \key c \major
  \time 2/4
  \meter 1/2 #'(1)
  \partial 4 { c''=''8-.\mp e-. | }
  {{ rh1("f=''8-.") }} c,8-. e-. |
  {{ rh1("f='8-.") }} g''8-. e-. |
  {{ rh1("f=''8-.") }} g8-. e-. |
  f='8-. d-. e-. c-. | d( c b d | c='4) \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  \partial 4 { r4 | }
  {{ lh1("f@M!4-\\stBass") }} r |
  {{ lh1("f@M!4") }} r |
  {{ lh1("f@M!4") }} r |
  {{ lh1("f@M!4") }}
}
{% endmacro %}
