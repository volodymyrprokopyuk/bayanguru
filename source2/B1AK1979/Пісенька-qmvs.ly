{% macro rh1(a) %}
  {{ a }} d bes bes | c( f,) bes='4-> |
{% endmacro %}

{% macro rh2(a) %}
  ees=''8 ees ees ees | d( bes) bes r |
  c=''8 c g( a) | bes d {{ a }} |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} cm! f, f7! | bes besM! f=, bes@M |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key bes \major
  \time 2/4
  {{ rh1("d''=''8\\mf") }}
  {{ rh1("d=''8") }}
  {{ rh2("bes='8 r") }}
  {{ rh2("bes='4->") }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key bes \major
  bes,=,8-\stBass besM! f bes@M | f8 f7! bes besM! |
  bes=,8 besM! f bes@M | a8 f@7! bes8 besM! |
  {{ lh1("c=8") }}
  c'=8 cM! f, f7! | bes besM! f bes@M |
  {{ lh1("c'=8") }}
  c'=8 cm! f, f7! | bes=, besM! bes+besM4-> |
}
{% endmacro %}
