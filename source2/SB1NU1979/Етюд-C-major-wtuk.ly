{% macro rh1(a) %}
  {{ a }} c8 d e f | g4)-. d-. e-. | c( c8 d e f | g4)-. d-. e-. |
  c=''4 e8( d c b=' |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} r r | g+g7! r r | c+cM!4 r r | g+g7! r r | c+cM!4 r r | f+d@m! r4 r |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key c \major
  \time 3/4
  {{ rh1("c''=''4(\\mf") }} | a4)-. b-. c-. |
  d=''4 d8( c b a | g4)-. e'-. d-. |
  {{ rh1("c=''4(") }} | a4) f'8( e d c |
  b='4) g'8( f e d | c=''4)-- r r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  {{ lh1("c+cM!4-\\stBass") }} | fis+d@M! r4 r | g+gM! r r |
  {{ lh1("c+cM!4") }} | g+g7! r r | c+cM!4 r r |
}
{% endmacro %}
