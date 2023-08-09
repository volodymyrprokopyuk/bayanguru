{% macro lh1() %}
  d=4 dm!8 dm | e4 a@m!8[ am8] | e4 e7!8 e7 | a,=,4 am!8 am |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Adagio
  \clef treble
  \key a \minor
  \time 2/4
  \duo {
    b'='8 \rest\mp \stemDown a[\( c e] |
    \stemUp e=''4. d8 | e4 d8 e | <b d>4 <a c>\) |
    b='8 \rest \stemDown d[ \slashedGrace { \stemUp c16_( d } %
    \stemDown c=''8) a] | \stemUp c4. b8 | e,4 b' |
    \slashedGrace { a='16_( b } <c,='_~ a')^~ >2 |
    \time 4/4 <c=' a'>8 e'[ d c] b8.[ a16 gis8 a='] |
  } {
    s2 | <f'=' b>2~ | 2 | <e g> | s2 | <d f> | <d e> | s2 | s8 e4.~ e='2 |
  }

  \repeat volta 2 {
    \duo {
      c''=''2 b~ | b8 d[ d  d] \slashedGrace { c16_( d } c8) b a b |
      <a=' c>8 a,[ c e] b[ a] b' a | e e'[ d c] b8.[ a16 gis8 a] |
      e'=''4~ e8 d16 e d8 d,[( f a] |
      \once \stemDown b='8) <d f>8[ 8 8] e d c d | e=''2 s2 |
    } {
      <d'=' f>1~ | 8 <e gis>8[ 8 8] e2~ | e8 s8 s2. |
      s8 c'=''8 b a <c, e>2 | <f a>2~ 8 s4. | s8 g4. f2 |
      c'=''8 e, g c e gis, g' f='' |
    }
    e''=''8\mp <g, d' g>8[ 8 8] <a cis a'>8. <a cis g'>16 8 <a cis a'> |
    <a='_~ e' g( >2 \af 2\! <a d f) >\< |
    r8\mf <g=' d' g>8[ 8 8] <b g'>8. <f' a>16 <e g>8 <d f> |
    \time 2/4 <d='' f>8 <c e> r c | b4 d | f4. e8 | e8. g16 f4 |
    \acc { e=''16 f } e4 r8 <a, c> |
    \duo { b'='4 d | f4. e8 | gis,4 b=' | }
    { <f'='( a~ >2 | <e) a> | d=' | }
    \slashedGrace { a='16( b } <c,=' a') >2~ |
    \alternative {
      \volta 1 {
        \time 4/4
        <c=' a'>8 \duo { e''=''8[ d c] b8.[ a16 gis8 a='] | } { e'='4.~ e='2 | }
      }
      \volta 2 {
        \time 2/4
        <c=' a'>8 \repeatTie e[ c <a c>] | b4( d | f4. e8) |
        gis,=4 b | \acc { a=16 b } a2~ | <a= c e a>2~ | 8 r r4 \bar "|."
      }
    }
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \minor
  R2 | d=4-\stBass dm!8 dm | g,4 g7!8 g7 |
  c=4 cM!8 cM | a4 am!8 am | d4 dm!8 dm |
  e=4 e7!8 e7 | a,=,4 am!8 am | a+am!8 r r4 r2 |

  d=4 dm!8 dm f,4 d@m8[ dm8] | e'4 e7!8 e7 b4 e@78[ e78] |
  a=,4 am!8 am e'4 a@m8[ am8] | a,4 am!8 am a4 am8 am |
  d=4 dm!8 dm f,4 d@m8[ dm8] | g4 g7!8 g7 d'4 g@78[ g78] |
  c=4 cM!8 cM b4 e@7!8[ e78] | bes2 a4 a7!8 a7 |
  d=4 dm!8 dm d4 dm!8 c | b4 g@7!8[ g78] g4 a8 b |
  c=4 cM!8 r | {{ lh1() }} {{ lh1() }} a+am!8 r r4 r2 | a4 am!8 am |
  f=,4 d@m!8[ dm8] | e'4 a@m! | e4 e+e7! | a+am!2 | a,~ | a=,8 r r4 |
}
{% endmacro %}
