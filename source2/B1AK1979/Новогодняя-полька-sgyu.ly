{% macro rh1(a) %}
  {{ a }} b a8) cis16( b \af 8\! a8) | e'-.\> e-. \af 4\! e=''4-- |
{% endmacro %}

{% macro rh2(a) %}
  {{ a }} gis fis8) a16( gis fis8) | e-. cis-. cis=''4-- |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} aM! e' a@M | cis8 a@M! e8 a@M | a,8 aM! e'= a@M |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Con moto"
  \clef treble
  \key a \major
  \time 2/4
  {{ rh1("cis''=''16(\\mf\\<") }}
  cis=''16(\< b a8) cis16( b \af 8\! a8) |
  d=''8-.\> d-. \af 4\! d4-- |
  d=''16(\mf\< cis b8) d16( cis \af 8\! b8) |
  gis'=''8-.\f gis-. gis4-- |
  fis=''8-._\dDim fis-. fis4-- | e8-. e-. e=''4-- |

  {{ rh1("cis=''16(\\<") }}
  cis=''16(_\dCre b a8) cis16( b a8) | fis'-. fis-. e4-- |
  {{ rh2("a=''16(\\f") }}
  fis=''8-._\dDim b,-. b4-- | e8-. cis-. cis4-- |
  {{ rh2("a'=''16(\\f") }}
  fis=''8-. b,-. b( cis) | a='4 r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \major
  {{ lh1("a,=,8-\\stBass") }} | b8 e@7! e8 e7 |
  gis,=,8 e@7! e'8 e7 | b8 e@7! e8 e7 |
  d=8 e@M! e8 e7! | cis8 a@M! e=8 a@M |

  {{ lh1("a,=,8") }} | d8 dM! a aM! |
  d=8 b@7! b74 | e8 a@M! aM4 |
  e=8 e7! e74 | a,8 aM! aM4 |
  dis=8 b@7! b74 | e8 a@M! aM4 |
  e+eM!4 e+e7! | a+aM! a,=,-> |
}
{% endmacro %}
