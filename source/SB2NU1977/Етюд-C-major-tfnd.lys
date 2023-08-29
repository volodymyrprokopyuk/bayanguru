{% macro t1(a, b, c) %}
  r16{{ a }} {{ b }}( {{ c }} {{ b }}) %
  r16 {{ b }}( {{ c }} {{ b }}) |
{% endmacro %}

{% macro t2(a, b) %}
  \rep 2 { r16 {{ a }}( {{ b }} {{ a }}) } |
{% endmacro %}

{% macro t3(a, b) %}
  r16 {{ a }}( \rep 2 { {{ b }} {{ a }} } {{ b }} {{ a }}) |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Andante
  \clef treble
  \key c \major
  \time 2/4
  r16\mf <g'=' e'>16( <c g'> <g e'>) r16 <g=' e'>16( <c g'> <g e'>) |
  {{ t3("<f=' d'>16", "<a f'>") }}
  {{ t2("<d=' b'>16", "<g d'>") }}
  {{ t3("<e=' c'>16", "<g e'>") }}
  {{ t2("<e=' c'>16", "<a e'>") }}
  {{ t3("<f=' d'>16", "<a f'>") }}
  {{ t2("<d=' b'>16", "<g d'>") }}
  r16 <e=' c'>16( <g e'> <c g'> <e='' c'>4) \bar "||"

  \key e \minor
  {{ t1("\\f", "<b=' g'>16", "<e b'>") }}
  {{ t3("<c='' fis>16", "<e a>") }}
  {{ t2("<a=' dis>16", "<b fis'>") }}
  {{ t3("<g=' e'>16", "<b g'>") }}
  {{ t2("<b=' g'>16", "<e b'>") }}
  {{ t3("<c='' a'>16", "<e c'>") }}
  {{ t2("<c='' fis>16", "<d a'>") }}
  r16^\tRit <b=' g'>16( \rep 2 { <d='' b'> <b=' g'> } <d b'> <b=' g'>) \bar "||"

  \keyChangeBeforeBar \key c \major
  {{ t1("\\mf^\\tATem", "<g=' e'>16", "<c g'>") }}
  {{ t3("<f=' d'>16", "<a f'>") }}
  {{ t2("<d=' b'>16", "<g d'>") }}
  {{ t3("<e=' c'>16", "<g e'>") }}
  r16 <g=' e'>16( <c g'> <g e'>) r16 <c g'>( <e c'> <c g'>) |
  {{ t3("<c='' a'>16", "<f c'>") }}
  r16 <e='' c'>16( <g e'> <e c'>) r16 <d b'>( <g d'> <d b'>) |
  \ottava #1 r16 <e='' c'>16( <g e'> <c g'> <e=''' c'>4) \ottava #0 \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  c=4-\stBass cM! | d dm! | g, g7! | c cM! |
  a=,4 am! | d dm! | g, g7! | c= cM! |

  e=4 em! | a, am! | b b7! | e em! |
  e=4 em! | a, am! | d d7! | g,=, g7! |

  c=4 cM! | d dm! | g, g7! | c cM! |
  bes=,4 c@M! | a4 f@M! | g4 g7! c= cM! |
}
{% endmacro %}
