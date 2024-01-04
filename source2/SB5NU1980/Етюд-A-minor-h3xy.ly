{% macro rh1(a, b) %}
  {{ a }} b c {{ b }} b a g f e d e f e d c b a |
{% endmacro %}

{% macro rh2(a, b = "\\<", c = "\\af 32\\!") %}
  {{ a }} a b a gis e fis gis a {{ b }} b c d dis e fis {{ c }} gis |
{% endmacro %}

{% macro rh3(a) %}
  {{ a }} a b a gis e fis gis a b c d dis e g fis |
{% endmacro %}

{% macro rh4(a) %}
  {{ a }} gis b e gis, b e gis a,\< c e a c, e a c |
  e,='32 gis b e gis, b e gis a, c e a c, e a \af 32\! c |
  b=''32\mf a f d b a f d e a c e a, c e a | b, d f a e\> gis b e=''' %
{% endmacro %}

{% macro rh5() %}
  {{ rh2("gis='32") }} {{ rh1("a=''32\\mf", "") }}
  gis='32 a b c d e fis gis \ottava #1 %
  a=''32\< b c d dis e fis \af 32\! gis |
  {{ rh1("a='''32\\f", "") }} {{ rh2("gis=''32", "", "") }}
  {{ rh1("a='''32", "") }} gis=''32 a b c d e fis gis=''' %
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} am! f d@m! | e'8 eM! a,=, e@M |
{% endmacro %}

{% macro lh2(a) %}
  e'=8 eM! a, am! | b e@7! c8 a@m! | {{ a }} e8 a@m! | e8 e7! a,=, am! |
{% endmacro %}

{% macro lh3(a) %}
  e'=8 d c r | e d c a | f' d@m! e8 a@m! | f8 e a,=, {{ a }} |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegro
  \clef treble
  \key a \minor
  \time 2/4
  {{ rh1("a''=''32\\mp", "_\\aLeg") }} {{ rh5() }} a='''8 \ottava #0 r |

  {{ rh3("gis,,,=32\\p") }}
  f='32 e d c b c e d c b a b c d dis e |
  g='32 fis f e d e f g a b c d dis e g fis |
  f=''32 e d c b c e d c b a b c d e fis |
  \ottava #1
  {{ rh3("gis=''32\\mf") }}
  f='''32 e d c b c e d c b a gis g fis f e |
  \ottava #0
  d=''32 c b a b c d e c b a b c d dis e |
  g=''32 fis f e dis e fis gis a b c e a='''8 |

  {{ rh4("e,,,=32\\p") }} a,=''32 e c a a e c \af 32\! a |
  {{ rh4("e=32\\p") }} a,=''32 b c e \af 8\! a='''8\p |

  {{ rh1("a,=''32\\mp", "") }} {{ rh5() }}
  a='''8 <a,='' c e a> \ottava #0 \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \minor
  {{ lh1("a,=,8-\\stBass") }} {{ lh1("a=,8") }} {{ lh1("a=,8") }}
  a=,8 am! d dm! | e eM! a,=, am! |

  {{ lh2("d=8 dm!") }} {{ lh2("f=8 d@m!") }}

  {{ lh3("r") }} {{ lh3("am!") }}

  {{ lh1("a=,8") }} {{ lh1("a=,8") }} {{ lh1("a=,8") }}
  a=,8 am! f d@m! | e'8 e7! a,=, a+am! |
}
{% endmacro %}
