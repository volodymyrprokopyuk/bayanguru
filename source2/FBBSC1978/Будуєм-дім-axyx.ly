{% macro rh1(a) %}
  {{ a }} c-. a-.-> r | c=''-. c-. a-.-> r |
  bes='8-.->\< bes-. a-. \af 8\! g='-. |
{% endmacro %}

{% macro rh2() %}
  \rep 2 { g='8-.\< g-. \af 8\! c=''-. r | } | d-. d-. a-. b='-. |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} r f-.-> r | a-. r f-.-> r | c-.-> r d-. e='-. |
{% endmacro %}

{% macro lh2() %}
  \rep 2 { f='4( e='8)-. r | }
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key f \major
  \time 2/4
  \repeat segno 2 {
    \volta 1
    {{ rh1("c''=''8-.\\mf") }} | a-. d-. c-.-> r |
    {{ rh1("c=''8-.") }} | f-. a-. f='-.-> r \fine \bar "||"

    \volta 2
    {{ rh2() }} | c( a g) r | {{ rh2() }} | c-. c-. c=''-. r \bar "||"
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef treble
  \key f \major
  {{ lh1("a'='8-.-\\frBass") }} | f-. r e-.-> r |
  {{ lh1("a='8-.") }} | f-. c-. f='-.-> r |

  {{ lh2() }} | f-. r g-. r | e-. r r4 |
  {{ lh2() }} | f4( g8 f | e)-. g-. e='-. r |
}
{% endmacro %}
