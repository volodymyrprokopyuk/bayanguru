{% macro rh1(a) %}
  {{ a }} b8. d,16 | g4 d | \tuplet 3/2 { g='4( a8) } %
  \tuplet 3/2 { b='8( a g) } | <fis a>4 <d=' d'> |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} d+g@M4 | g+gM!4 d+d7! | g+gM! b+g@M | d+dM!4 d+dM |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Tempo di marcia"
  \clef treble
  \key g \major
  \time 2/4
  {{ rh1("g'='4\\f") }}
  a'='4 <e g b>8. c'16 | <d, g d'>4. <e a c>8 |
  <d=' g b>4 <cis e a>8. g'16 | <fis a>4 d=' |

  {{ rh1("g='4") }}
  <e=' g e'>4 \duo { \tuplet 3/2 { c''=''8( b a=') } | } { <e'=' g>4 | }
  <d=' g b>4 <d g d'>8. 16 | <e g a>4 <c fis b>8. 16 | <b= d g>2 \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  {{ lh1("g+gM!4-\\stBass") }} a+am!4 c= | b  c | d a=, | d+d7! d+d7 |

  {{ lh1("g+gM!4") }} c=4 a | d b | c d | g+gM! g,=, |
}
{% endmacro %}
