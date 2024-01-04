{% macro lh1() %}
  bes,=,8 besM! f' fM! c f@M f8 e= |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key f \major
  \time 4/4
  r8 c''=''8(\mf c[ g] bes16 a g8 f d |
  c='8) r r4 r8 <g' c e>-. 8-. <f bes d>-. |
  \rep 2 { <e=' g c>8 <g c e>[-. 8-. <f=' bes d>]-. } %
  \time 3/4
  <e=' g c>8[ <f bes d>] <e g c>( bes' a g) |
  \time 2/4
  \repeat volta 2 {
    r8 <a,= c f>8[ r <bes d g>] |
    \time 4/4
    r8 <a= c f>8[ r <bes d g>] %
    \duo { r8 c''=''8 c[ g] | bes a16 g f4~ f8 <c'='' e>8[ 8 8] | }
    { r4 d'='4 | e4 f~ f8 f[ g a='] | }
    <c'='' e>8 <bes d> <f a>4~ 8 8[ 8 <e g>] | <g bes> <f a> %
    \duo {
      \autoBeamOff <d'='_~ d'^~> 4 8 <f a>8 \autoBeamOn 8[ 8] | 8[ <e=' g>] %
    } { \autoBeamOff r8 <f'=' a>8 8 d \autoBeamOn c4 | b= } %
    <c=' c'>16( d' e f g a bes c) <d, f c'>8 <d f g> |
    \duo { bes''=''8 a16 g f4~ f=''8 } { <c''='' e>4 r8 <a=' c>8 8 } %
    \ottava #1 <f='' c' e>8 <g c e> <a c e> | <c e>[ <bes d>] \ottava #0
    <f='' a>4~ 8 8[ 8 <e g>] | <g bes>[ <f a>] %
    \duo { < d''=''_~ d'^~> 4 8 } { r8 <f''='' a>8 8 } %
    <d='' f a>8 <c f a>8 8 |
    \alternative {
      \volta 1 {
        \time 3/4
        \duo {
          <f''='' a>8 <e g> c16 d, e f g a bes d |
          <e,=' g c>8 <f g bes>16 d' c8 bes a g=' |
        } { b'='4 c8 r r <d, f> | s4 <e=' g>8 r r4 | }
      }
      \volta 2 {
        \time 4/4
        \duo { <f''='' a>8[ <e g>] c'8 r r bes16 d c8 bes16 d=''' | }
        { b'='4 c16 d e f g a <f g>8 <e g> <f='' g> | }
        <e='' g c>8 r r4 \acc { g=''16 a bes } c='''8-> r r4 \bar "|."
      }
    }
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key f \major
  R1 | c+cM!8-\stBass r r4 r2 | c4 cM! c cM |
  \time 3/4 c=8[ g] c+cM! r r4 |
  \time 2/4 f'=4-. c-.
  \time 4/4
  \meter 1/4 1,1,1,1
  f=4-. c-. f8 fM! g, gm! | c cM! f fM! c f@M f8 fM |
  {{ lh1() }}
  a,=,4 d8 dm! a d@m d8 f@M! | g,8 e@m! c8 cM! cM r c g |
  c=8 cM! f fM! f fM f fM |
  {{ lh1() }}
  a,=,4 d8 dm! d dm d f@M! | g,8 e@m! c8 cM! g g+bes@M! |
  c+cM!8 g+bes@M! c+cM!8 r r4 |
  g=,8 e@m! c=8 cM! cM g+bes@M! c+cM!8 g+bes@M! |
  c+cM!8 r r4 c+cM8-> r r4 |
}
{% endmacro %}
