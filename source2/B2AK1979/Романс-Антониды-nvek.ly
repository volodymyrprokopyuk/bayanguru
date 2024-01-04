{% macro rightHand() %}
\relative {
  \tempo Andantino
  \clef treble
  \key g \minor
  \time 3/4
  \meter 1/4 1,1,1
  r4\p r d''=''8\( d | ees4. ees8 d c |
  d=''4 g,8 g\) d'\( d | ees4. d8 c f |
  d=''2\) g8\( f | ees4. ees8 d c |
  d=''4 g,8 g\) \once \phrasingSlurUp bes\( a |
  \duo { g'='8 a bes b c cis='' | } { g'='4. g8 g g=' | }

  <fis=' d'>2\) <bes d>8 8 | <a c>2 <g bes>8 8 |
  <fis=' a>2 <bes d>8 8 | <a c>2 <g bes>8 8 |
  \duo { r4\< \af 2\! d''=''2~ | d\> \af 4\! bes='4 | }
  { <fis'=' a>2. | f='2 r4 | }
  f'=''2-> f4 | ges8\( f ees d ees ges | f4 bes,\) d8\( ees |
  <d='' f>2\< \af 4\! <c fis>4 | <bes g'>2\)\> bes8\( \af 8\! c |
  d=''2 f8 ees | d2.\) | <bes g'>4(-> <d f> <g, ees'>)-> |
  a='4^\tRal d8( c bes a) | g16\( bes' \fermata a g %
  \tuplet 3/2 { f=''8 ees d } \tuplet 3/2 { c=''8 bes a } |
  d=''2\)\> \af 4\! fis,4 | g='4 r r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \minor
  \meter 1/4 1,1,1
  g,=,4( gm!) r | g( c@m!) r4 |
  g=,4( gm!) r | c( cm!) f+fM! |
  bes+besM!2 g+g7!4 | c( cm!) c |
  bes=,4( g@m!) g4 | ees' g, ees'= |

  \rep 2 { d=8( d7!) d7 d7 g@m![ gm8] | }
  d=8_\aSim d7! d7 d7 g@m![ gm8] |
  d=8 d7! d7 d7 g@m![ gm8] | d d7! d7 d7 d7 d7 |
  \rep 2 { bes=,8 besM! besM besM besM besM | }
  bes=,8 ees@m! eesm8 eesm eesm eesm |
  bes=,8 besM! besM besM besM besM |
  bes=,8 besM! besM besM a d@7! |
  g=,8 gm! gm gm g gm! | d' dM! dM dM c cm! |
  d=8 dM! dM dM d dM! | g,( gm!) bes( besM!) c( cm!) |
  d=4( dM!) d+d7! | ees+eesM!4 bes+besM! c+cm! |
  d+g@m!2 d+d7!4 | g+gm!4 r r |
}
{% endmacro %}
