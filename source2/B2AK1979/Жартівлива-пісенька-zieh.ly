{% macro rh1() %}
  f='8\< g a \af 8\! bes <a c>4 a8 f |
  <bes=' d>8.-> 16 <a c>8 <g bes> <a c>4 a8 f |
  <bes=' d>8 8 <a c> <g bes> <a c> <f a> r <f=' a> |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegro
  \clef treble
  \key f \major
  \time 4/4
  \meter 1/4 1,1,1,1
  \partial 8 { c'='8\mf | }
  {{ rh1() }}
  <b,= g'>8 8 <bes d> <bes e> <a f'>4 8 c |
  {{ rh1() }}
  <bes,= g'>8 8 <bes d> <bes e> <a f'>4 8 bes'=' |

  a='4--\p e8 g f4-- d8 bes' | a4-- e8 g f d r d |
  <des=' f>4-- <bes des>8 8 <c f>4-- <a c>8 <bes' d> |
  <c,=' e c'>4 <bes g'>8 <c a'> <a f'> r <a'=' c f>-> r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key f \major
  \meter 1/4 1,1,1,1
  \partial 8 { r8 | }
  f,=,8-\stBass fM! c' f@M a8 f@M! c8 f@M |
  bes=,8 besM! f bes@M f8 fM! c' f@M |
  bes=,8 besM! f bes@M f8 fM! c' f@M |
  d=8 g@7! c8 c7! f, fM! c' f@M |
  f,=,8 fM! c' f@M a8 f@M! c8 f@M |
  bes=,8 besM! e c@7! f,8 fM! c' f@M |
  bes=,8 besM! e c@7! f,8 fM! c' f@M |
  g=,8 gm! c c7! f+fM! c= f+fM! r |

  \rep 2 { cis=8 a@7! a8 a7 d dm! a=, d@m | }
  bes=,8 besm! g bes@m a8 f@M! f8 bes@M! |
  g=,8 c@7! c8 c7 f+fM!-> c= f+fM!-> r |
}
{% endmacro %}
