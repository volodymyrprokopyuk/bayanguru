{% macro rh1(a) %}
  {{ a }} g a8) a-. a-. | g16( a b8) b4-> |
  a='8[-. cis-. e-. cis]-. | d-. d16( e fis8)-. d-. |
  fis,='16( g a8) a-. a-. | g16( a b8) b4-> |
  a='8[-. cis-. e-. cis]-. | d-. fis-. d=''4-> |
{% endmacro %}

{% macro rh2(a) %}
  {{ a }} e-. d-. d]-. | cis16( d e8) a, cis | b16( cis d8) gis, b=' |
{% endmacro %}

{% macro lh1(a, b) %}
  {{ a }} dM! d dM | g,[ gM! gM gM] | a a7! a a7 | d[ dM! dM dM] |
  d=8 dM! d dM | g,[ gM! gM gM] | a a7! a a7 | d dM! {{ b }} |
{% endmacro %}

{% macro lh2() %}
  a=,8 aM! e' e7! | a,[ aM! aM aM] | gis e@7! e'=8 e7 |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key d \major
  \time 2/4
  {{ rh1("fis'='16(\\mf") }}

  {{ rh2("e=''8[-.\\mp") }} | a a16( cis e4) |
  {{ rh2("e=''8[-.") }} | a-.\< r \af 4\! a='4-> |

  {{ rh1("fis='16(\\f") }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key d \major
  {{ lh1("d=8-\\stBass", "dM4") }}

  {{ lh2() }} | a,[ aM! aM aM] |
  {{ lh2() }} | a,[ g fis e=,] |

  {{ lh1("d'=8", "d+dM4") }}
}
{% endmacro %}
