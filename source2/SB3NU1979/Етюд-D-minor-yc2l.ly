{% macro rh1(a) %}
  {{ a }} e d c bes a) | e'( d c bes a g) |
{% endmacro %}

{% macro rh2(a) %}
  {{ a }} g f e d cis | d e f g gis a\) |
{% endmacro %}

{% macro rh3(a) %}
  {{ a }} bes a g f e | f g a bes b c\) |
{% endmacro %}

{% macro rh4(a) %}
  {{ a }} gis a bes b cis | d e f g gis \af 16\! a=''\) |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} dm!4 | g,8 gm!4 | a8 a7!4 | d=8 dm!4 |
{% endmacro %}

{% macro lh2(a) %}
  {{ a }} fM! r | bes besM! r | c c7! r | f,=, fM! r |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegro
  \clef treble
  \key d \minor
  \time 3/8
  {{ rh1("f''=''16(\\mf") }}
  {{ rh2("a='16\\(") }}
  {{ rh1("f'=''16(") }}
  {{ rh4("a='16\\(\\<") }}
  {{ rh1("f'='''16(\\f") }}
  {{ rh2("a=''16\\(") }}
  {{ rh1("f'='''16(") }}
  a=''16\(\>^\tRit g f e d cis | d cis c b bes \af 16\! a='\) |

  {{ rh1("f'=''16(\\p^\\tATem") }}
  {{ rh3("c=''16\\(") }}
  {{ rh1("f=''16(") }}
  c=''16\(\< b c cis d e | f g a bes b \af 16\! c\) |
  {{ rh1("f='''16(\\f") }}
  {{ rh3("c='''16\\(") }}
  {{ rh1("f='''16(") }}
  c='''16\(\>^\tRit bes a g f e | f e f g a \af 16\! g=''\) |

  {{ rh1("f=''16(\\p^\\tATem") }}
  {{ rh2("a='16\\(") }}
  {{ rh1("f'=''16(") }}
  {{ rh4("a='16\\(\\<") }}
  {{ rh1("f'='''16(\\f") }}
  {{ rh2("a=''16\\(") }}
  {{ rh1("f'='''16(") }}
  a=''16\( gis a bes b cis | d8\)\f <d,='' f a d> r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key d \minor
  {{ lh1("d=8-\\stBass") }}
  {{ lh1("d=8") }}
  {{ lh1("d=8") }}
  d=8 dm!4 | g,8 gm!4 | a8 a7!4 | d( c=8) |

  {{ lh2("f,=,8") }}
  {{ lh2("f=,8") }}
  {{ lh2("f=,8") }}
  f=,8 fM! r | bes besM! r | c c7! r | f4( e=8) |

  {{ lh1("d=8") }}
  {{ lh1("d=8") }}
  {{ lh1("d=8") }}
  d=8 dm!4 | g,8 gm!4 | a8 a7!4 | d=8 d+dm! r |
}
{% endmacro %}
