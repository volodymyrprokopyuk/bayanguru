{% macro rh1(a, b) %}
  {{ a }} fis cis' | b cis fis,) |
  \duo { a'='4( {{ b }} a8 gis | fis4) <eis=' b' cis>2 | } { r4 d'='2 | s2. | }
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key fis \minor
  \time 3/4
  \meter 1/4 1,1,1
  {{ rh1("a'='4(\\p", "b") }} {{ rh1("a='4(", "<gis b>") }}
  a='4(\mp cis8 d <cis e>4) | b8( cis <b d>4 b) |
  a='8( a a b <a cis>4) | gis8( a <gis b>4 gis) |
  fis='4(\p fis8 gis a fis) | eis( fis gis4 cis,) |
  \duo { fis'='8( gis a4 <d,=' gis b>) | } { fis'='2 s4 | }
  <eis=' b' cis>4 <fis a cis fis>2 |
  a'=''4(\mp cis8 d <cis e>4) | b8( cis <b d>4 <gis b>) |
  <fis='' a>8( 8 8 b <a cis>4) |
  \duo { gis''=''8( a b4 gis) | fis( fis8 gis a fis='') | }
  { eis''=''2. | d=''\p | } eis8( fis <cis gis'>4 cis) |
  \duo { fis'='8( gis^\tRit a4 <d,=' gis b>) | } { fis'='2 s4 | }
  <eis,=' b' cis>4 \af 2\! <fis=' a cis fis>2--\> \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key fis \minor
  fis=2(-\frBass e4 | d cis fis) |
  \duo { r4( fis=2 | cis \stemDown dis8 eis) | } { b,=,2. | s2. | }
  fis=2(~ fis8 e | d4 cis8 b a4) | b2 b4 | cis2 cis4 |
  \duo {
    r4 <cis'=' e>4 4 | r <b d>4 4 | r <a cis>4 4 | r <gis b>4 4 | r <fis= a>2 |
  } { a=2. | e | fis | cis | d= | }
  cis=8( dis eis4 cis) | fis4.( e8 d[ b]) | cis4 fis=2 |
  \clef treble a'='2-- a8-. r | e-. r e-. r e-. r | fis2-- fis8-. r |
  cis='8-. r cis-. r cis-. r | d2-- d8-. r | cis( dis eis4 cis=') |
  \clef bass fis,=8( e d4 b) | cis fis=2-- |
}
{% endmacro %}
