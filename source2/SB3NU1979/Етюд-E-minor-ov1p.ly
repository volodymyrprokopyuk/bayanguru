{% macro rh1(a, b) %}
  {{ a }} fis {{ b }} g a b g a fis e fis g a b\< g a fis |
  e=''16 fis g a b g a fis e fis g a b cis dis \af 16\! e=''' |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} r em!] r e[ r em] r | e=[ r em!] r %
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Presto
  \clef treble
  \key e \minor
  \time 4/4
  \repeat volta 2 {
    {{ rh1("e''=''16\\p", "_\\aLeg") }}
    c='''16 e d c b d c b a\> c b a g b a g |
    fis=''16 a g fis e g fis e dis e fis dis \af 8\! b='8-. r |
    {{ rh1("e=''16\\p", "") }}
    c='''16 d c b a g fis e dis e fis g b a fis dis |
    e=''16 fis e dis e fis g fis e g b e e,=''8-.\f r |
  }

  \repeat volta 2 {
    <b=' d g>2\f\< 4 \af 4\! 4 |
    <d='' fis a>4.->\> r8 \af 2\! r2 |
    <d='' fis a>2\< 4 \af 4\! 4 |
    <d='' a' c>4.->\> r8 <b=' d g>-. \af 8\! r r4 |
    a='16\mf b a g fis g fis e dis e fis g a\< b cis dis |
    e=''16 fis g a b g a fis e fis g a b cis dis \af 16\! e |
    c='''16\f d c b a g fis e dis c b a g fis e dis |
    e='16 e g b e e g b e e b g e=''8-. r |
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key e \minor
  {{ lh1("e=8[-\\stBass") }} e[ r em] r |
  a,=,8[-. r b]-. r c[-. r b]-. r | a[-. r ais]-. r b-. r r4 |
  {{ lh1("e=8[") }} g,[ r e@m] r8 |
  a=,8[-. r am!]-. r b[-. r b7!]-. r | e[-. r em!]-. r e=-. r r4 |

  g,=,16-\puBass a_\aNLeg b c d c b a g a b c d e fis g |
  d,=,16 e fis g a g fis e d fis a d d,=,8-. r |
  \rep 2 { d=,16 e fis g a g fis e=, } |
  d=,16 fis a c d c b a g b d g g,=,8-. r |
  fis=,8[-\stBass r b@7!] r8 fis[ r b@7] r8 |
  g=,8[ r e@m!] r8 g[ r e@m] r8 |
  a=,8[ r am!] r b[ r b7!] r | e[ r em!] r e=-. r r4 |
}
{% endmacro %}
