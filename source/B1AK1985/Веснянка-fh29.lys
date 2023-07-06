{% macro lh1(a, b) %}
  {{ a }} cM! cM | f, fM! {{ b }} | g g7! g7 | c= cM! cM |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key c \major
  \time 3/4
  c'='8\mf e g4 c | b8 a a2 | f8 e d4 a' | a g2 |
  c,='8 e g4 c | b8 a a4 g | f8 e d4 e | c c='2 \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  {{ lh1("c=4-\\stBass", "fM") }}
  {{ lh1("c=4", "c@M!") }}
}
{% endmacro %}
