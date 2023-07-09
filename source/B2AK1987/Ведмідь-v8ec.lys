{% macro rh1() %}
  f=4-> ees8-. d-. | ees4-- c-- | bes8-. g-. bes-. d=-. |
{% endmacro %}

{% macro rh2() %}
  \acc { g'=16 a b } c4->\< \af 4\! g-- | \af 2\! <c,= fis bes>2\> |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Grave
  \clef bass
  \key c \minor
  \time 2/4
  \acc { g=16 a b } c4->\mp bes8-- aes-- |
  g=4-> c,-- | d8->\< ees-- f-- \af 8\! aes-- | \af 2\! <fis g>2->\> |
  {{ rh1() }}
  \acc { b=,8 } c8\< r \af 4\! r4 |
  \acc { g'=16 a b } c4-> bes8-. aes-. |
  \duo { g=2~ | g4 c | g8-. c-. b-. bes=-. | }
  { ees=8-. d-. ees-. c-. | d-. ees-. f-. aes-. | \acc { fis=8 } g2 | }
  {{ rh1() }}
  \acc { b=,8 } c2 |
  {{ rh2() }}
  {{ rh2() }}
  \acc { g'=16 a b } c4->_\dDim g-. | R2 | c='4-> r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \minor
  \grace { s16 s s } c+cm!4-\puBass g,4 |
  \rep 6 { c=4-> g=, | }
  c=8-> g-. a-. b-. | c+cm!4 g |
  \rep 4 { c=4-> g=, | }
  c=8-> bes aes g |
  \rep 2 { c=4-> g=, | }
  \rep 2 { c=4-> g | aes-> ees'= | }
  \rep 2 { c=4-> g=, | }
  c=4-> r |
}
{% endmacro %}
