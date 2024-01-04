{% macro rh1(a, b) %}
  {{ a }} <cis fis ais> {{ b }} <d fis b> <b d fis> <b cis eis> <b d fis> |
  <fis=' b d>8 <fis ais cis> <fis b d> <d fis b> <cis fis ais> <d fis b> |
  <g=' b e>8 <fis b dis> <g b e> <fis ais cis> <fis gisis bis> <fis ais cis> |
  <fis=' b d>8 <fis ais cis> <fis b d> <d fis b> <cis fis ais> <d=' fis b> |
{% endmacro %}

{% macro rh2() %}
  <gis=' d' f>8 <gis d' e> <gis d' f> <a d fis> <a d eis> <a=' d fis> |
{% endmacro %}

{% macro rh3() %}
  <g=' a cis>8 <g a bis> <g a cis> <cis, g' a> <d g b> <e g cis> |
  <fis=' a d>8 <fis a cis> <fis a d> <g bes e> <g bes dis> <g=' bes e> |
  {{ rh2() }}
{% endmacro %}

{% macro rh4(a) %}
  {{ a }} <c e gis> <c e a> <c d fis> <c d eis> <c d fis> |
  <b=' d g>8 <b d fis> <b d g> <g b d> <g b cis> <g=' b d> |
{% endmacro %}

{% macro rh5() %}
  <b=' cis g'>8 <b cis fis> <b cis g'> <g b e> <g b dis> <g b e> |
  <ais=' cis fis>8 <ais cis eis> <ais cis fis> %
  <fis=' ais cis>8 <fis ais bis> <fis=' ais cis> |
{% endmacro %}

{% macro lh1(a, b) %}
  {{ a }} r r d+b@m r8 r | fis+b@m!8 r8 r b+bm r r |
  e+em!8 r r fis+fM! r r | b+bm!8 r r {{ b }} |
{% endmacro %}

{% macro lh2() %}
  e+a@7!8 r8 r a+a7 r r | d+dM!8 r r d+g@m! r8 r | bes+bes7!8 r r a+d@M! r8 r |
{% endmacro %}

{% macro lh3() %}
  a+am!8 r r d+d7! r r | g+gM!8 r r r4. |
{% endmacro %}

{% macro lh4() %}
  e+em!8 r r cis+e@m r8 r | fis+fisM!8 r r r4. |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key b \minor
  \time 6/8
  {{ rh1("<d''='' fis b>8\\mf", "_\\aSta") }} {{ rh1("<d'='' fis b>8", "") }}

  {{ rh3() }} {{ rh2() }} {{ rh3() }}
  <b=' cis g'>8 <a cis fis> <g cis e> <fis a d> <fis a cis> <fis=' a d> |

  {{ rh4("<c'='' e a>8") }} {{ rh4("<c='' e a>8") }}
  {{ rh5() }} {{ rh5() }}

  <eis=' b' d>8 8 8 <cis eis b'>8 8 8 |
  <cis=' fis ais>8 8 8 <ais cis fis>8 8 8 |
  <b= fis' gis>8 8 8 <c fis a>8 8 8 | <cis fis ais>8 8 8 8 8 8 |
  <b= dis ais'>8 8 8 <cis eis ais>8 8 <b eis ais> |
  <ais= fis'>8 8 <gis b fis'> <fis ais fis'> <gis b>[\(_\dCre <ais cis>] |
  <b= d>8 <cis e> <d fis> <e gis> <fis ais> <gis b> |
  <ais=' cis>8 <b d> <cis e> <d fis>^\tRit <b e gis> <cis='' fis ais>\) |

  {{ rh1("<d='' fis b>8\\mf^\\tATem", "") }}
  <d'='' fis b>8 <cis fis ais> <d fis b> <b d fis> <b cis eis> <b d fis> |
  <fis=' b d>8 <fis ais cis> <fis b d> <d fis b> <cis fis ais> <d fis b> |
  <g=' b e>8 <fis b dis> <g b e> <fis ais cis> <e gis> <e fis ais> |
  <d=' fis b>8 <fis b d> <b d fis> <d fis b> r r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key b \minor
  {{ lh1("b+bm!8-\\stBass", "r4.") }} {{ lh1("b+bm!8", "r4.") }}

  {{ lh2() }} | bes+bes7!8 r r a+d@M! r8 r |
  {{ lh2() }} | a+a7!8 r r d+dM! r r |

  {{ lh3() }} {{ lh3() }}
  {{ lh4() }} {{ lh4() }}

  g,=,4.( cis | fis, e') | dis( d | cis2.) | cis( |
  fis,=,4) cis'8 fis,=, r r | R2. | R2. |

  {{ lh1("b+bm!8", "r4.") }} {{ lh1("b+bm!8", "b+bm8 r r") }}
}
{% endmacro %}
