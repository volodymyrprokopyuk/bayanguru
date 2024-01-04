{% macro rh1(a) %}
  {{ a }} f8 e | d4 e8 d | c4 b | a=2\) |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Adagio
  \clef treble
  \key a \minor
  \time 2/4
  {{ rh1("e'='4\\(\\p") }} {{ rh1("e'='4\\(") }}
  c='4( d | e2) | g4( f | e2) | e4(\p f8 e) | d4( e8 d) | c4( b | a=2) \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \minor
  a,=,4-\stBass am! | d dm! | e e7! | a, am! | c a@m! | d4 dm! | e e7! | a, am! |
  g=,4 gM! | c cM! | b g@7! | c4 cM! | a am! | e' e7! | gis, e@7! a=,4( am! ) |
}
{% endmacro %}
