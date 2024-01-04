{% macro rh1(a) %}
  {{ a }} d ees d | ees f g4\) | aes8( g f=''4) |
{% endmacro %}

{% macro rh2(a) %}
  {{ a }} c,8\) c | c( d ees4) | f8( ees d=''4) |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} eesM! | ees eesM | bes bes7! | ees= eesM! |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegro
  \clef treble
  \key ees \major
  \time 2/4
  \repeat volta 2 {
    {{ rh1("ees''=''8\\(\\mf") }} | g8( f ees4) |
    {{ rh1("ees=''8\\(\\f") }} | ees=''2 |
  }

  \repeat volta 2 {
    {{ rh2("c'='''4\\(\\p") }} | ees8( d c4) |
    {{ rh2("c'='''4\\(") }} | c=''2 |
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key ees \major
  {{ lh1("ees=4-\\stBass") }}
  {{ lh1("ees=4") }}

  \rep 2 { c=4 cm! | c cm | g g7! | c= cm! | }
}
{% endmacro %}
