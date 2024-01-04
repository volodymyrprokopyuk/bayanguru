{% macro t1(a, b) %}
  \repeat tremolo 4 { {{ a }} } {{ b }} |
{% endmacro %}

{% macro rh1(a) %}
  {{ t1("e=''32( c", "e8) g") }} {{ t1("g=''32( d", "g8) a") }}
  {{ t1("<fis='' a>32( c", "<fis a>8) <g b>") }}
  {{ t1("<g='' b>32( b,", "<g' b>8) g") }}
  {{ t1("<d='' g>32( b", "<d g>8) g") }}
  {{ t1("<c,='' g'>32( g", "<c g'>8) " + a) }}
{% endmacro %}

{% macro lh1(a) %}
  c=8 cM! cM r | b g@M! gM8 r |
  d=8 d7! d7 r | g, gM! gM r |
  f=,8 g@M! gM8 r | e'= c@M! cM8 r |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 2/4
  \set subdivideBeams = ##t
  \partial 8. { e''=''32(\mf fis g a b c=''') | }
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      b=''4. \trill a16( g) | a4. \trill g16( fis) |
      g=''4. \trill fis16( e) | fis4( \trill fis32) b,( cis dis e fis g a) |
      b=''4. \trill a16( b) | c4. \trill d16( c) |
      b=''4. \trill c16( b) | a4. \trill b16( a) |
      g=''4. \trill a16( g) | fis4. \trill eis16( fis) |
      b=''4. \trill b,16( dis) | e4. \trill dis16( e) |
      \alternative {
        \volta 1 { e'='''4~ e16 e,32( fis g a b c=''') | }
        \volta 2 { e='''4. \fine \bar "!!" e,=''8 | }
      }
    }

    \volta 2
    \meter 1/8 1,1,1,1
    {{ rh1("g'=''8") }}
    {{ t1("<d='' f>32( a", "<d f>8) f") }}
    {{ t1("<b,=' e>32( gis", "<b e>8) r") }}
    {{ t1("<c='' e>32( a", "<c e>8) r") }}
    {{ t1("<c='' f>32( a", "<c f>8) r") }}
    {{ t1("<b=' d>32( g", "<b d>8) r") }}
    {{ t1("<c='' g'>32( g", "<c g'>8) r") }}
    {{ t1("<d='' f>32( a", "<d f>8) r") }}
    {{ t1("<c='' e>32( g", "<c e>8) r") }}
    {{ t1("<b=' d>32( g", "<b d>8) 8") }}
    {{ t1("<g=' c>32( e", "<g c>8) e'") }}
    {{ rh1("a'=''8") }}
    {{ t1("<fis='' a>32( c", "<fis a>8) b") }}
    \repeat tremolo 4 { <dis,='' b'>32( b } b'16) %
    e,=''32[( fis g a b c=''']) \bar "||"
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key e \minor
  \meter 1/8 2,1,1
  \partial 8. { r16 r8 | }
  e=8-\stBass em! em r | e b@7! b78 r |
  e=8 em! em r | e b@7! b78 r |
  e=8 em! em r | d d7! d78 r |
  g,=,8 gM! gM r | a am! am r |
  b=,8 e@m! em8 r | dis b@7! b78 r |
  b=,8 b7! b7 r | \rep 3 { e= em! em r | }

  {{ lh1() }} | d=8 dm! dm r | e e7! e7 e |
  a,=,8 am! am g | f fM! fM f |
  f=,8 g@M! gM8 f | e' c@M! cM8 e |
  f,=,8 d@m! dm8 f | g c@M! cM8 g |
  g=,8 g7! g7 g | c cM! cM r |
  {{ lh1() }} | d d7! d7 r | b=, b7! b7 r |
}
{% endmacro %}
