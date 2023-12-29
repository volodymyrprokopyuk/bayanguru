{% macro rh1() %}
  d='4) d( f | e) e( g | f e d=' |
{% endmacro %}

{% macro lh1() %}
  c='2) e4( | b) b( d | c) c( e | d c g= |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 3/4
  g'='2(\mf e4) | g2( e4) | f( e d | e2 c4) |
  g'='2( a4) | g2( e4) | f( e d | e2) g4( |
  {{ rh1() }} | e2) g4( | {{ rh1() }} | e='2.) \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef treble
  \key c \major
  e'='2(-\frBass c4) | e2( c4) | d( c g | c2.) |
  e='2( f4) | e2( c4) | d( c g | \rep 2 { {{ lh1() }} } \clef bass c,=2.) |
}
{% endmacro %}
