{% macro rh1(a) %}
  {{ a }} g' f e | d e c c\) | d\( f e c | d g %
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Lento
  \clef treble
  \key c \major
  \time 2/4
  \repeat volta 2 {
    {{ rh1("c''=''8\\(\\p") }} g4\) |
    {{ rh1("c,=''8\\(") }} c,=''4\) |
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  e=8-\stBass c@M! c8 cM | g gM! c cM! |
  b=,8 g@M! c8 cM! | b g@M! g8 gM |
  e'=8 c@M! c8 cM | g gM! a am! |
  d=8 dm! g, c@M! | g=,8 gM! c+cM!4 |
}
{% endmacro %}
