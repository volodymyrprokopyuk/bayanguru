{% macro rh1(a) %}
  e='8-. g-. d-. d-. | e-. e-. f4 |
  e='8-. g-. d-. d-. | c4 {{ a }} |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  c'='8-.\mf c-. e-. f-. | g4 g |
  a='8-. a-. a-. a-. | g4 g4 |
  {{ rh1("g'='4") }}
  {{ rh1("c='4") }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  c=4-\stBass cM! | c cM | f, fM! | c' cM! |
  c=8 cM! b g@M! | c8 cM! f, fM! |
  c'=8 cM! g gM! | c4 g+gM! |
  c=8 cM! b g@M! | c8 cM! d dm! |
  g,=,8 c@M! g8 gM! | c=4 cM! |
}
{% endmacro %}
