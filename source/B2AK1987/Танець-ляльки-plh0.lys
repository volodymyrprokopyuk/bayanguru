{% macro rh1() %}
  \duo { b'='8[( <e g>]) b[( <dis fis>]) e='' } { b'='4 b b='8 } %
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegro
  \clef treble
  \key a \minor
  \time 4/4
  \partial 4 { f''=''16(\p e c a) | }
  \repeat volta 2 {
    r8 c=''8-. f,-. b-. a( e) f16( e c a) |
    \duo { e'='8[( <a c>]) d,[( <gis b>]) c,[( <e=' a>]) } { e'='4 d c=' } %
    f''=''16( e c a) | r8 c8-. f,-. b-. a( e) b16( e fis g) |
    \alternative {
      \volta 1 { {{ rh1() }} r8 f'=''16( e c a=') | }
      \volta 2 { {{ rh1() }} r8 e='16(\mf gis b d='') | }
    }
  }

  f=''8( <b d>) <e, f c'>-. <d f b>-. <c f a>8(-> <b f' gis>) b'=''16( a f d) |
  r8 <c='' d f a>8-. <b d f gis>-. <a d f a>-. <gis d' f b>8 r b,=16( d f a) |
  b='8(\> <f' a>) <b, d g>-. <a d f>-. <g b e>8(-> <f b d>) g'=''16( f d \af 16\! b) |
  r8 <b=' f'>8-.^\tRit <b e>-. <b d>-. <b e>4 f'=''16(\p^\tATem e c a) |
  r8 c=''8-. f,-. b-. a( e) f='16( e c a) |
  \duo { e'='8[( <a c>]) d,[( <gis=' b>]) } { e'='4 d=' } %
  <c=' a'>8 r a'='16( f e d) |
  c='8( b) f'16( d c b) a8( gis) a16( b c d |
  e='8)\> r <d b'>-. r \af 8.\! <c=' a'>4 \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \minor
  \partial 4 { r4 | }
  a@m!8-\stBass r8 d@m! r8 a@m! r8 r4 |
  r4 e+e7!8 r a+am! r r4 |
  a@m!8 r8 d@m! r8 a@m! r8 r4 |
  \rep 2 { r4 b+b7!8 r e+em! r r4 | }

  \rep 3 { R1 | } g@7!2 e@7!4 r |
  a@m!8 r8 d@m! r8 a@m! r8 r4 |
  r4 e+e7!8 r f+fM! r r4 | R1 | r4 e=8-. r a+am!4 %
}
{% endmacro %}
