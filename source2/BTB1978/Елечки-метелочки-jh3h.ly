{% macro rh1(a, b) %}
  \repeat volta 2 {
    {{ a }} <g b>8. <fis a>16 | {{ b }} <b d>8 <a c> |
    <g=' b>8 8 8 <fis a> |
    \alternative {
      \volta 1 { <a=' c>8 <g b> e16 fis g a=' | }
      \volta 2 { <a=' c>8 <g b> e='4 | }
    }
  }
{% endmacro %}

{% macro lh1(a, b) %}
  {{ a }} em! a, am! | e' em! e em | b b7! e em! | b b7! {{ b }} |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Sostenuto
  \clef treble
  \key e \minor
  \time 2/4
  {{ rh1("<g'=' b>4\\mf", "<g=' b>16 e g b") }} \bar "||"
  {{ rh1("<g=' b>4", "<g=' b>16 e <g b>8") }} \bar "||"
  {{ rh1("<g=' b>8 16 e16", "<g=' b>16 e <g b>8") }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key e \minor
  {{ lh1("e=8-\\stBass em! b b7! | e", "e= em!") }}
  {{ lh1("e=8 em! b b7! | e", "e= em!") }}
  {{ lh1("e=8 em! a, am! | e'", "e+em!4") }}
}
{% endmacro %}
