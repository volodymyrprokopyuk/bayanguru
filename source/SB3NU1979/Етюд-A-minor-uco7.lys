{% macro rightHand() %}
\relative {
  \tempo "Andante cantabile"
  \clef treble
  \key a \minor
  \time 4/4
  \partial 8 { <d''='' f>8(\p | }
  <c='' e>8 <b d> <a c> <gis b> <a c> <gis b> <a c>) <d f>( |
  <c='' e>8 <b d> <a c> <gis b> <a c>4.) <d f>8( |
  <c='' e>8 <b d> <a c> <gis b> <a c> <gis b> <a c>) <c e>( |
  <e='' g>8\< <d f> <c e> <b d> \af 4.\! <c e>4.) <e g>8(\mp |
  <e='' g>8\< <c e> <d f> <e g> <f a> <d f> <e g> \af 8\! <f a> |
  <g='' b>8 <f a> <e g> <d f> <c e>4.) %
  \duo { \stemDown <e''='' g>8(\mp | <d f> <c e> \stemUp d=''4) } %
  { s8 | s4 b'='8 a=' } %
  <c='' e>8( <b d> <a c>) <d f> |
  <c='' e>8(\> <b d> <a c> <gis b> \af 4.\! a4.) a='8( |

  \repeat volta 2 {
    <gis=' b>8)\mp e16 e e8-- <gis b>( <a c>) a16 a a8-- c( |
    <b=' d>8)_\dCre g16 g g8-- <d' f>( <c e>4.) a8( |
    <cis='' e>8) a16 a a8-- <cis e>( <d f>) a16 a a8-- <d f>( |
    <e='' g>8)\< g,16 g g8-- <f' a>8( \af 4.\! <e g>4.) <a c>8(\mf |
    <g='' b>8 <f a> <e g> <d f> <f a> <e g> <c e>) <c e>( |
    <e='' g>8 <d f> <c e> <b d>^\tRit <c e>4)\> r8 \af 8\! <e g>( |
    \alternative {
      \volta 1 {
        <d='' f>8^\tATem <c e>) \duo { d''=''4 } { b'='8 a=' } %
        <c='' e>8( <b d> <a c>) <d f>( |
        <c='' e>8 <b d> <a c> <gis b> a4.) a='8 \sSlur fd #'() ( |
      }
      \volta 2 {
        \hSpace
        <d='' f>8) \sSlur bu #'((bs . 2.5) (sh . 7) (wd . 3.5)) ( %
        <c='' e>8 <b_~ d>) <b f' a> \fermata <c e>8( <b d> <a c>) <d f>( |
        <c='' e>8\> <b d> <a c> <gis e'> \af 4.\! <a=' a'>4.) r8 \bar "|."
      }
    }
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \minor
  \partial 8 { r8 | }
  e=4-\stBass e7! a, am! | e' e7! a, am! |
  gis=,4 e@7! a4 am! | g g7! c cM! |
  c=4 cM! d dm! | g, g7! c cM! |
  d=4 dm! e a@m! | e4 e7! a,=, am! |

  e'=4 e7! a, am! | g g7! c cM! |
  a=,4 a7! d dm! | g, g7! c cM! |
  g=,4 g7! c cM! | b g@7! c4( cis) |
  d=4 dm! e a@m! | e4 e7! a, am! |
  d=4 dm! \fermata e a@m! | e4 e7! a,=, am! |
}
{% endmacro %}
