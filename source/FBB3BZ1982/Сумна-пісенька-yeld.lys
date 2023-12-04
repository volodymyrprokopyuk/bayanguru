{% macro lh1a(a) %}
  {{ a }} bes~ <bes d>) d, \rest | g( d'~ <bes= d>) d, \rest |
{% endmacro %}

{% macro lh2a() %}
  g=8( c~ <c ees>) d, \rest | \stemDown bes'[( a] g=) d \rest |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Andante cantabile"
  \clef treble
  \key g \minor
  \time 2/4
  \meter 1/2 #'(1)
  \partial 8 { d'='8(\mp | }
  g='8 a bes c | d bes g) g'( | ees c g) g'( | d4.) d8( |
  c=''8 bes a c | bes a g bes | a\< e fis \af 8\! g | fis4.)\> \af 8\! d8( |
  g='8 a bes c | d bes g) bes'( | a g f ees | d4.) g8( |
  ees=''8 c a) g'( | d bes g) bes( | a[ c] fis, a | g4.) bes='8\( |

  a='8\p fis_\dCre d c' | bes a g g' | f c d ees | d4.\) d8\( |
  cis=''8 b a g' | fis d a fis' |
  \duo { e''=''8[\mf b] cis a=' | } { g'='2 | } | <fis, d'>4.\) d8( |
  g='8\p a bes c | d bes g) g'( | ees c a) g'( | d4.) d8\( | c ees a, c |
  bes='8 d g, bes | a[ c] fis, a | g4 <bes=' d g>\) \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \minor
  \meter 1/2 #'(1)
  \partial 8 { r8 | }
  \duo {
    \mergeDifferentlyDottedOn {{ lh1a("g=8(_\\frBass") }} {{ lh2a() }}
    \stemUp fis=8( c'~ <c d>) d, \rest | g( bes~ <bes d>) d, \rest |
    \stemDown <a'= cis>2-> | d8( c bes) a( | \stemUp {{ lh1a("g=8)(") }}
  } {
    \rep 3 { g=4. s8 | } | s2 | fis4. s8 | g4. s8 | s2 | s2 |
    \rep 2 { g=4. s8 | }
  }
  f=8( c' a c | bes[ f] bes) r | c[( a] ees') r | g,( d' bes) d( | c4)-- d-- |
  \duo { g=4. s8 | } { g=8( <bes ees>^\tenuto <bes= d>)^\tenuto d, \rest | }

  d,=8\( c' a c | g d' bes d | f, a ees' a, | bes a g\) f\( |
  a=8 e' cis e | d, a' fis a | <g b>4 a | d,8 c' a\) r |
  \duo { {{ lh1a("g=8(") }} {{ lh2a() }} } { \rep 3 { g=4. s8 | } | s2 | }
  <c=' ees>4-- <fis, c'>-- | <g d'>-- <e c'>-- | <ees c'>-- <d c'>-- |
  <ees= g>8( d <g= bes d>4) |
}
{% endmacro %}
