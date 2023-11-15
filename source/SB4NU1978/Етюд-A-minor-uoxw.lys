{% macro rh1(a) %}
  {{ a }} gis16) a8-. c-. b-. d-. | c8.( b16) c8-. e-. d-. f-. |
  e=''8.(_\aSim dis16) e8 a e d | c8.( e16) c8 b a gis |
  a='8.( gis16) a8 c b d | c8.( b16) c8 e d f |
  e=''8.( dis16) e8 f fis gis | a8.( e16) fis8 gis a b |
  a=''8.(\f gis16) a8 c b d | c8.( b16) c8 e d f |
  e='''8.( dis16) e8 a e d | c8.( e16) c8 b a gis='' |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} r r4 e@7!8 r8 | a r r4 d@m!8 r8 |
  a=,8 r r4 e@7!8 r8 | a r r4 e'=8 r |
{% endmacro %}

{% macro lh2(a) %}
  c=8 r cM! r cM r | e r c@M! r8 cM r |
  g,=,8 r gM! r gM r | gis r e@7! r8 e7 r |
  a=,8 r am! r am r | {{ a }} | e+e7!8 r r4 r | R2. |
{% endmacro %}

{% macro lh3(a) %}
  {{ a }} r am! r e@7! r8 | a r am! r d@m! r8 |
  a=,8 r am! r e@7! r8 | a r am! r e'= r |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 3/4
  \meter 3/4 #'(1)
  \repeat volta 2 {
    {{ rh1("a'='8.(\\mf") }}
    \alternative {
      \volta 1 {
        a=''8.( gis16) a8 c fis, a | g8.( fis16) g8 b e, g |
        fis=''8.( eis16) fis8 a dis, fis | e8.( dis16) e8 d c b=' |
      }
      \volta 2 { a'=''8.( gis16) a8 c fis, a='' | }
    }
  }
  g=''8.( fis16) g8 b e, g | fis8.( g16) fis8^\tRit a dis, fis | e4 r g,=' |

  e'=''8\p^\tATem c_\aSta e f fis g | a_\dCre g f e d c |
  b='8 g b d g f | e f e d c b |
  a='8 gis a b c e | f e d c b a |
  gis='8 e gis b a c | b d c e d f |
  e=''8 c e f fis g | a g f e d c |
  b='8 g b d g f | e f e d c b |
  a='8 e a b c e | d e d c b a |
  gis='8\> a b c d dis | e f e d^\tRit c \af 8\! b=' |

  {{ rh1("a='8.(\\mf^\\tATem") }}
  a=''8.(\p\< gis16) a8 c b d | c8.( b16) c8 e d f |
  e='''8 dis e f fis \af 8\! gis | <c,=''' a'>8\sf r r4 r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \minor
  {{ lh1("a,=,8-\\stBass") }}
  a,=,8 r r4 e@7!8 r8 | a r r4 d@m!8 r8 |
  e'=8 r r4 e7!8 r | a, r r4 e'8 r |
  {{ lh1("a,=,8") }}
  a,=,8 r r4 am!8 r | b r r4 e@m!8 r8 |
  b=,8 r r4 b7!8 r | e r r4 e7!8 r |
  a,=,8 r r4 am!8 r | b r r4 e@m!8 r8 |
  a=,8 r r4 b@7!8 r8 | e+em!4 r r |

  {{ lh2("d=8 r dm! r dm r") }}
  {{ lh2("f=,8 r d@m! r8 dm r") }}

  {{ lh3("a=,8") }}
  a,=,8 r am! r e@7! r8 | a r am! r d@m! r8 |
  e'=8 r e7! r e7 r | | a, r am! r e'= r |
  {{ lh3("a,=,8") }}
  a,=,8 r gis r g r | f r e' r d r | c r b r e, r | a=, r r4 r |
}
{% endmacro %}
