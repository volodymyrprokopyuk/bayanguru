{% macro rh1() %}
  <d=' f>2 4 | 4 g a | <a c>2. | <g bes>2 <f a>4 |
  <e=' g>2 e4 | <f a>2 <e g>4 | d='2.~ |
{% endmacro %}

{% macro lh1() %}
  d=4 dm! dm | a d@m! dm4 | f f7! f7 | g gm! gm |
  bes=,4 g@m! gm4 | a a7! a7 | d= dm! dm |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Lento
  \clef treble
  \key d \minor
  \time 3/4
  d'='2\mp d4 | f2 d4 | g2. | d2 e4 |
  f='2 e4 | a2 g4 | d2.~ | d4 r r |
  d='2 a'4 | a2 f4 | g2. | d2 e4 |
  f='4 e f | a2 g4 | f2.~ | f2. |
  <a=' c>2 4 | 4 bes a | g2. | d2 d4 |
  <c=' e>2 <d f>4 | <e g> <d f> <e g> |
  <f=' a^~ >2.( | <e a>2) r4 |
  {{ rh1() }} | d2. |
  d='2 <bes' d>4 | 4 <a c> <bes d> |
  <a=' c>2. | <g bes>2 4 | 2 <a c>4 |
  <bes=' d>4 <a c> <g bes> |
  <f='( a^~ >2. | <e a>2.) |
  {{ rh1() }} | d4 r r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key d \minor
  d=4-\stBass dm! dm | c d@m! dm4 | bes g@m! gm4 | g gm! gm |
  a=,4 g@m! gm4 | a a7! a7 | d dm! dm | a a7! a7 |
  d=4 dm! dm | a d@m! dm4 | g gm! gm | c c7! c7 |
  f,=,4 fM! fM | c' c7! c7 | f, fM! fM | a f@M! fM4 |
  f=,4 fM! fM | fis d@7! d74 | g gm! gm | d' g@m! gm4 |
  c=4 c7! c7 | g c@7! c74 | f d@m! dm4 | a a7! a7 |
  {{ lh1() }} | a d@m! dm4 | d d7! d7 | fis, d@7! d74 |
  g=,4 gm! gm | d' g@m! gm4 | c c7! c7 | e c@7! c74 |
  f,=,4 d@m! dm4 | a=, a7! a7 | {{ lh1() }} | d+dm! r r |
}
{% endmacro %}
