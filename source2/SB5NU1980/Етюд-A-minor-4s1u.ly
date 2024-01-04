{% macro rh1(a, b) %}
  {{ a }} e f a, d f | e {{ b }} a, c e d f, a d |
  c=''16 e, a c b e, gis b | a e fis gis=' %
{% endmacro %}

{% macro rh2() %}
  \rep 2 { f=''16-> aes, c f e g, c e='' | }
{% endmacro %}

{% macro rh3(a) %}
  \rep 2 { b='16 e, gis b c e, a c='' | }
  d=''16 f, a d dis f, a dis | e {{ a }} e, fis gis a b c d='' |
{% endmacro %}

{% macro rh4(a, b) %}
  e=''16 a, c e f a, d f | e a, c e d f, a d |
  c=''16 {{ a }} e, a c b e, gis {{ b }} b=' |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} am! d+dm! r | a=,8 am! d+dm! r | a am! e'= eM! | a+am! r r4 |
{% endmacro %}

{% macro lh2() %}
  g+gM!8 r c+cM! r | \rep 2 { f+fm!4(-> c+cM!8)-. r | }
{% endmacro %}

{% macro lh3() %}
  b+bM!8 r e+em! r | \rep 2 { a+am!4(-> e+em!8)-. r | }
{% endmacro %}

{% macro lh4() %}
  fis+b@7!8 r8 g+e@m! r8 | a+am!8 b+b7! e+em! r |
{% endmacro %}

{% macro lh5() %}
  \rep 2 { e=8 eM! a+am! r | } d c b4 | e8[ d c b=,] |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegro
  \clef treble
  \key a \minor
  \time 2/4
  {{ rh1("e''=''16\\mf a, c_\\aLeg", "") }} a b c d |
  {{ rh1("e=''16 a, c", "_\\dCre") }} a gis a ais |
  {{ rh3("\\f") }} {{ rh4("\\>", "\\af 16\\!") }}
  a='16\< e fis gis a b c \af 16\! cis='' |

  d=''16\p g, b d e g, c e | {{ rh2() }}
  d=''16 fis, a d c f, aes c | b g b d e g, c e |
  {{ rh2() }} | d=''16 c b d c d e f |
  fis=''16_\dCre b, dis fis g b, e g |
  \rep 2 { a=''16-> c, e a g b, e g='' | }
  fis=''16 ais, cis fis e a, c e | dis b dis fis g b, e g |
  a=''16-> c, e a g b, e g | a-> e c e g e b e |
  fis=''16 e dis fis e b e g | b c b c b g fis e |
  fis=''16 e dis fis e b, e g | b_\dDim c b c b g fis e |
  fis='16 e dis fis e b e g | b b cis dis e b e g |
  b=''16 b cis dis e b g fis | e e, g b e fis, a c |
  e=''16^\tRit g, ais cis e gis, b d='' |

  {{ rh1("e=''16\\mf^\\tATem a, c", "") }} a b c d |
  {{ rh1("e=''16 a, c", "") }} a gis a ais |
  {{ rh3("") }} {{ rh4("", "") }} | a='16 b c e a=''8 r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \minor
  {{ lh1("a,=,8-\\stBass") }} {{ lh1("a,=,8") }}
  {{ lh5() }} {{ lh1("a=,8") }}

  {{ lh2() }} | d+dM!8 r f+fm! r |
  {{ lh2() }} | d+dM!8 g+g7! c+cM! r |
  {{ lh3() }} | fis+fisM!8 r a+am! r |
  {{ lh3() }} | b+bM!8 r e+em! r |
  {{ lh4() }} {{ lh4() }}
  \rep 2 { b+b7!8 r e+em! r | } R2 | R2 |

  {{ lh1("a,=,8") }} {{ lh1("a,=,8") }} {{ lh5() }}
  a=,8 am! d+dm! r | a am! d+dm! r |
  a=,8 am! e' eM! | a, e' a+am! r |
}
{% endmacro %}
