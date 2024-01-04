{% macro rh1() %}
  fis='8)-. a-. c-. e-. | d b4 b8 | d( e16 d c8)-. a='-. |
{% endmacro %}

{% macro rh2(a) %}
  {{ a }} e16 g8.( e16 | d8)-. b4 b='8 |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  \partial 8 { \tuplet 3/2 { g'='16(\mf a g=' } | }
  \repeat volta 2 {
    {{ rh1() }} | g b4 g8( | {{ rh1() }}
    \alternative {
      \volta 1 {
        g='8 b g %
        \tuplet 3/2 { g='16[ \sSlur fd #'((bs . 2.5) (wd . 2)) ( a g='] | }
      }
      \volta 2 { g='8) b g=' r | }
    }
  }

  \repeat volta 2 {
    {{ rh2("c=''8.\\f") }} d( e16 d c8)-. a-. | g b r g |
    {{ rh2("c=''8.") }} d( e16 d) c b c a |
    \alternative {
      \volta 1 { g='8 b g=' r | }
      \volta 2 { g='8 b g=' \bar "|." }
    }
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  \partial 8 { r8 | }
  d=8-\stBass d7! d d7 | g, gM! b g@M | a8 d@7! d8 d7 | g, gM! b g@M |
  d=8 d7! d d7 | g, gM! b g@M | d8 d7! d8 d7 | g, gM! g r |
  g=,8 gM! g+gM r |

  c=8 cM! e c@M | g,8 gM! b g@M | a8 d@7! d8 d7 | g, gM! b g@M |
  c=8 cM! c cM | g gM! b g@M | a8 d@7! d8 d7 | g, gM! g+gM r |
  g=,8 gM! g+gM %
}
{% endmacro %}
