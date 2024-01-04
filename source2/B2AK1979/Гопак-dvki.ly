{% macro rh1(a) %}
  {{ a }} b' b16( a g8) | g-. b-. <b=' d>4-> |
{% endmacro %}

{% macro rh2(a) %}
  {{ a }} <g b d>16-. 8-. 8-. | <g b e>8-. 8-. <fis=' b d>4 |
{% endmacro %}

{% macro rh3(a) %}
  {{ a }} b'16( a8) g | r8 <fis a>[ r <fis b>] |
  <e=' c'>8. b'16( a8) g=' |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} b-. c-. e-. | fis-> d-. b-> d-. |
  a=,8-. b-. c-. e=-. |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegro
  \clef treble
  \key g \major
  \time 2/4
  {{ rh1("d'='8\\mf") }}
  {{ rh1("d,='8") }}
  {{ rh2("<g=' b g'>8.->\\f") }}
  {{ rh2("<g=' b g'>8.->") }}

  {{ rh3("<e=' c'>8.\\mf") }} | r8 <d a'> <d b'>4 |
  {{ rh3("<e=' c'>8.\\f") }} | r8 <d fis a> <b= d g>4 \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  g,=,8-\stBass gM! g gM | g gM g gM |
  g=,8 gM! g gM | g gM g gM |
  \rep 2 { g=,8.[-> gM!16 gM8 gM] | e-. g-. b=,4-. | }

  {{ lh1("a=,8-.-\\puBass") }} | fis( d@M!) g,8( gM!) |
  {{ lh1("a=,8-.") }} | d= dM! g+gM!4 |
}
{% endmacro %}
