{% macro lh1(a) %}
  {{ a }} gM! b g@M | c4 cM! g=, gM! |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key g \major
  \time 4/4
  g'='2\(\mf d'2 | e4 d8 c b4\) r |
  g='2\( d'4 g | e4 d8 c b4\) r |
  c=''4( c b b) | a( b8 c d4) r |
  c=''4( c b b) | c( b8^\tRit a g='4) r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  {{ lh1("g,=,4-\\stBass") }}
  {{ lh1("g=,4") }}
  \rep 3 { d'=4 dM! g,=, gM! | } d' d7! g,=, gM! |
}
{% endmacro %}
