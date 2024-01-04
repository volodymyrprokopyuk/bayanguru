{% macro rh1(a) %}
  {{ a }} <c f a> <a c f> | <bes d> <bes d f> <bes d g> |
  <c=' f a>4-> <a c f> <c=' f a> |
{% endmacro %}

{% macro rh2(a) %}
  {{ a }} <g c e> <c e g> | <g=' b d>4 4 4 |
{% endmacro %}

{% macro rh3(a) %}
  {{ rh2("<c='' e g>4\\ff") }} {{ rh2("<c='' e g>4") }}
  <f=' a d>4 {{ a }} 4 4 |
{% endmacro %}

{% macro rh4(a, b) %}
  {{ rh1(a) }} | <c=' e g>4-> <g c e> <c e g> |
  <a= c f>4-> <a c> {{ b }} \af 4\! <a c d> | <a c e>4\mf 4 4 |
  \duo { <d'=' f>4( <c e> <b= d>) | } { gis=2. | }
  <a= c e a>4\< <a c e> \af 4\! a-> |
  {{ rh1("<f'=' a c>4->\\f") }} | <e gis b>-> <b e gis> <e=' gis b> |
{% endmacro %}

{% macro rh5() %}
  r4\f <c=' e g>4 4 | 2 r4 | r4 <b e g>4 4 | 4 <g b e> <f b d> |
  r4\mp <e= g c>4 4 | r4 <d'=' f g>4_\dCre 4 |
{% endmacro %}

{% macro rh6(a) %}
  {{ a }} r r | r4 <b e g>4_\dCre 4 | <b= e gis>4 r r | r4 4 4 |
{% endmacro %}

{% macro lh1() %}
  \rep 2 { c=8 r cM! r cM r | g=,8 r gM! r gM r | } d'=8 r dm! r dm r |
{% endmacro %}

{% macro lh2(a, b) %}
  {{ a }} r fM! r fM r | bes r besM! r besM r |
  f=,8 r fM! r fM r | c' r {{ b }}! r {{ b }} r |
  f,=,8 r fM! r fM r | e' r a@m! r8 am r |
  e=8 r e7! r e7 r | a,2(-> g4) | f8 r fM! r fM r |
  bes=,8 r besM! r besM r | f r fM! r fM r | e'= r eM! r eM r |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Con moto, energico"
  \clef treble
  \key f \major
  \time 3/4
  \repeat segno 2 {
    \volta 1
    {{ rh4("<f'=' a c>4->\\f", "\\>") }}
    <e=' a c>4-> <c e a> <e a c> | <fis a>\< <fis a c> \af 4\! <fis a d> |
    <g=' b e>4 <e g b> <g b e> | <b f' g> <g b d> <b f' g> |
    {{ rh3("\\sf") }}
    a='4\mf <e a c> <f a d> | <a c e>4_\dCre 4 4 | <gis b e>4 4 4 |
    {{ rh3("_\\dCre") }} | <a=' c dis>4 4 4 |
    <a=' c e>4\f 4_\dDim <gis b e> | <gis b e> <g bes e>4 4 |
    {{ rh4("<f=' a c>4->\\mp", "\\<") }}
    <e=' a c>4_\dCre <c e a> <e bes' c> | <c e g> <f a c> <c f a> |
    <g'=' bes c>4 <g bes d> <g bes e> | <a c f> <f a c> f='-> \fine \bar "||"

    \volta 2
    \key c \major
    \repeat volta 2 {
      {{ rh5() }} | r4 <c=' f g>4 4 | r4 <b d g>4 4 |
      {{ rh5() }} | <c=' e a>4^\tRit 4 4 | <b= e gis>2.\mf |
    }
    {{ rh6("<b= e g>4\\p^\\tATem") }}
    <c=' e a>4\mf r r | <b e g>_\dDim r r | <a e' fis> r r | <g b e> r r |
    {{ rh6("<b= e g>4\\p") }}
    <c=' e a>2 r4 | r4 4 4 | <c g' bes c>2.~\sf | 4 c'='' c \bar "||"
    \keyChangeBeforeBar \key f \major
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key f \major
  {{ lh2("f,=,8-\\stBass", "c7") }}
  a,=,8 r am! r am r | e' r a@m! r8 am r |
  e=8 r em! r em r | d r g@7! r8 g7 r |
  {{ lh1() }} | a r am! r d r |
  a=,8 r am! r am r | e' r eM! r eM r |
  {{ lh1() }} | f, r fM! r fM r |
  e'=4 e d | d c c | {{ lh2("f,=,8", "cM") }}
  a,=,8 r am! r g r | c@7!8 r8 f r fM! r8 |
  c'=8 r c7! r c7 r | f, r fM! r f=,4-> |

  \key c \major
  c'=2.~-\puBass | c4 e( f | g2.~ | g2) r4 | c,2.\( | b | a | g\) |
  c=2.~ | c4 e( f | g2.~ | g2) r4 | c,2.\( | b | a4 a a | e'2.\) |
  \rep 2 { r4 e=4 e | e=2. | } \rep 5 { r4 e=4 e= | }
  \rep 2 { e=2. | r4 e e= | } e2.~ | e4 e e | e=2. |
  \key f \major
}
{% endmacro %}
