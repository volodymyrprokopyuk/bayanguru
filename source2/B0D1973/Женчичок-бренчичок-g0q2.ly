{% macro rh1(a) %}
  {{ a }} c c | c8 bes a g f4\) | bes8( c d2) | d4( c=''2) |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} fM! fm | f fM fM | f bes@M! besM4 | f= fM! fM |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 3/4
  {{ rh1("c''=''4\\(\\p") }}
  {{ rh1("c=''4\\(") }}
  bes='8( a g4)-. g-. | a8( g f4)-. f-. |
  bes='8( a g4)-. g-. | a8( g f2) |
  bes='4\( a bes | c2 bes4\) |
  a='8( bes a4)-. g-. | f4-. f='-. r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key f \major
  {{ lh1("f=4-\\stBass") }}
  {{ lh1("f=4") }}
  \rep 2 { c=4 c7! c7 | f= fM! fm | }
  d=4 bes@M! besM4 | g, bes@M! besM4 |
  c=4 c7! c7 | f= fM! r |
}
{% endmacro %}
