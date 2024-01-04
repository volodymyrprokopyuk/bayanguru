{% macro t1(a) %}
  \tuplet 3/2 { {{ a }} 8-. 8-. } %
{% endmacro %}

{% macro rh1(a, b, c, d) %}
  {{ t1(a) }} <c=' d fis>8-.-> r %
  \tuplet 3/2 { <c=' ees g>8-. {{ b }} 8-. 8-. } <c d fis>-.-> r |
  \tuplet 3/2 { <bes= d a'>8-. {{ c }} 8-. 8-. } <bes d g>-.-> r %
  \tuplet 3/2 { <bes= d a'>8-. {{ d }} 8-. 8-. } <bes= d g>-.-> r |
{% endmacro %}

{% macro lh1(a, b, c, d) %}
  r4 \tuplet 3/2 { r8 {{ a }}( {{ b }}) } %
  r4 \tuplet 3/2 { r8 {{ c }}( {{ d }}) } |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Allegro moderato"
  \clef treble
  \key g \minor
  \time 4/4
  {{ rh1("<c'=' ees g>8-.\\mf", "\\p", "\\f", "\\p") }}
  {{ rh1("<c=' ees g>8-.\\p", "", "\\mp", "") }}
  {{ t1("<b= f' aes>8-.\\mf") }} <b f' g>-.-> r %
  {{ t1("<f'=' g ees'>8-.") }} <f g d'>-.-> r |
  {{ t1("<c=' ees aes>8-.\\p") }} <c ees g>-.-> r %
  {{ t1("<ees=' g d'>8-.") }} <ees g c>-.-> r |
  {{ t1("<ees=' g bes>8-._\\dCre") }} <ees g a>-.-> r %
  {{ t1("<g=' c f>8-.") }} <g c ees>-.-> r |
  {{ t1("<fis=' c' ees>8-.") }} {{ t1("<fis=' c' d>8-.") }}
  {{ t1("<c=' fis bes>8-.") }} {{ t1("<c=' fis a>8-.") }} |

  {{ rh1("<c=' ees g>8-.\\p", "", "", "") }}
  {{ t1("<a= ees' g>8-.\\mp") }} <a ees' f>-.-> r %
  {{ t1("<a= ees' g>8-._\\dCre") }} <a ees' f>-.-> r |
  {{ t1("<f'=' bes ees>8-.") }} <f bes d>-.-> r %
  {{ t1("<d=' f c'>8-.") }} <d f bes>-.-> r |
  {{ t1("<aes'=' bes g'>8-.\\f") }} <aes bes f'>-.-> r %
  {{ t1("<g=' bes f'>8-.") }} <g bes ees>-.-> r |
  {{ t1("<f=' b ees>8-._\\dDim") }} <f b d>-.-> r %
  {{ t1("<ees=' g d'>8-.") }} <ees g c>-.-> r |
  {{ t1("<c=' ees bes'>8-._\\dCre") }} <c ees a>-.-> r %
  {{ t1("<ees=' g d'>8-.") }} <ees g c>-.-> r |
  {{ t1("<g=' c f>8-.") }} <g c ees>-.-> r %
  {{ t1("<fis=' c' ees>8-.^\\tRit") }} <fis=' c' d>-.-> r |

  {{ t1("<c'='' ees g>8-.\\pp^\\tATem") }} <c d fis>-.-> r %
  {{ t1("<c='' ees g>8-.") }} <c d fis>-.-> r |
  {{ t1("<bes=' d a'>8-.") }} <bes d g>-.-> r %
  {{ t1("<bes=' d a'>8-.") }} <bes d g>-.-> r |
  {{ t1("<a=' b g'>8-.\\mp") }} <a b f'>-.-> r %
  {{ t1("<g=' c f>8-.") }} <g c ees>-.-> r |
  \tuplet 3/2 { <ees=' fis bes>8-.\< 8-. \af 16.\! 8-. } %
  {{ t1("<c=' fis a>8-.") }}
  \tuplet 3/2 { <bes= d a'>8-.\> 8-. \af 16.\! 8-. } <bes d g>-.-> r |
  \tuplet 3/2 { <aes= b g'>8-.\mf 8-._\dDim 8-. } <aes b f'>8-.-> r %
  {{ t1("<g= c f>8-.") }} <g c ees>-.-> r |
  \af 4\! <g= bes d>4-.->\< \af 4\! <a c f>-.->\> %
  \af 4\! <g= bes d>4-.->\< \af 4\! <c ees aes>-.->\> |
  \tuplet 3/2 { r8 <bes= d g>8-._\dCre <bes d a'>-. } %
  \tuplet 3/2 { <bes= d g>8-. <d g bes>-. <d g c>-. } %
  \tuplet 3/2 { <d=' g bes>8-. <g bes d>-. <g bes ees>-. } %
  \tuplet 3/2 { <g=' bes d>8-. <bes d g>-. <bes d a'>-. } |
  \tuplet 3/2 { <bes=' d g>8-.-> <d g bes>8-. <f a c>8-. } %
  <g='' bes d>4~->\f 2 \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \minor
  r4 \tuplet 3/2 { r8 d,=,(-\puBass a') }
  r4 \tuplet 3/2 { r8 d,=,( a') } |
  {{ lh1("g=,8", "d'", "g,", "d'=") }}
  {{ lh1("d,=,8", "a'", "d,", "a'=,") }} |
  {{ lh1("g=,8", "d'", "g,", "d'=") }}
  {{ lh1("d,=,8", "g", "d", "g=,") }} |
  {{ lh1("g=,8", "c", "g", "c=") }}
  {{ lh1("f,=,8", "c'", "a", "c=") }} |
  \rep 2 { \tuplet 3/2 { r4 a=,8( } d,4) } |

  {{ lh1("d=,8", "a'", "d,", "a'=,") }}
  {{ lh1("g=,8", "d'", "g,", "d'=") }} |
  {{ lh1("f,=,8", "c'", "f,", "c'=") }}
  {{ lh1("f,=,8", "bes", "f", "bes=,") }} |
  {{ lh1("f=,8", "bes", "ees,", "bes'=,") }}
  {{ lh1("g=,8", "d'", "g,", "c=") }} |
  {{ lh1("g=,8", "c", "g", "c=") }}
  {{ lh1("g=,8", "c", "bes", "a=,") }} |

  {{ lh1("d,=,8", "a'", "d,", "a'=,") }}
  {{ lh1("g=,8", "d'", "g,", "d'=") }} |
  {{ lh1("f,=,8", "d'", "g,", "c=") }}
  r2 r4 \tuplet 3/2 { r8 d,=,( g) } |
  {{ lh1("d=,8", "g", "g", "c=") }}
  \rep 4 { \tuplet 3/2 { r8 d,=, d } } |
  g=,4~ \tuplet 3/2 { g8 d4 } g4 d |
  \tuplet 3/2 { g=,8 d4 } g4 %
  \tuplet 3/2 { g=,8-- g-- d=,-- } g+gm!4 |
}
{% endmacro %}
