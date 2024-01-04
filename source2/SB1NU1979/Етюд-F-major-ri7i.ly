{% macro rh1(a) %}
  {{ a }} c g c f, c' | e,2.) | bes'8( c a c g c | f,='2.) |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} fM! fM | g c@7! c74 | e' c@7! c74 | f, fM! fM |
  d'=4 dm! dm | c f@M! fM4 | c= c7! c7 |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 3/4
  {{ rh1("a'='8(\\f") }}
  d'=''8( a f g a bes | c4) c c | bes( a g | a2 f4) |
  {{ rh1("a='8(") }}
  f='8( e f g a f) | c( d e f g a) | bes4( a g | f='2.) \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key f \major
  {{ lh1("f,=,4-\\stBass") }} | f,=,4 fM! fM |
  {{ lh1("f=,4") }} | f+fM!2. |
}
{% endmacro %}
