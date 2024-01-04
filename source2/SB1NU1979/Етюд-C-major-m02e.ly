{% macro rh1(a, b) %}
  {{ a }} d16 e f g a {{ b }} b | c8)-. g-. e-. c=''-. |
{% endmacro %}

{% macro rh2(a) %}
  {{ a }} g fis g e g fis g='' |
{% endmacro %}

{% macro rh3() %}
  d=''8-. d-. d( g)-. | c,-. c-. c=''4-- |
{% endmacro %}

{% macro lh1() %}
  c+cM!4 r | R2 | g+gM!4-. g+gM-. | c+cM!8-. c+cM-. c+cM4-- |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Presto
  \clef treble
  \key c \major
  \time 2/4
  {{ rh1("c''=''8(\\mf\\<", "\\af 16\\!") }}
  d=''8( g)-. e( g)-. | d-. d-. d4-- |
  {{ rh1("c=''8(", "") }} {{ rh3() }}

  {{ rh2("d=''16(\\p") }} {{ rh2("d=''16_\\dCre") }}
  {{ rh2("d=''16") }} | d8)-. d-. d4-- |
  {{ rh1("c=''8(\\mf\\<", "\\af 16\\!") }} {{ rh3() }} \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  c+cM!4-\stBass r | R2 | g+gM!4-. g+c@M!-. |
  g+gM!8-. g+gM-. g+gM4-- | {{ lh1() }}

  \rep 3 { g@M!4 c@M!4 | } g@M!8[-. gM8]-. gM4-- | {{ lh1() }}
}
{% endmacro %}
