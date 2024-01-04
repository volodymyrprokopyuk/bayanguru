{% macro t2(a, b) %}
  \tuplet 3/2 { {{ a }} } \tuplet 3/2 { {{ b }} } |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 2/4
  {{ t2("b'='8(-\\mf a) g", "g a b") }} {{ t2("c( fis,) fis", "fis g a") }}
  {{ t2("a='8( fis) fis", "fis g a") }} {{ t2("b( e,) e", "e g b") }}
  {{ t2("d=''8(_\\dCre c) b", "b c d") }} {{ t2("e( a,) a", "a b c") }}
  {{ t2("c=''8( a) a", "a b c") }} {{ t2("d( g,) g", "g a b") }}
  {{ t2("c=''8( fis,) fis", "fis g a") }} {{ t2("b( e,) e", "e fis g") }}
  {{ t2("fis='8 ais cis", "e_\\dDim dis e") }}
  {{ t2("fis=''8( b,) b", "b\\>^\\tRit c \\af 8\\! cis=''") }}

  {{ t2("d=''8(\\p^\\tATem c) b", "b c d") }} {{ t2("e( a,) a", "a b c") }}
  {{ t2("c=''8(_\\dCre a) a", "a b c") }} {{ t2("d( g,) g", "g a b") }}
  {{ t2("c=''8(-> fis,) fis", "fis g a") }} {{ t2("b(-> e,) e", "e fis g") }}
  {{ t2("fis='8-> ais cis", "b-> dis fis") }}
  \tuplet 3/2 { e=''8-> g b } e='''4\sf \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key e \minor
  e=8-\stBass r em! r | a, r am! r | b r b7! r | e r em! r |
  e=8 r e7! r | a, r am! r | d r d7! r | g, r gM! r |
  a=,8 r am! r | e' r em! r | fis,=, r fis7! r | b+bM! r r4 |

  g=,8 r gM! r | a r am! r | d r d7! r | g, r gM! r |
  a+am!8 r r4 | e+em!8 r r4 | fis+fis7!8 r b+b7! r | e+em! r e'=4 |
}
{% endmacro %}
