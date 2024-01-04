{% macro t1(a, b, c) %}
  \afterGrace 15/16 {{ a }} \trill { {{ b }} } | {{ c }} %
{% endmacro %}

{% macro lh1() %}
  b=,8[ g@7! g78 g7] b[ g@7 g78 g7] | c8 cM! cM cM c cM cM cM |
  e=8[ c@M! cM8 cM] e[ c@M cM8 cM] | f[ d@m! dm8 dm] f=[ d@m dm8 dm] |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Lento con espressivo"
  \clef treble
  \key c \major
  \time 4/4
  \repeat volta 2 {
    {{ t1("c''=''1\\(\\p", "b16( c", "d2)\\)") }} r2 |
    {{ t1("d=''1\\(", "c16( d", "e2)\\)") }} r8 g,\( c e |
    \af 4. { \markupInsideSlur <>^\markup \dTurn \sharp } %
    g=''2 a8 g f e | \acc { f=''8 } e d d4 \acc { e=''8 } d'4. c8\) |
    b=''2\( \trill \acc { a=''16 b } d8 c a fis |
    a=''2-> \acc { gis=''16 a b a } g8\) fis( f d='') |
  }

  \repeat volta 2 {
    {{ t1("d=''1\\(", "cis16( d", "e8)\\)") }} r8 e2 e8\( c |
    {{ t1("a='1", "gis16( a", "d4)~") }} d16 b d b g4\) r |
    b'=''2\(\f \trill \acc { a=''16 b } c8 b a g\) |
    a=''8( \prall g) fis( \prall e) d( \prall c) b( \prall a) |
    e'=''4( d8. b16 d4 c8. a16 | g8) g'(_\dDim fis g e g d g='') |

    {{ t1("c,=''1\\(\\p", "b16( c", "d2)\\)") }} r8 g,( b d) |
    {{ t1("d=''1\\(\\p", "cis16( d", "dis4)\\<") }} e4~ e8\) c( e \af 8\! g) |
    \af 8. \turn c='''4\(\< e8 d f e d \af 8\! c='''8 |
    b=''8\> a d c gis a f \af 8\! d\) |
    \afterGrace 15/16 \af 2\! c=''2\(\< \trill { b16( c } e4.)\> \af 8\! d8 |
    d=''2-> c=''4\) r |
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  c=8(-\stBass cM!) cM cM c( cM) cM cM |
  b=,8[( g@7!) g78 g7] b[_\aSim g@7 g78 g7] | {{ lh1() }}
  g,=,8 gM! gM gM d' d7! d7 d7 | g,=,[ d@7! d78 d7] g+gM! r r4 |

  b=,8[ g@7! g78 g7] b[ g@7 g78 g7] | c cM! cM cM c cM cM cM |
  d=8 d7! d7 d7 d d7 d7 d7 | g, gM! gM gM g gM gM gM |
  b=,8[ g@7! g78 g7] b[ g@7 g78 g7] | c8[ a@m! am8 am] c[ a@m am8 am] |
  d=8[ g@M! gM8 gM] d= dM! dM dM | g+gM! r gM r c@M! r8 g@7! r8 |

  c=8 cM! cM cM c cM cM cM | b[ g@7! g78 g7] b[ g@7 g78 g7] |
  {{ lh1() }} | g,=,8[ c@M! cM8 cM] g g7! g7 g7 | g=, g7! g7 g7 c+cM!4 r |
}
{% endmacro %}
