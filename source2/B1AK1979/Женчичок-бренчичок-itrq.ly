{% macro rh1(a) %}
  {{ a }} d-. d-. | d16( c b a g8) | c16( d e4) | e8( d=''4) |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 3/8
  {{ rh1("d''=''8-.\\mf") }}
  {{ rh1("d=''8-.") }}
  c=''16(\mp b a8) a-. | b16(\< a g8) g-. |
  c=''16( b a8) a-. | b16( a g8) \af 8\! g-. |
  \duo { c''=''8(\f b c | d4\>^\tRit \af 8\! c=''8) \barFermata | }
  { g'='4 r8 | g='4 r8 | }
  b='16(\mf^\tATem c b8) a-. | g-. g='-. r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  g,=,8(-\stBass gM!) gM | b[( g@M!) gM8] |
  c=8[( g@M!) gM8] | g( gM!) gM |
  g=,8( gM!) gM | d'[( d7!) g@M!] |
  fis=8[( d@7!) d78] | g,( gM!) gM |
  a=,8[( d@7!) d78] | g( gM!) gM |
  fis'=8[( d@7!) d78] | g,=,( gM!) gM |
  e+c@M!4 r8 | a+c@M!4 r8 |
  d+d7!4 d+d78 | g+gM! g+gM r |
}
{% endmacro %}
