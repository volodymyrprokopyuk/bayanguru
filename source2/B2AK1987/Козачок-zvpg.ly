{% macro rh1(a) %}
  {{ a }} a-. b-. c-. | d16( e d cis d8 g) |
  g,='8-. a-. b-. c-. | d16( e d cis d=''8) r |
{% endmacro %}

{% macro rh2(a) %}
  {{ a }} ais b d) a( gis a d) | b( ais b e) d8( c ) |
  b='16( ais b d) a( gis a d) | b( c b a=' %
{% endmacro %}

{% macro rh3(a) %}
  {{ a }} <a c>16 \acc { e'=''8 } <b d>8( <ais cis>)-. |
  \acc { e'=''8 } <b d>8( <ais cis>)-. <b d> <gis e'> |
  <a=' c>8-.\< <fis d'>-. <g b>-. \af 8\! <g c>-. |
  <g=' a>8\> \acc { b='8 } <c, fis a>8 \af 4\! <b= g'>4-- |
{% endmacro %}

{% macro rh4(a) %}
  {{ a }} <fis a> | <g bes>8 8 <fis a>4-> | <g bes>8 8 <fis=' a>8 8 |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} d' | g,8 bes d@M![( d8]) | g,16( a bes c) d@M!8[( d=8]) |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Presto
  \clef treble
  \key g \major
  \time 2/4
  {{ rh1("g'='8-.\\f") }}
  {{ rh1("g,='8-.") }}

  \repeat volta 2 {
    fis=''8-.\mp a-. d,-. fis-. | g16( fis g a b8) g-. |
    fis=''8-. a-. d,-. fis-. |
    \alternative {
      \volta 1 { g=''16( fis g a b=''8) r | }
      \volta 2 { g=''16( a g fis g=''8) r | }
    }
  }

  \repeat volta 2 {
    g,='8\f g' e(-> d16 c) | b( ais b d a gis a d) |
    g,='8 g' e(-> d16 c) |
    \alternative {
      \volta 1 { b='16( ais b d a='8) r | }
      \volta 2 { b='16( c b a g='8) r | }
    }
  }

  {{ rh2("b='16(\\mf") }} g4) |
  {{ rh2("b='16(") }} g='8) r \bar "||"

  \repeat segno 2 {
    \volta 1
    g='8\f g' e(-> d16 c) | b8-. d-. a-. d-. |
    b='8-. d-. \acc { d=''8 } c16(_\dCre b c a) |
    b='8-. d-. a-. d-. | b-. a-. g='4--\f |

    {{ rh3("<g=' b>8.\\mf") }}
    {{ rh3("<g'=' b>8.") }} \fine \bar "||"

    \volta 2
    \key g \minor
    {{ rh4("<g'=' bes>4->\\f") }}
    \acc { c'=''8 } bes16( a g fis g4)-- |
    {{ rh4("<g=' bes>4->") }}
    \acc { c'=''8 } bes16(\> a g fis \af 4\! g='4)-- \bar "||"
    \keyChangeBeforeBar
    \key g \major
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  g+gM!8-\stBass r g+gM r | g+gM r g+gM r |
  g+gM!8 r g+gM r | g+gM g+gM g+gM r |
  g+gM!8 r g+gM r | d+d7! r g+gM! r |
  g+gM!8 r g+gM r | d+d7! d+d7 g+gM! r |

  d=8 dM! fis, d@M | g8 gM! b g@M |
  d=8 dM! fis, d@M | g8 gM! g gM | g=, gM! g+gM r |

  \rep 2 { g=,8 gM! c cM! | g gM! d'= d7! | }
  d+g@M!8[ d+d7!8] g+gM! r |

  g,=,8 gM! d' d7! | g, gM! c cM! |
  g=,8 gM! d' d7! | g, gM! b g@M |
  g=,8 gM! d' d7! | g, gM! c cM! |
  d=8 g@M! d=8 d7! | g+gM! d+d7! g+gM! r |

  g,=,8 gM! c cM! | g gM! fis d@7! |
  g=,8 gM! a d@7! | g8 gM! fis=, d@7! | g+gM!8 d+d7! g+gM!4 |

  g=,8 gM! g gM | g gM! g-. e-. |
  a=,8-. d,-. g-. e-. | c'-. d-. g@M![( g,8]) |
  g=,8 gM! g gM | g gM! g+gM8 \noBeam e-. |
  a=,8-. d,-. g-. e-. | c'-. d-. g,=,4-- |

  \key g \minor
  {{ lh1("g=,4") }} g@m![( d8]) g@m[( d=8]) |
  {{ lh1("g,=,4") }} g+gm! d+d7! g+gm!4 |
  \key g \major
}
{% endmacro %}
