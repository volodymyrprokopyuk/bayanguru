{% macro rh1(a) %}
  {{ a }} e fis g) d( e fis g) | d( e fis g a g fis g) |
  d=''16( fis g a) d,( fis g a) | d,( fis g a b a gis a) |
  d,=''16(\< e fis g a b c \af 16\! d | e\> d c b a g fis e) |
  e=''16( d c b) d( c b a) | g4( \af 8\! g'=''8) r |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} r8 gM r | g@M!2-- | d@7!8 r8 d7 r | d@7!2-- |
  g+gM!4 r | c+a@m! r4 | \duo { g@M!4 d7!4 | } { d=2 | } g+gM!4~ g+gM8 r |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Allegro vivace"
  \clef treble
  \key g \major
  \time 2/4
  \repeat volta 2 { {{ rh1("d''=''16(\\f") }} }

  \repeat volta 2 {
    fis=''16(\mf g a b) fis( g a b) | \rep 2 { a=''16( g fis e='') } |
    \rep 2 { e=''16( fis g a='') } | \rep 2 { g=''16( fis e d='') } |
    d'='''16(\f cis b a g fis e d) | b'( a g fis e d cis b) |
    a='16( b cis d e fis g e) | d( e d cis d\sf e d cis='') |
    {{ rh1("d=''16(\\f") }}
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  {{ lh1("g@M!8-\\stBass") }}

  dis+b@M!8 r8 dis+bM r | e+em!4 r | cis+a@M!8 r8 cis+aM r | d+dM!4 r |
  fis+d@M!4 r4 | g+e@m! r4 | a+d@M!4 a+aM!4 | d+dM!8 r d+d7!4 |
  {{ lh1("g@M!8") }}
}
{% endmacro %}
