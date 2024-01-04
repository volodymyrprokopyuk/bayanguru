{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 3/4
  e''=''4\(\p d c | c b\< a\) |
  b='4\( b \af 4\! b | b gis e\) |
  e='4\( gis b | d c b |
  a='2.~\> | \af 4\! a='4\) r r |
  c=''4\( c c | c b c\) |
  d=''4\( d\< d | d e \af 4\! f\) |
  e=''4\( e e | e b\> c |
  a='2.~ | \af 8.\! a='4\) r r |
  \duo {
    c''=''4\( c c | c b c\) | d\( d\< d | d e \af 4\! f\) |
    e=''4\( e e | e b\> c | a2.~ | \af 8.\! a='4\) %
  } { a'='2.~ | a2. | a2.~ | a2. | c | gis2. | a2.~ | a='4 } %
  r r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \minor
  a,=,4-\stBass am! am | e' a@m am4 |
  e=4 e7! e7 | gis, e@7 e74 |
  e'=4 e7! e7 | b e@7 e74 |
  a=,4( am!) am | e'( a@m) am4 |
  a,=,4 am! am | e' a@m am4 |
  d=4 dm! dm | a d@m dm4 |
  e'=4 a@m! am4 | e e7! e7 |
  a,=,4( am!) am | e'( a@m) am4 |
  a,=,4 am! am | g a@m am4 |
  f=,4 d@m! dm4 | b d@m dm4 |
  e=4 a@m! am4 | e e7! e7 |
  a,=,4( am!) am | a+am! r r |
}
{% endmacro %}
