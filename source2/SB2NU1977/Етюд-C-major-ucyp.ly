{% macro rh1(a) %}
  {{ a }} e g e f a g e | f d e c d b c=''8\) |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} r8 f+fM! e | d c@M! g+gM!8 c+cM! |
{% endmacro %}

{% macro lh2() %}
  a+am!8 r8 d+dm! a+am! | f+d@m!8[ e+a@m!8] e+eM!8 a+am! |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key c \major
  \time 2/4
  \repeat volta 2 {
    {{ rh1("c''=''16\\(\\mf") }} {{ rh1("c=''16\\(") }}
    a='16\( c e c d f e c | d b c a b gis a8\) | a16\( c e c d f e c |
    \alternative {
      \volta 1 { d=''16 b c a b gis a='8\) | }
      \volta 2 { d=''16( f e c d b c=''8) \bar "|." }
    }
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  {{ lh1("c+cM!8-\\stBass") }} {{ lh1("c+cM!8") }}
  {{ lh2() }} {{ lh2() }} d+dm!8 g+c@M! g+gM!8 c+cM! |
}
{% endmacro %}
