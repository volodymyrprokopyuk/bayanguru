{% macro lh1(a) %}
  c=2.( d8 e | f4 e d c'8 bes=) |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Andante
  \clef treble
  \key d \minor
  \time 4/4
  d'='4.(\p f8 g f e d | a'4. d8 a g f e) | d4.( f8 g f e d | a'4 d a2) |
  g='4.( bes8 d4 c8 bes | a4. a8 f'4 e8 d) | e4.( cis8 a g f e | d2 d=') |
  \duo {
    g'='4.(_~ <g bes>8 <bes d>4 <a c>8 <bes g> | a4. a8 f'4 e8 d) |
    e=''4.( cis8 a g f e | d2 d=') \bar "|."
  } { s1 | f'='4 e d e8 f | g4. r8 cis,4. r8 | d2 d=' | }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key d \minor
  R1 | R1 | d'='4(-\frBass c bes2 | a4 g f e8 d) |
  {{ lh1() }} | a2(~ a8 bes b cis | d4 bes a8 g f d) |
  {{ lh1() }} | \duo { \stemDown a=2(~ a8 bes b cis | d='1) | }
  { s1 | r4 bes=4 <d,= a'>2 | }
}
{% endmacro %}
