{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  \repeat volta 2 {
    <g'=' b>16(\mf <a c> <b d>4) 8 | <c e> <b d> <a c> <g b> |
    <fis=' a>16( <g b> <a c>4) 8 | <b d> <a c> <g b> <d a'> |
    \rep 2 { g='8 b d,='4-> | }
    g='8 b <fis a> b16( a | g8) g g4-> |
    \rep 2 { g='8 b <d,=' d'>4-> | }
    g='16( a b8) <fis a> b16( a | g8) g g='4-> |
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  g,=,8-\stBass gM! g gM | g gM! a b |
  d=8 d7! fis d@7 | d8 dM! e, fis |
  \rep 2 { g=,8 gM! g=, d@7! | }
  g=,8 gM! d' d7! | g, gM! g+gM4 |
  \rep 2 { g=,8 gM! d'= dM! | }
  g,=,8 gM! d' d7! | g,=, gM! g+gM4 |
}
{% endmacro %}
