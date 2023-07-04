{% macro rh1() %}
  bes='8-. bes-. bes-. g-. | a-. a-. a-. f-. |
  g='8-. g-. c,-. e='-. |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 2/4
  \repeat volta 2 {
    c'='8-.\mf c-. d-. e-. | f4 f |
    c='8-. c-. d-. e-. | f4 a |
    {{ rh1() }} | f-. a-. c4 |
    {{ rh1() }} | f4 f=' |
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key f \major
  c=4-\stBass c7! | f fM! | c c7! | f fM! |
  bes@M!8[ besM8 besM] r | f@M![ fM8 fM] r |
  c@7!8[ c78 c7] r | f@M![ fM8] fM4 |
  g,=,4 gm! | c f@M! | c4 c7! | f= fM! |
}
{% endmacro %}
