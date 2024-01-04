{% macro rightHand() %}
\relative {
  \tempo Cantabile
  \clef treble
  \key d \minor
  \time 2/4
  a'='4.\(\mp f'8 | e\< d cis b16 \af 16\! cis | d4\> \af 4\! d,\) |
  c'=''8\(\< bes16 c d8 \af 8\! c | bes[ d ees d] | c[\> bes a \af 8\! g] |
  fis='4\) g8\( a | bes4\< \af 4\! g'~ | g8 f4\> \af 8\! e8 |
  d=''2\) \fermata \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key d \minor
  R2 | R2 | d=4.\(-\frBass bes'8 | a g fis e16 fis | g4 g,\) |
  a=,4( c) | d8[\( a' bes a] | g[ f e d] | cis d16 f a8 a, | d=2\) \fermata |
}
{% endmacro %}
