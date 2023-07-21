{% macro rh1() %}
  c=''8 c a4 | b8 b4 g8 | a a fis d=' |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegro
  \clef treble
  \key g \major
  \time 2/4
  \meter 1/2 #'(1)
  d'='8\mf d e fis | g4 b | a8 b c c | b4 d |
  {{ rh1() }} | g b d4 | {{ rh1() }} | g4 g=' \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  d=4-\stBass d7! | g, gM! | a d@7! | g4 gM! |
  e'=4 c@M! | d4 g@M! | d4 d7! | g, gM! |
  a=,4 am! | d g@M! | d4 d7! | g,=, gM! |
}
{% endmacro %}
