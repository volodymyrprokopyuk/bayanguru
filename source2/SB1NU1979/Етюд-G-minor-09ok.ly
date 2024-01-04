{% macro rh1() %}
  g='8 bes a g | f' f, g a | bes d c bes | g' a, bes c='' |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key g \minor
  \time 4/8
  \meter 1/2 #'(1)
  g'='8\mp bes a g | d' d, e fis | {{ rh1() }}
  d=''8 a c bes | g d e fis | {{ rh1() }}
  d=''8 e fis bes | g a, f' ees |
  d=''8 g, a d, | <bes= d g>4. r8 \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \minor
  \meter 1/2 #'(1)
  g,=,8[-\stBass gm!] bes g@m | d8 d7! d7 d7 |
  bes=,8 g@m! g8 gm | a[ f@7! f78 f7] |
  bes=,8[ besM!] d bes@M | ees8 eesM! eesM eesM |
  d=8[ d7!] gis, d@7 | g8[ gm!] c d@7! |
  bes=,8[ g@m! gm8 gm] | a f@7! f8 f7 |
  bes=,8 besM! besM besM | ees[ eesM!] c ees@M |
  d=8 d7! d7 d7 | ees[ eesM!] c cm! |
  d=8 g@m! fis,=,8 d@7! | g+gm!4. r8 |
}
{% endmacro %}
