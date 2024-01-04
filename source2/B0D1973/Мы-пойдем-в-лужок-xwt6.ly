{% macro rh1(a) %}
  a='8 g f e | {{ a }} f e d | c\) c g'\( c | a g f e | {{ a }} f e d | c='4\) %
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} fM! d' f@M | g,8 gM! g=, gM |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  \partial 4 { g'='8\(\p c | }
  {{ rh1("d='8") }} g'8\( c |
  {{ rh1("g='8") }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  \partial 4 { r4 | }
  {{ lh1("f,=,8-\\stBass") }} c cM! e c@M |
  \rep 2 { {{ lh1("f,=,8") }} c cM! e c@M | }
  {{ lh1("f,=,8") }} c+cM!4 %
}
{% endmacro %}
