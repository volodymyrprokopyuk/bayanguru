{% macro rh1() %}
  d=''4-- f-- | f8(-> e)-. e16( f e8)-. |
  e=''8(-> d)-. d16( e d=''8)-. |
{% endmacro %}

{% macro lh1(a, b) %}
  {{ a }} cM! g g7! | c cM! c cM |
  g=,8 g7! g g7 | c cM! {{ b }} |
{% endmacro %}

{% macro lh2(a) %}
  g=,8 g7! g g7 | c cM! c cM |
  g=,8 g7! g g7 | c cM! {{ a }} |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 2/4
  c''=''16(\mf d e8)-. d16( e f8)-. | g8-. g-. e4-- |
  f=''8-. f-. d4-- | e8-. e-. c4-- |
  c=''16( d e8)-. d16( e f8)-. | g8-. g-. e4-- |
  f=''8-. f16( e d8) e16( d | c8) e-. c='' r |

  {{ rh1() }} | d8(-> c)-. c16( d c8)-. |
  {{ rh1() }} | c-. e-. c='' r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  {{ lh1("c=8-\\stBass", "c= cM") }}
  {{ lh1("c=8", "c= r") }}

  {{ lh2("c=8 cM") }}
  {{ lh2("c=8 r") }}
}
{% endmacro %}
