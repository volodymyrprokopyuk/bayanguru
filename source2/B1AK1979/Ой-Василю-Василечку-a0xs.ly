{% macro rh1(a) %}
  {{ a }} c d d | c c a a |
  bes='8 bes( a4) | g8 g( f='4) |
{% endmacro %}

{% macro lh1(a, b) %}
  {{ a }} fM! bes besM! | a f@M! f8 fM |
  bes=,8 besM! {{ b }} c7! f,=, fM! |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegro
  \clef treble
  \key f \major
  \time 2/4
  {{ rh1("c''=''8\\mf") }}
  {{ rh1("c'=''8") }}
  g='8\p g g( bes | a4 f) |
  g='8 g g( bes | a4 f) |
  c'=''8\mf c d d | c c a a |
  bes='8( bes a g | f4 f='8) r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key f \major
  {{ lh1("f,=,8-\\stBass", "f fM! | c'") }}
  {{ lh1("f=,8", "c f@M! | c8") }}
  \rep 2 { c'=8 c7! e c@7 | f,8 fM! a=, f@M | }
  f=,8 fM! bes besM! | a f@M! f8 fM |
  c'=8 c7! e c@7 | f,8 fM! f=, r |
}
{% endmacro %}
