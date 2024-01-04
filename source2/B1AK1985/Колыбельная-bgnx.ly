{% macro rh1() %}
  e,='4 c' e,2 | d4 b' d,2 | e4 a e fis | g2 g=' |
{% endmacro %}

{% macro lh1(a, b) %}
  {{ a }} am! a am | d g@M! e4 {{ b }} | a, am! d= d7! |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key g \major
  \time 4/4
  R1\p |
  \repeat volta 2 {
    b'='4. a8 g4 d | e g d2 | b'4. a8 g4 b | d b d2 |
    {{ rh1() }}
    e'=''4 e d b | a8( b a4) e e | e' e d8( c b4) | a2 a |
    e='4 c' e,2 | d4 b' d,2 | e4 fis g a | b2 d='' \fermata |
    {{ rh1() }}
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  g,=,4-\stBass gM! g gM |
  g=,4 gM! g gM | g c@M! g4 gM! |
  g=,4 gM! g gM | b bm! e eM! |
  {{ lh1("a,=,4", "eM!") }}
  g,=,4 c@M! g4 gM! | c cM! e e7! |
  \rep 2 { a,=,4 am! a=, e@7! | }
  a=,4 d@m! a4 am! |
  {{ lh1("a=,4", "eM!") }}
  g,=,4 gM! e@7!2-\fermata |
  {{ lh1("a=,4", "e7!") }}
  g,=,4 c@M! g=,4 gM! |
}
{% endmacro %}
