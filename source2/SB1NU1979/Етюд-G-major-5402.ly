{% macro rh1(a) %}
  {{ a }} c-. a-. | d-. b-. g-. | a-. fis-. d='-. |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} r8 | g+gM!4 r8 | d+d7!4 r8 | g+gM!4 r8 |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Vivo
  \clef treble
  \key g \major
  \time 3/8
  {{ rh1("e''=''8-.\\f") }} | g-. b-. d-. |
  {{ rh1("e=''8-.") }} | g4 r8 |
  a='8(\p\< fis d | g b \af 8\! d) |
  r8 d=''8(\> c | b a \af 8\! g) |
  e'=''8-.\mf c-. a-. | d-.\> b-. g-. |
  a='8-. fis-. d-. | \af 4\! g='4 r8 \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  {{ lh1("fis+d@7!4-\\stBass") }} {{ lh1("fis+d@7!4") }}
  d+d7!4.( | g+gM!8) r r | a,=,8[ d@7! d78] |
  g=,8 gM! gM | {{ lh1("fis+d@7!4") }}
}
{% endmacro %}
