{% macro rh1(a) %}
  {{ a }} cis16 d e d cis d) a( d cis d e d cis d) |
  a='16( e' dis e fis e dis e) a8( g16 fis e d cis b=') |
{% endmacro %}

{% macro rh2(a) %}
  {{ rh1(a) }} | \rep 2 {  a='16( d cis d e d cis d='') } |
  cis=''16( e d cis b d cis b=' %
{% endmacro %}

{% macro rh3(a) %}
  cis=''8-. a'-. a,-. e'-. d-. {{ a }} gis16( a b a gis a |
  e=''8)-. gis16( a b a gis a fis8)-. d'-. d,-. fis=''-. |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} r dM! r d r dM r | cis r a@7! r8 cis= r a@7 r8 |
{% endmacro %}

{% macro lh2(a) %}
  {{ lh1(a) }}
  d=8 r dM! r d r dM r | e+a@M! r8 e+e7!4(-> a@M!8) r8 r4 |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Allegro moderato"
  \clef treble
  \key d \major
  \time 4/4
  {{ rh2("d''=''8(\\mf") }} a b cis d e fis g e) |
  {{ rh2("d=''8(") }} a8) a16( b cis d e fis='') |

  g=''8 g16( fis g b a g) fis( g fis e fis a g fis) |
  e=''16( fis e dis e g fis e d8)-. a-. fis'-. d-. |
  g=''8 g16( fis g b a g) fis( g fis e fis a g fis |
  e=''8)-. a-. b,-. e-. a,16(\< b cis d e fis g \af 16\! e='') |

  {{ rh1("d=''8(\\f") }}
  a='16( d cis d e d cis d) b( e dis e fis e dis e) |
  {{ rh3("\\mf") }} {{ rh3("\\f") }}
  e=''8-. a-. a,-. e'-. d-. a'( fis d |
  a='8) fis'( d a fis) d'( a fis | d) fis( d a d,=4) r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key d \major
  {{ lh2("d=8-\\stBass") }} {{ lh2("d=8") }}

  a@M!8 r8 a@M r8 d@M! r8 r4 | a+a7!8 r a+a7 r d+dM! r r4 |
  a@M!8 r8 a@M r8 d@M! r8 r4 | e+a@M!8 r8 e+e7! r a@M! r8 r4 |

  {{ lh1("d=8") }}
  d=8 r dM! r g, r e@m! r8 | a+a7!8 r a+a7 r d@M! r8 a4 |
  \rep 3 { a@7!8 r8 a=,4 d@M!8 r8 a=,4 | }
  a@7!8 r8 a=,4 d@M!8 r8 r4 | a'8 r r4 fis8 r r4 | d8 r r4 d=4 r |
}
{% endmacro %}
