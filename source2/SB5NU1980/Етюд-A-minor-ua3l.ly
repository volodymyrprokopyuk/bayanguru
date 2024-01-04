{% macro t2(a, b, c) %}
  \tuplet 3/2 { {{ a }} } \tuplet 3/2 { {{ b }} } {{ c }} |
{% endmacro %}

{% macro t3(a, b, c, d) %}
  \tuplet 3/2 { {{ a }} } \tuplet 3/2 { {{ b }} }
  \tuplet 3/2 { {{ c }} } {{ d }} |
{% endmacro %}

{% macro t4(a, b, c, d) %}
  \tuplet 3/2 { {{ a }} } \tuplet 3/2 { {{ b }} }
  \tuplet 3/2 { {{ c }} } \tuplet 3/2 { {{ d }} } |
{% endmacro %}

{% macro rh1(a) %}
  {{ t4(a, "d e d", "c d c", "b c b") }} |
  {{ t3("a='8 b a", "g a \\af 16.\\! g", "f\\sf\\> g f", "\\af 8\\! e='\\) r") }} |
{% endmacro %}

{% macro rh2() %}
  {{ t4("e='8\\(\\< gis b", "d c b", "a c e", "a g \\af 8\\! f") }} |
  {{ t4("e=''8 gis b", "d\\> c b", "a c b", "a g \\af 8\\! f=''\\)") }} |
{% endmacro %}

{% macro rh3() %}
  {{ t4("e='8\\(_\\dCre gis b", "d c b", "a c e", "a g f") }} |
  {{ t3("e=''8 gis b", "d c b", "a c e", "a='''8\\)\\f r") }} |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} r am!] r e'[ r a@m] r8 | c[ r a@m!] r8 dis4( e=8) r |
{% endmacro %}

{% macro lh2() %}
  \rep 2 { e@7!8[ r8 e=] r a@m! r8 r4 | }
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Vivace
  \clef treble
  \key a \minor
  \time 4/4
  {{ rh1("e''=''8\\(\\p\\< f e") }} {{ rh2() }}
  {{ rh1("e=''8\\(\\p\\< f e") }} {{ rh3() }}

  {{ t4("g,=''8\\(\\p a g", "e f e", "f g f", "d e d") }}
  {{ t3("e=''8 f e", "c d c", "d e d", "g,='8\\) r") }}
  {{ t4("g'=''8\\( a g", "e f e", "f g f", "d e d") }}
  {{ t4("e=''8 f e", "d e d", "c e g", "c='''\\) g\\( a") }}
  {{ t4("b=''8\\mf c b", "g a g", "a b a", "fis g fis") }}
  {{ t3("g=''8 a g", "e fis e", "fis g fis", "b,='8\\) r") }}
  {{ t4("b'=''8\\( c b", "g a g", "a_\\dCre b a", "fis g fis") }}
  {{ t4("g=''8 a g", "fis g fis", "e g b", "e b g=''\\)") }}

  {{ t4("e=''8(\\f f e", "d e d", "c e g", "c g e)") }}
  {{ t4("c=''8( d c", "b c b", "a c_\\dDim e", "a e c='')") }}
  {{ t4("a='8( bes a", "g a g", "f a c", "f c a)") }}
  {{ t4("f='8( g f", "e f e", "d f a", "d a f=')") }}

  {{ t4("d='8\\(\\p e d", "b c b", "e f e", "c d c") }}
  {{ t4("f='8 g f", "d e d", "g_\\dCre a g", "e f e='\\)") }}
  {{ t4("a='8\\( b a", "f g f", "b c b", "g a g") }}
  {{ t4("c=''8 d c", "a b a", "d e d", "b c b='\\)") }}

  {{ t4("e=''8(\\f\\< dis e", "gis b \\af 16.\\! e", "d\\> c b", "a g \\af 16.\\! f") }}
  {{ t4("e=''8)\\< dis( e", "gis b \\af 16.\\! e", "d\\> c b", "a g \\af 16.\\! f=''") }}
  {{ t4("e=''8) b'( a", "g f_\\dDim e", "d c b", "a g f") }}
  {{ t4("e='8) f( fis", "g gis a", "ais b c", "cis d dis='')") }}

  {{ rh1("e=''8\\(\\p\\< f e") }} {{ rh2() }}
  {{ rh1("e=''8\\(\\p\\< f e") }}
  {{ t4("e='8(_\\dCre gis b", "d c b", "a c e", "a e c)") }}
  {{ t4("a='8( cis e", "g f e", "d f a", "d a f='')") }}
  \ottava #1
  {{ t4("e=''8( gis b", "d c b", "a c e", "a g f)") }}
  {{ t2("e='''8(\\f gis b", "d c b", "a) \\ottava #0 r r4") }}
  {{ t2("e,=''8(\\p gis b", "d c b", "a) r r4") }}
  <b,=' e gis>4\ff r <b e gis> r | <c='' e a> r r2 \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \minor
  {{ lh1("a,=,8[-\\stBass") }} {{ lh2() }}
  {{ lh1("a,=,8[") }} {{ lh2() }}

  c=8[ r cM!] r b[ r g@M!] r8 | a[ r am!] r g[ r gM!] r |
  c=8[ r cM!] r g[ r g7!] r | c[ r g@7!] r8 c@M! r8 r4 |
  g=,8[ r e@m!] r8 fis[ r b@7!] r8 | e'[ r em!] r dis[ r b@M!] r8 |
  e=8[ r em!] r b[ r b7!] r | e=[ r b@7!] r8 e@m! r8 r4 |

  r4 g@7!4(-> c@M!8) r8 r4 | r4 e@7!4(-> a@m!8) r8 r4 |
  r4 c@7!4(-> f@M!8) r8 r4 | r4 a@7!4(-> d@m!8) r8 r4 |

  r4 d=8 r r4 e8 r | r4 f,8 r r4 g8 r |
  r4 a=,8 r r4 b8 r | r4 c8 r r4 d=8 r |

  e+e7!8 r r4 d@m!2( | e@M!8)-. r8 r4 d@m!2( |
  e@M!8)-. r8 r4 f+d@m!8[ r8 d+dm] r | e+eM!8[ r d] r c[ r b=,] r |

  {{ lh1("a=,8[") }} {{ lh2() }}
  {{ lh1("a,=,8[") }}
  e@7!8[ r8 e=] r a@m! r8 r4 | a@7!8[ r8 a,=,] r d@m! r8 r4 |
  \rep 2 { e@7!8[ r8 e'=] r a@m! r8 r4 | }
  r4 e@7!8 r8 a@m! r8 r4 | e+eM!4 r e+eM r | a+am! r r2 |
}
{% endmacro %}
