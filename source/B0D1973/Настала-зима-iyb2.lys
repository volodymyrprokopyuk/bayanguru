{% macro rh1() %}
  d='4.\( e8 f4 d | g8 f e d c4 c='\) |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} dm! a aM! d dm! d dm | g, gM! g=, gM %
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderator
  \clef treble
  \key c \major
  \time 4/4
  \repeat volta 2 {
    g'='8-.\mf g-. g-. a-. g4( e) | f8-. f-. e-. d-. e4( c=') |
  }
  {{ rh1() }} {{ rh1() }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  \meter 1/4 1,1,1,1
  c=8-\stBass cM! g c@M c8 cM g g@M | b8 g@M! g8 gM c cM! g c@M |
  {{ lh1("d'=8") }} a am! a am |
  {{ lh1("d=8") }} c cM! c=4 |
}
{% endmacro %}
