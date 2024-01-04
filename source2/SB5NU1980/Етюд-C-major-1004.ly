{% macro rh1(a, b = "") %}
  {{ a }} <e c'>16) 16( {{ b }} <c g'>16) 16( {{ b }} <g e'>) <e c'>-. <g d'>-. |
{% endmacro %}

{% macro rh2(a) %}
  {{ a }} <g d'>) <c e>-. g'-. <b, g'>-. <d a'>-. <g b>-. <f d'>-. |
{% endmacro %}

{% macro rh3(a) %}
  {{ a }} <g d'> <e c'> <g d'> <e c'> <g d'>) <e' c'>-. <g='' d'>-. |
{% endmacro %}

{% macro rh4(a, b = "") %}
  {{ a }} <e c'>16) 16( {{ b }} <c g'>) <e, c'>( {{ b }} <g d'>) <c e>-. g'='-. |
{% endmacro %}

{% macro rh5(a) %}
  {{ a }} <e c'>) <d b'>(-> <c a'>) <b gis'>-.-> <gis e'>-. <a f'>-. <gis e'>-. |
  <f=' d'>16(-> <e c'>) <d b'>(-> <c a'>) <b gis'>-.-> <gis e'>-. <e' c'>-. <d=' b'>-. |
{% endmacro %}

{% macro rh6() %}
  <c=' a'>16( <e b'> <c a'> <e b'> <c a'> <e b'>) <e c'>-. <a e'>-. |
  <c='' a'>16( <e b'>) <e c'>( <a e'>) <a e'>( d) <a f'>-. e'='''-. |
{% endmacro %}

{% macro rh7() %}
  <c=' a'>16( <e b'>) <e c'>( <a e'>) <c a'>16( <e b'>) <e c'>-. <a='' e'>-. |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} e7!16 e7 e78 d@m! | e=8 e7!16 e7 e78 e7 |
{% endmacro %}

{% macro lh2(a) %}
  e'=8 16 16 8 8 | 8 16 16 e8 e7! | a,=, am!16 am am8 {{ a }} |
{% endmacro %}

{% macro lh3(a) %}
  c=16 16 8 8 8 | 16 16 16 16 8 8 | c=8 cM! g g7! |
{% endmacro %}

{% macro lh4() %}
  \rep 2 { \duo { r8 cM!16 cM cM8 cM | } { c=4 r } } c8( cM!)-. g=,( g7!)-. |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Allegro moderato"
  \clef treble
  \key c \major
  \time 2/4
  {{ rh1("<g''='' e'>16(\\p") }} {{ rh1("<g=' e'>16(") }}
  {{ rh2("<e= c'>16(") }} {{ rh3("<e=' c'>16(") }}
  {{ rh1("<g='' e'>16(") }} {{ rh4("<g=' e'>16(") }}
  {{ rh2("<e=' c'>16(") }}
  <e='' c'>16( <g d'> <e c'> <g d'> <e='' c'>8) r |

  {{ rh1("<g='' e'>16(->\\mf", "->") }} {{ rh1("<g=' e'>16(->", "->") }}
  {{ rh2("<e= c'>16(\\p") }} {{ rh3("<e=' c'>16(_\\dCre") }}
  {{ rh1("<g='' e'>16(->", "->") }} {{ rh4("<g=' e'>16(->", "->") }}
  {{ rh2("<e=' c'>16(") }}
  <e='' c'>16(\>^\tRit <g d'> <e c'> <g d'> \af 16\! <e c'>) %
  <gis='' c>16[-.\f <a f'>-. <gis='' e'>]-. |

  {{ rh5("<f='' d'>16(->^\\tATem") }} {{ rh6() }}
  {{ rh5("<f,='' d'>16(->") }} {{ rh7() }}
  <a='' c e a>16 \arpeggio <c e a>16 \arpeggio %
  <c=''' e a>16 \arpeggio 16 \arpeggio 16 \arpeggio %
  <gis='' e'>16[-.\p <a f'>-. <gis='' e'>]-. |

  {{ rh5("<f='' d'>16(->") }} {{ rh6() }}
  {{ rh5("<f,='' d'>16(->") }} {{ rh7() }}
  \ottava #1
  <a='' c e a>16 \arpeggio <c e a>16 \arpeggio %
  <c=''' e a>16 \arpeggio 16 \arpeggio %
  <d=''' f b>16^\tRit \arpeggio <d f g>16 \arpeggio %
  <d=''' f g>16 \arpeggio 16 \arpeggio |

  {{ rh1("<g=''' e'>16(^\\tATem") }}
  \ottava #0
  {{ rh1("<g='' e'>16(") }} {{ rh2("<e=' c'>16(") }}
  <e='' c'>16( <g d'> <e c'> <g d'> <e c'> <g d'>) <e c'>-. <g d'>-. |
  {{ rh1("<g='' e'>16(") }} {{ rh1("<g=' e'>16(_\\dCre") }}
  {{ rh2("<e= c'>16(") }}
  <e=' c'>16( <g d'>) <e' c'>-. <g d'>-. <e='' c'>8 r |

  {{ rh1("<g='' e'>16(->\\ff", "->") }} {{ rh1("<g=' e'>16(->", "->") }}
  {{ rh2("<e= c'>16(") }} {{ rh3("<e=' c'>16(") }}
  {{ rh1("<g='' e'>16(->", "->") }} {{ rh4("<g=' e'>16(->", "->") }}
  {{ rh2("<e=' c'>16(") }}
  <e='' c'>16(-> <g e'>) <f b>(-> <g d'>) <e='' c'>4->\sf \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  c=8-\stBass r r4 | c8 r r4 | c8 r g r | c r c r |
  c=8 r r4 | c8 r r4 | c8 r g r | c=[ cM! cM] r |

  c=8[( cM!)-. cM] r | c[( cM!)-. cM] r | c cM! g g7! | c[ cM! cM] r |
  c=8[ cM! cM] r | c cM! r4 | c8 cM! g g7! | c=[ cM! cM16] r r8 |

  {{ lh1("e=8") }} a,=,8 am!16 am am8 am | a am!16 am am8 am |
  {{ lh1("e'=8") }} a,=,8 am!16 am am8 am | a+am!8 r r4 |

  {{ lh2("am") }} | a am!16 am16 am8 r |
  {{ lh2("r") }} | a+am!8 r g+g7! r |

  {{ lh3() }} | c cM!16 cM cM8 cM |
  {{ lh3() }} | c cM! c+cM r |

  {{ lh4() }} \duo { r8 cM!16 cM cM8 cM | } { c=4 r }
  {{ lh4() }} c+cM!8 c+g@7! c+cM!4 |
}
{% endmacro %}
