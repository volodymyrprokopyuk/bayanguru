{% macro rh1(a) %}
  {{ a }} a g a g8) c-. | g16( a g a g8) e'-. | e( d16 c d8) b='-. |
{% endmacro %}

{% macro rh2() %}
  e=''16( d c d e8) c-. | d( b16 c d8) b-. | c( a16 b c8) a='-. |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} cM! g c@M | c8 cM g c@M | b8 g@7! g=,8 g7 |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 2/4
  \repeat segno 2 {
    \volta 1
    {{ rh1("g'='16(\\mf") }} | d( c16 b c8) a-. |
    {{ rh1("g='16(") }} | d( c) c=''4 \fine \bar "||"

    \volta 2
    {{ rh2() }} | d( b16 c d8) b-. |
    {{ rh2() }} | g4-> g='-> \bar "||"
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  {{ lh1("c=8-\\stBass") }} | c8 cM! g c@M |
  {{ lh1("c=8") }} | c=8( cM!) cM4 |

  \rep 3 { d=8 d7! fis d@7 | g,8 gM! b=, g@M | }
  d=8 d7! fis d@7 | g,=,8( gM!) gM4-> |
}
{% endmacro %}
