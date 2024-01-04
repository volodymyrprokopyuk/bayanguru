{% macro rightHand() %}
\relative {
  \tempo Lento
  \clef treble
  \key a \minor
  \time 2/4
  \repeat volta 2 {
    a'='8\(\mp e' d f | e4 d8 c\) | b( d c4) |
    \alternative {
      \volta 1 { b='8( b a='4) | }
      \volta 2 { b='8( b a='4) \bar "|." }
    }
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  a,=,8-\stBass am! d dm! |
  a=,8[ am! am am] | d dm! e a@m! |
  e=8 eM! a, am! | e'= eM! a+am!4 |
}
{% endmacro %}
