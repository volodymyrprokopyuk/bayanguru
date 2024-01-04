{% macro rh1(a) %}
  {{ a }}4--\< \af 4\! r | r8 {{ a }}8[(-. 8-. 8])-. |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Presto
  \clef treble
  \key c \major
  \time 2/4
  <e'=' g c>4--\f\< \af 4\! r | r8 <e g c>8[(-. 8-. 8])-. |
  | {{ rh1("<f=' g b>") }} {{ rh1("<c=' g' bes>") }}
  | {{ rh1("<c=' f a>") }} {{ rh1("<c=' f aes>") }}
  | {{ rh1("<c=' e g>") }} {{ rh1("<b= d f g>") }}
  <c=' e g>4--\> \af 4\! r | R2 \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  r16 c,=,16(-\puBass d e f g a b | c4) r | r16 d,( e f g a b c | d4) r |
  r16 e,=,16( f g a bes c d | e4) r | r16 f,( g a bes c d e | f4) r |
  r16 f,=,16( g aes bes c d e | f4) r |
  \rep 2 { r16 g,=,( a b c d e f | g=4) r | }
  r16 c,=16( b a g f' e d | c=4) r |
}
{% endmacro %}
