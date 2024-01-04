{% macro rh1(a) %}
  {{ a }} ees d\< ees e f e \af 16\! ees |
  d=''8)-. \acc { cis'='''8 } d\> \af 4\! d,=''4 |
  d,='16( ees d\< ees e f e \af 16\! ees |
  d='8)-. \acc { cis'=''8 } d\> \af 8..\! d,='4 |
{% endmacro %}

{% macro rh2() %}
  e='8-. e( g)-.  g-. | d4-- d='-- |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} d@7! d8 g@M! | fis8 d@7!4 d78 |
  d=8 d7! d g@m! | fis=8 d@7!4 d78 |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  {{ rh1("d''=''16(\\p") }}
  \repeat volta 2 {
    b'='8\mp b a( g) | a4( e) | a8 a g fis | g4 d |
    {{ rh2() }}
    {{ rh2() }}
    \alternative {
      \volta 1 { {{ rh1("d'=''16(") }} }
      \volta 2 {
        {{ rh1("d'=''16(") }}
        a'='8 a e fis | g4 <g=' b d g>-> \bar "|."
      }
    }
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  {{ lh1("fis=8-\\stBass") }}
  g,=,8 gM! fis'( e) | a, a7!4 a78 | d d7!4 d78 |
  \rep 2 { g,=,8 gM!4 gM8 | c=8 cM!4 dM8 | }
  g=,8 gM!4 gM8 |
  {{ lh1("fis'=8") }}
  {{ lh1("fis=8") }}
  fis=8 d@7! d=8 d7 | g+gM!4 g+gM-> |
}
{% endmacro %}
