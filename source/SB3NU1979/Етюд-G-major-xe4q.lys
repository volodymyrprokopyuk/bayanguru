{% macro t4(a, b, c, d) %}
  \tuplet 3/2 { {{ a }} } \tuplet 3/2 { {{ b }} } %
  \tuplet 3/2 { {{ c }} } \tuplet 3/2 { {{ d }} } |
{% endmacro %}

{% macro t3(a, b, c, d) %}
  \tuplet 3/2 { {{ a }} } \tuplet 3/2 { {{ b }} } %
  \tuplet 3/2 { {{ c }} } {{ d }} |
{% endmacro %}

{% macro rh1(a) %}
  {{ t4(a, "b-. ais-. b-.", "c( d) c-.", "a-. gis-. a='-.") }}
{% endmacro %}

{% macro rh2(a) %}
  {{ t4(a, "b g' fis", "e c b", "c fis c=''") }}
{% endmacro %}

{% macro rh3(a) %}
  {{ t4(a, "b-. g'-. fis-.", "e( c) b-.", "c-. fis-. c=''-.") }}
{% endmacro %}

{% macro rh4(a) %}
  {{ t4(a, "b(-> ais) b-.", "c(-> d) c-.", "a(-> gis) a='-.") }}
{% endmacro %}

{% macro rh5(a) %}
  {{ t4(a, "b ais b", "c d c", "a gis a='") }}
{% endmacro %}

{% macro t1(a, b) %}
  \tuplet 3/2 { \set stemRightBeamCount = #2 {{ a }} %
  \set stemLeftBeamCount = #1 \set stemRightBeamCount = #1 r16 %
  \set stemLeftBeamCount = #2 {{ b }} }
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegro
  \clef treble
  \key g \major
  \time 2/4
  \meter 1/8 1,1,1,1
  \repeat volta 2 {
    {{ rh1("d''=''16(\\f e) d-.") }}
    {{ t4("b='16( c) b-.", "g-. fis-. g-.", "a( b) a-.", "fis-. e-. d-.") }}
    {{ rh1("d'=''16( e) d-.") }}
    {{ t3("b='16( c) b-.", "g-. fis-. g-.", "a( e) fis-.", "g='8") }}
  }

  {{ rh2("b='16\\(\\p ais_\\aDol b") }}
  {{ t4("b='16 ais b", "b a' b,", "g' b, fis'", "e d c\\)") }}
  {{ rh2("b='16\\( ais b") }}
  {{ t3("b='16 ais b", "b a' b,", "g' b, fis'", "e=''8\\)") }}

  {{ rh3("b='16( ais) b-.") }}
  {{ t4("b='16( ais) b-.", "b-. a'-. b,-.", "g'-. b,-. fis'-.", "e-. d-. c-.") }}
  {{ rh3("b='16( ais) b-.") }}
  {{ t3("b='16( ais) b-.", "b-. a'-. b,-.", "g'-. b,-. fis'-.", "e=''8") }}

  {{ rh4("d=''16(->\\f e) d-.") }}
  {{ t4("b='16(-> c) b-.", "g(-> fis) g-.", "a(-> b) a-.", "fis(-> e) d-.") }}
  {{ rh4("d'=''16(-> e) d-.") }}
  {{ t3("b='16(-> c) b-.", "g(-> fis) g-.", "a(-> e) fis-.", "g='8") }}

  {{ rh5("d'=''16\\(\\p e_\\dCre d") }}
  {{ t4("b='16 c b", "g fis g", "a b a", "fis e d\\)") }}
  {{ rh5("d'=''16\\( e d") }}
  {{ t3("b='16 c\\) b-.", "g-. fis-. g-.", "a(-> e) fis-.", "g='8->") }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  g+gM!8-\stBass e+em! a+am! d+d7! | \rep 2 { g+gM!8 e+em! a+am! d+d7! | }
  g+gM!8 e+em! {{ t1("a+am!16[", "d@7!]") }} g+gM!8 |

  \rep 2 {
    e=8 em! a, am! | b b7! e+em! r | e em! a, am! |
    b=,8 b7! {{ t1("e+em!16[", "b@7!]") }} e+em!8 |
  }

  \rep 2 {
    \rep 3 { g+gM!8 e+em! a+am! d+d7! | }
    g+gM!8 e+em! {{ t1("a+am!16[", "d+d7!]") }} g+gM!8 |
  }
}
{% endmacro %}
