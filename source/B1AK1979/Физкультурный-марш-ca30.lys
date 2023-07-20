{% macro rh1(a) %}
  {{ a }} e16 d4 | d8. e16 d4 | <d b'>8 8 <e a> <e g> | <fis=' a>2 |
{% endmacro %}

{% macro rh2(a, b, c) %}
  {{ a }} 8 a g | <fis a>8 8 <d fis>4 | {{ b }} 8 <cis e a>8 8 | {{ c }} |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegro
  \clef treble
  \key d \major
  \time 2/4
  {{ rh1("d'='8.\\mf") }}
  {{ rh1("d='8.") }}
  {{ rh2("<g=' b>8\\f", "<b= d e>8", "<d=' fis>2") }}
  {{ rh2("<g=' b>8", "<d=' e>8", "d='2") }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key d \major
  d=4-\stBass dM! | d dM | g, a@M! fis4 d@M! |
  d'=4 dM! | d dM | g, a | d dM! |
  g,=,4 gM! | d' dM! | g, a | d dM! |
  g,=,4 gM! | a d@M! | g+gM!4 a+a7! | d= dM! |
}
{% endmacro %}
