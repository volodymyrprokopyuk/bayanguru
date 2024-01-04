{% macro rh1() %}
  a='8\( a a a | a c b a | gis b e gis,=' |
{% endmacro %}

{% macro lh1(a) %}
  a,=,4 am! | {{ a }} eM! | a+am! g+gM! |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Con moto"
  \clef treble
  \key a \minor
  \time 2/4
  a'='8\(\mf a a a | a c b a |
  gis='8 gis gis gis | gis b a gis\) |
  {{ rh1() }} | a4 b='\) |

  \repeat volta 2 {
    c=''8\( c c c | c e d c |
    b='8 b b b | b d c b\) |
    {{ rh1() }}
    \alternative {
      \volta 1 { a='4 b='\) | }
      \volta 2 { \hSpace a='4 \sSlur bu #'() ( r) \bar "|." }
    }
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \minor
  a,=,4-\stBass am! | a am | e' eM! | e eM |
  {{ lh1("a=,4 am | e'") }}

  c=4 cM! | c cM | g gM! | e' eM! |
  {{ lh1("d=4 dm! | e") }} | a,=, am! |
}
{% endmacro %}
