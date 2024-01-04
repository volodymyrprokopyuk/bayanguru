{% macro rh1(a) %}
  {{ a }} c | e8-. g-. e4 |
  d=''8( g)-. g-. f-. | e-. d-. c=''4 |
{% endmacro %}

{% macro rh2(a) %}
  {{ a }} a)-. e-. a-. | gis4(-> e8) r |
  | b'( d)-. c-. b-. |
{% endmacro %}

{% macro lh1(a, b) %}
  {{ a }} r | c+cM!8 r c+cM4 |
  {{ b }} g@M! g8 gM | a-. b-. c=4 |
{% endmacro %}

{% macro lh2(a, b) %}
  {{ a }} am! a am | b e@7! e8 e7 |
  gis,=,8 e@7! e'8 e7 | a,=, am! {{ b }} |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  \repeat volta 2 { {{ rh1("g'='4\\mf") }} }
  {{ rh2("e,='8(\\p") }} | c( d e4) |
  {{ rh2("e=''8(") }} | a4( a,8) r |
  \repeat volta 2 { {{ rh1("g='4\\mf") }} }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  {{ lh1("c+cM!4-\\stBass", "b,=,8") }}
  {{ lh2("a=,8", "e'= a@m") }}
  {{ lh2("a,=,8", "a=, r") }}
  {{ lh1("c+cM!4", "b=,8") }}
}
{% endmacro %}
