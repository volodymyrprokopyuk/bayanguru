{% macro rh1(a) %}
  {{ a }} e) e-. e-. <d b'>( e) e-. e-. |
  <e=' c'>16( a) a-. c-. <f, d'>( b) b-. d=''-. |
{% endmacro %}

{% macro rh2(a) %}
  <e,=' c'>16( a) a-. c-. <d, b'>( gis) gis-. b-. |
  <c,=' a'>16-. b'-. <e, c'>-. a-. <d,=' gis b>8 r |
{% endmacro %}

{% macro rh3(a) %}
  {{ a }} g) g-. g-. <f d'>( g) g-. g-. |
  | <g e'>16( d') <g, c>( e') <f, d'>( g) g-. g-. |
  | <e c'>16( g) g-. c-. <d, b'>( g) g-. a-. |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} am! e' e7! | a, am! d dm! | e a@m! e8 e7! | a, am! e e'32( d c b=,) |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  {{ rh1("<c'=' a'>16(\\f") }} {{ rh2() }}
  {{ rh1("<c=' a'>16(") }}
  <e,=' c'>16( e') e-. <c a'>-. <c a'>( gis') <b, d gis>-. b'-. |
  <c,='' e a>8-. <b d gis>-. <c e a> a'32( g fis g='' |

  {{ rh3("<e='' c'>16") }}
  <d,='' g b>8 <c fis a> <b d g> \acc { g='16 g } g16 g |
  {{ rh3("<e=' c'>16(") }}
  <d,=' g b>8^\tRit <c fis a> <b d g> g'32( f e d=' |

  {{ rh1("<c=' a'>16\\p^\\tATem") }} {{ rh2() }}
  <c=' a'>16(^\tRit e) e-. e-. <d b'>( e) e-. e-. |
  <e=' c'>16( a) a-. <e c'>-. <f d'>( b) b-. <f d'>-. \fermata |
  <e=' c'>16(^\tATem e') e-. <c a'>-. <c a'>( gis') <b, d gis>-. b'-. |
  <c,='' e a>8-> <b d gis>-> <c='' e a>-> r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \minor
  {{ lh1("a,=,8-\\stBass") }}
  a=,8 am! gis e@7! | g8 a@m! f8 d@m! | e'8 a@m! e8 e7! | a+am! e+e7! a+am! r |

  \rep 2 {
    c=8 cM! g g7! | \rep 2 { c=8 cM! g=, gM! | } d+g@M![ d+d7!8] g+gM! r |
  }

  {{ lh1("a=,8") }}
  \duo { r8 am! r e@7! | r8 a@m! r8 d@m!-\fermata | }
  { a,=,4( gis g f=,) \fermata | }
  e=8 a@m! e8 e7! | a,-> e=,-> a+am!-> r |
}
{% endmacro %}
