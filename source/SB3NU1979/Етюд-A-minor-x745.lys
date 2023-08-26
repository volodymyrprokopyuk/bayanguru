{% macro rh1(a) %}
  {{ a }} f e <a c> e f e) r16 e( f e <c' e> e, f e) |
  r16 e='16( f e <b' d> e, f e) r16 e( f e <gis b> e f e) |
  r16 e='16( f e <b' d> e, f e <a c> e f e <gis b> e f e=') |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} r am! r c r a@m r8 | gis r e@7! r8 b r e@7 r8 |
  e=8 r e7! r a@m! r8 e@7! r8 |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 4/4
  {{ rh1("r16\\mp e'='16(") }}
  r16 e='16( f e <a c> e f e) r16 e( f e <c' e> e, f e) |
  r16 a='16( bes a <cis e> a bes a) r16 a( bes a <e' g> a, bes a) |
  r16 a='16( bes a <d f> a bes a) r16 a( b a <f' a> a, b a) |
  r16 e='16( f e <a c> e f e) r16 e( f e <gis b> e f e) |
  r16 e='16( f e a e f e) <a c>( e f e a e f e=') |

  r16\mf g='16( a g <c e> g a g ) r16 g( a g <e' g> g, a g) |
  r16 g='16( a g <d' f> g, <c e> g <b d> g <c e> g <b d> g <a c> g) |
  r16 g='16( a g <b d> g a g ) r16 g( a g <d' f> g, a g) |
  r16 g='16( a g <e' g> g, <d' f> g, %
  <c='' e>16 gis <d' f> gis, <c e> gis <b d> gis=') |

  {{ rh1("r16\\p e='16(") }}
  r16 e='16( f e a e f e) r16 a( b a c a b a) |
  r16 b='16( c b d b c b) r16 e( f e gis e f e) |
  a=''8-> r r4 e,8-. r r4 | a,=8-. r r4 r2 \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \minor
  {{ lh1("a,=,8-\\stBass") }} | a, r am! r c r a@m r8 |
  cis=8 r a@7! r8 e r a@7 r8 | d r dm! r f, r d@m r8 |
  a=,8 r am! r gis r e@7! r8 | a=, r am! r f@M! r8 a@m! r8 |

  c=8 r cM! r cis r a@7! r8 | d r g@7! r8 g, r g7 r |
  d'=8 r g@7! r8 b r g@7 r8 | c r cM! r gis=, r e@7! r8 |

  {{ lh1("a=,8") }}
  a+am!8 r r4 e+a@m!8 r8 r4 | d+dm!8 r r4 b+e@7!8 r8 r4 |
  a+am!8 r r4 e,8-. r r4 | a=,8-. r r4 r2 |
}
{% endmacro %}
