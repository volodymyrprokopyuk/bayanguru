{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 4/4
  c''=''2(\p b | a e') | d( c | b1) | a2( b | c a') | g( f | e1) |
  f=''2( e | d a') | e( d | c a') | d,( c | b e) | c( b | a1) |
  d=''2( c | b a') | c,( b | a a') | b,( a | e' d) | a1~ a=' \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \minor
  a=2(-\frBass b | c1) | f2( e | d1) | c2( b | a f) | g1( | c) |
  d='2( c | b1) | c2( b | a1) | b2( a | gis1) | a2( b | c e) |
  f='2( e | d1) | e2( d | c1) | d2( c | b1) | c2( b | a=1) |
}
{% endmacro %}
