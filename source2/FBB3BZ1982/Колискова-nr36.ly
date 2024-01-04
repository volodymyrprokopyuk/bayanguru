{% macro rightHand() %}
\relative {
  \tempo Andante
  \clef treble
  \key a \minor
  \time 2/2
  \duo {
    \repeat volta 2 {
      e''=''1(\mp | e8 f e4 a2) | a,8( b a4 g' f | e1) |
      \stemDown <a,=' c>2\( <b d> | \stemUp e4\< g b a |
      \af 4\! g=''4 e c e | <f, d'>1\) |
      \stemDown <a=' c f>4(\mf <g c e> \stemUp <f gis d'>2) |
      c'=''8( d c4 b2) | a8( b a4) a8( b a4) | gis2( e) |
      e='8( f e4) <bes e a>2 | d8( e f g) a4( b) |
      <e,=' a c>4\>^\tRit <c e a> <f a> \af 4\! <e gis> |
      \alternative {
        \volta 1 { <c=' e a>2 \stemNeutral a'8(^\tATem b c d='') | }
        \volta 2 { <c,='_~ e~ a~ >2 4 b' \rest \bar "|." }
      }
    }
  } {
    c''=''2 b | bes a | f a | r4 <b d>( <a c> <gis b>) |
    s1 | c=''2 c~ | c g | c b |
    s1 | <e,=' a>2 <d f> | <c e> <c ees> | <b d>1 |
    bes=2 s2 | a <b d f> | s2 d=' | s1 | s1 |
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \minor
  a=4-\frBass a gis gis | g g fis fis | f f b,2 | e( fis4 gis) |
  a=4 a gis gis | g g f f | e2 a | aes4 aes g g |
  c='4 c b b | a a gis gis | fis fis f f | e e e e |
  d=4 d cis cis | c c b f | e1 | a4 e a r | a e a,=,, r |
}
{% endmacro %}
