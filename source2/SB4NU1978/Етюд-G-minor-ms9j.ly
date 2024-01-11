{% macro rh1(a) %}
  {{ a }} <d f>16 <c ees> <d f> | <ees g>4.\) |
{% endmacro %}

{% macro rh2(a) %}
  {{ a }} <a c>16 <g bes> <a c> |
  <bes=' d>8. <a c>16 <g bes> <a c> |
  <bes=' d>8. <a c>16 <g bes> <bes d> | <a c>4.\) |
  <a=' c>8.\( <g bes>16 <fis a> <g bes> |
  <a=' c>8. <g bes>16 <fis a> <g bes> |
  <a=' c>8. <c ees>16 <bes d> <a c> | <g bes>4.\) |
  <g=' bes>8.\( <f a>16 <ees g> <f a> |
  <g=' bes>8. <f a>16 <ees g> <f=' a> |
{% endmacro %}

{% macro rh3() %}
  <ees=' g>16\( <d f> <c ees> <d f> <ees g> <f a> |
  <g=' bes>16 <a c> <bes d> <c ees> <d f>^\tRit <c ees> |
  <bes=' d>8. <c ees>16\> <bes d> <a=' c> |
{% endmacro %}

{% macro lh1() %}
  ees=8[ c@m! cm8] | ees[ c@m! cm8] | d[ c@m! cm8] |
  d=8[ c@m! d@7!8] | g,8 gm! f' |
  ees=8 eesM! eesM | d[ ees@M! eesM8] | c=[ ees@M! eesM8] |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Andante cantabile"
  \clef treble
  \key g \minor
  \time 3/8
  {{ rh2("<bes'=' d>8.\\(\\p") }}
  <g=' bes>8. <g ees'>16 <bes g'> <ees bes'> | <bes f'>4.\) |
  <f'='' aes>8.\(_\dCre <ees g>16 <d f> <ees g> |
  <f='' aes>8. <ees g>16 <d f> <ees g> |
  <f='' aes>8. <ees g>16 <d f> <f aes> | <ees g>4.\) |
  {{ rh1("<ees='' g>8.\\(\\mf") }} {{ rh1("<ees,=' g>8.\\(\\p") }}
  {{ rh3() }} \af 4.\! <g=' g'>4.\) |

  \duo {
    \stemDown <ees''='' g>8.\(\p^\tATem <d f>16_\dCre <c ees> <d f> |
    <ees='' g>8. <d f>16 <c ees> <ees g> |
    <d='' f>8. <c ees>16 <bes d> <c ees> | \stemUp <d='' f>4.\) |
  } { s4. | s4. | s4. | r8. aes'='16( g f=') | }
  <c='' ees>8.\(_\dDim <bes d>16 <a c> <bes d> |
  <c='' ees>8. <bes d>16 <a c> <bes d> |
  <c='' ees>8. <bes d>16 <a c> <g ees'> | <fis=' d'>4\) r8 |

  {{ rh2("<bes=' d>8.\\(\\p") }}
  <g=' bes>16 <f a> <ees g> <f a> <g bes> <a c> |
  <bes=' d>16 <c ees> <d f> <ees g> <f a> <g bes>\) |
  <f,=' aes>8.\( <ees g>16 <d f> <ees g> |
  <f=' aes>8. <ees g>16 <d f> <ees g> |
  <f=' aes>16 <ees g> <d f> <ees g> <f aes> <g b> |
  <a=' c>16 <b d> <c ees> <d f> <ees g> <f aes>\) |
  {{ rh1("<ees='' g>8.\\(") }} {{ rh1("<ees,=' g>8.\\(") }} {{ rh3() }}
  \af 4.\! \duo { <g'=' g'>4. } { r8 <d'=' bes'>4 } <>\) \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \minor
  g,=,8( gm!)-. gm-. | fis'[( g@m!)-. gm8]-. |
  f=8[_\aSim g@m! e8] | {{ lh1() }}
  d=8[ bes@M! besM8] | d[ f@m! fm8] | c[ f@m! fm8] |
  b=,8[ f@d! g@7!8] | c8 cm! bes |
  \rep 2 { a=,8[ c@m! cm8] | r16 a16( bes a gis a=,) | }
  a+c@m!8 r8 r | R4. | d8[ c@m! d+d7!8] |
  \duo { r8 gm! r | } { g,=,4 f=,8 | }

  ees,=,8 eesM! eesM | f f7! f7 |
  bes=,8 besM! besM | b[ f@d! g@7!8] |
  c=8 cm! cm | bes[ c@m! cm8] |
  a=,8[ c@m! cm8] | d16( ees d c bes a=,) |

  g=,8 gm! gm | fis'[ g@m! gm8] | f[ g@m! e8] |
  {{ lh1() }} | ees@M!8 r8 r |
  d=8[ f@m! fm8] | c[ f@m! fm8] |
  b=,8[ f@d! fd8] | g@7! r8 r |
  c=8 cm! bes | r16 a16( bes a gis a) |
  a=,8[ c@m! cm8] | r16 a16( bes a gis a) |
  a+c@m!8 r8 r | R4. | d=8[ c@m! d+d7!8] |
  \duo { r8 gm!4 | } { g,=,4. | }
}
{% endmacro %}
