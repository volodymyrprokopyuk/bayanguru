{% macro rh1(a) %}
  aes'=''16(-> f)-. c-. aes-. g'(-> e)-. c-. g-. |
  f'=''16(-> c)-. aes-. f-.  aes-. c-. f-. {{ a }} |
{% endmacro %}

{% macro rh2() %}
  c='''16(-> aes)-. f-. c-. bes'(-> g)-. e-. c-. |
  aes'=''16(-> f)-. c-. aes='-. %
{% endmacro %}

{% macro rh3(a, b) %}
  {{ a }} c,16 c g'8-> c,16 c | f8\< f f f16\( \af 16\! g |
  aes='8 g16 aes bes\> aes g f | e8 \af 16.\! c c\) c16 c |
  aes'='8-> c,16 c g'8-> c,16 c | f8 f f g16\(\< aes |
  g='8 f16 \af 16\! ees d8 g16 g, | c8 c c'\) c16\( des |
  c=''8 bes16 aes g8 aes16 bes | c8 c c\)\< f16\( ges |
  f=''8 ees16 des c8 f16 \af 16\! ees | des8 bes bes\) ees16\( des |
  c=''8 bes16 aes g8 c16 e, | f8 f f\) f16\( {{ b }} des |
  c='8 bes16 aes g8 c16 e=' |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} r c+cM! r | f+fm!8 r f+fm r |
{% endmacro %}

{% macro lh2(a) %}
  f,=,8 r c@M! r8 | f r fm! r | {{ a }} | c= r c7! r |
{% endmacro %}

{% macro lh3() %}
  aes+f@m!8 r8 bes+besm! r | c+cM! r c+cM r |
  {{ lh1("f+fm!8") }} | g+c@m!8 r8 g+gM! r |
  c+cM! r c+c7! r | f+fm!8 r c+c7! r |
  f+fm!8 r a+f@7! r8 | bes+besm!8 r f+f7! r |
  bes+besm!8 r g+bes@m r8 | aes+f@m!8 r8 c+c7! r |
  f+fm!8 r bes+besm! r | c+f@m!8 r8 c+c7! r |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key f \minor
  \time 2/4
  r4 r8 c'='16\f c | {{ rh3("aes'='8->", "") }}
  f='8\) c' f c16\mf c='' |

  {{ rh1("g=''16-.") }}
  aes=''16(-> c,)-. f-. aes-. bes(-> aes)-. g-. f-. |
  e=''16(-> c)-. b-. c-. des-. c-. b-. c=''-. |
  {{ rh1("aes=''16-.") }}
  g=''16(-> e)-. c-. g-. f'(-> d)-. b-. g-. |
  c=''16(-> g)-. e-. c-. g'-. c-. g'-. bes-. |
  {{ rh2() }} f'=''16-. a-. c-. ees-. |
  f='''16(-> des)-. bes-. f-. ees'(-> c)-. a-. f-. |
  des'='''16(-> bes)-. f-. des-. f-. g-. bes-. des-. |
  {{ rh2() }} f'=''16(-> des)-. bes-. g-. |
  c=''16(-> aes)-. f-. c-. e'(-> c)-. bes-. g-. |
  f'=''16(->\> f,)-.^\tRit aes-. c-. \af 8\! f8 c,16\f c=' |

  {{ rh3("aes'='8->^\\tATem", "^\\tRit") }}
  f='8\) <g bes c e>-.-> <f=' aes c f>-.-> r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key f \minor
  R2 | {{ lh1("f+fm!8-\\stBass") }} {{ lh3() }} | f+fm!8 r f+fm r |

  {{ lh2("aes=,8 r bes@m! r8") }} {{ lh2("g=,8 r g7! r") }}
  f,=,8 r c@M! r8 | f r f7! r | bes r f@7! r8 | bes r besm! r |
  c=8 r c7! r | f, r bes@m! r8 | c' r c7! r | f,=,8 r fm! r |

  {{ lh1("f+fm!8") }} {{ lh3() }} | f+fm!8 c+cM!-.-> f+fm!-.-> r |
}
{% endmacro %}
