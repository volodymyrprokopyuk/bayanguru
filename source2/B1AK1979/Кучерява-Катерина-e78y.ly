{% macro rh1(a, b, c) %}
  {{ a }} d e f g8)-. g-. | a16( g a8) g-. {{ b }} |
  {{ c }} e f8) e16( d e8) | d16( c d8) c-. c='-. |
{% endmacro %}

{% macro rh2(a) %}
  {{ a }} d e8) d16( c d8) | e16( d e8) f-. f-. | e16( d e8) d16( c d8) |
{% endmacro %}

{% macro lh1() %}
  c=8 cM! g gM! | c cM! f= fM! |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 2/4
  {{ rh1("c'='16(\\f", "g='-.", "f='16(") }}
  {{ rh1("c='16(", "c=''-.", "f,='16(") }}
  {{ rh2("e='16(\\p") }}
  c='8-. c'-.\< c16( b \af 8\! c8) |
  {{ rh2("e=''16(\\mf") }}
  c=''8-. c-. c-. c=''-. \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  c=8-\stBass cM! c cM | f fM! c cM! |
  \rep 2 { g=,8 g7! c= cM! | }
  c=8 cM! e c@M | f8 fM! e c@M! |
  f=8 fM! g, c@M! | g8 g7! c cM! |
  {{ lh1() }}
  c=8 cM! g gM! | c cM! e c@M |
  {{ lh1() }}
  g,=,8 c@M! g8 g7! | c cM! c= cM |
}
{% endmacro %}
