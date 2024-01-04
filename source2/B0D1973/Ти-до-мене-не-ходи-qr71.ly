{% macro rh1(a, b) %}
  {{ a }} b c b d c b a | b8)-. b-. b4 |
  e=''8-. e-. e16( d c b=' |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} am! a am | a d@m! a8 d@m | gis8 e@M! e'=8 eM |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 2/4
  {{ rh1("a'='16(\\mf") }} | a4) a |
  {{ rh1("a='16(") }} | a4) b |
  \repeat volta 2 {
    c=''8-. c-. g4 | c8-. c-. g4 | c8 c( b a | gis4 e) |
    {{ rh1("a='16(") }}
    \alternative {
      \volta 1 { a='4) b=' | }
      \volta 2 { \hSpace a='4 \sSlur bu #'() ( a'='') \bar "|." }
    }
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \minor
  {{ lh1("a,=,8-\\stBass") }} | a, am! e' a@m |
  {{ lh1("a,=,8") }} | a+am!4 g+gM! |
  c=8 cM! cM4 | c8 cM cM4 |
  c=8 aM! d dm! | e r e7!4 |
  {{ lh1("a,=,8") }} | a+am!4 g+gM! | a,=, am! |
}
{% endmacro %}
