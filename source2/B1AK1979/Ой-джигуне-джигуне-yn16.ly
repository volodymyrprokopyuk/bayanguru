{% macro rh1(a) %}
  bes='8( g) g-. g-. | a( f) f4 |
  a='8( g f e | d4) {{ a }} |
{% endmacro %}

{% macro lh1(a) %}
  g,=,8( gm!) g gm | a( d@m!) a8 d@m |
  a=,8 a7! a a7 | d= dm! {{ a }} |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key d \minor
  \time 2/4
  d'='8\mf e f g | a a a4 | c8( bes a g | a4) a |
  {{ rh1("d'=''4->") }}
  {{ rh1("d='4") }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key d \minor
  d=8-\stBass dm! d dm | d dm d dm |
  d=8 g@m! d8 g@m | d8 dm! d dm |
  {{ lh1("d=8 dm") }}
  {{ lh1("d+dm4") }}
}
{% endmacro %}
