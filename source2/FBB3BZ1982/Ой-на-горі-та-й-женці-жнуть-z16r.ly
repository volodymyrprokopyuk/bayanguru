{% macro rh1(a) %}
  {{ a }} a | c8 bes a g | f g a4 | d,='2\) |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} a | c8 bes a g | f g a4 | d,=2\) |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key d \minor
  \time 2/4
  \meter 1/2 #'(1)
  {{ rh1("d''=''4\\(\\mf") }} {{ rh1("d'=''4\\(") }}
  f='8 f f a | c4 f8( ees | d) d d d | c( bes a g |
  f='8 g a4 | <d, d'>2) | <f d'>2\f |
  \duo {
    c''=''8( bes a bes | c2) | c4 d | c8( bes a g | f g a4 | d=''2) \bar "|."
  } {
    f'='2~ | f | f4 f | f8 r c r | a c~ c cis | d=' 2 |
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key d \minor
  \meter 1/2 #'(1)
  R2 | {{ lh1("d'='4\\(-\\frBass") }} {{ lh1("d'='4\\(") }}
  f=8 f f a | bes4. bes8 | a( g f e | d e f4 | d2) |
  bes'=2 | a8( g f g | a2) | a4 bes | a8( g f e | d e f a | d,=2) |
}
{% endmacro %}
