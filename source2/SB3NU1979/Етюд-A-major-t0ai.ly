{% macro rh1(a) %}
  {{ a }} b cis d e fis gis a | | b16-> cis d cis b a gis fis\) |
{% endmacro %}

{% macro rh2(a) %}
  {{ a }} fis gis fis e d cis b | | a16-> b cis b a-> b cis b\) |
{% endmacro %}

{% macro rh3(a) %}
  {{ a }} b cis b a-> b cis a | | b16-> cis d cis b a gis fis\) |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} r aM! r | a r b@m! r8 | gis r e@7! r8 | a=, r aM! r |
{% endmacro %}

{% macro lh2() %}
  fis=,16(-> gis a gis fis8) r | b16(-> cis d cis b8) r |
  e,=,16(-> fis gis fis e8) r | a16(-> b cis b a8) r |
  fis=,16(-> gis a gis fis8) r | b16(-> cis d cis b=,8) r |
{% endmacro %}

{% macro lh3() %}
  a=,8 r aM! r | d r b@m! r8 | e=8 r e7! r |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \major
  \time 2/4
  {{ rh1("a=16\\(->\\f") }}
  {{ rh2("e='16\\(->") }}
  {{ rh1("a=16\\(->") }}
  e='16\(-> fis gis fis e d cis b | a-> b cis d dis e fis gis\) |
  {{ rh3("a='16\\(->") }}
  {{ rh2("e='16\\(->") }}
  {{ rh3("a=16\\(->") }}
  e=16\(-> fis gis fis e fis gis e | a8\)-> r <a= cis e a>-> r |

  r4\f r8 \clef bass <fis= a cis fis>8 | r4 r8 <fis b d fis> |
  r4 r8 \clef treble <b= d e gis>8 | r4 r8 <cis e a cis> |
  r4 r8 <fis=' a cis fis>8 | r4 r8 <fis b d fis> |
  R2 | r4 <a=' cis e a>8 r | r4\p r8_\dCre <fis a cis fis> |
  r4 r8 <fis=' b d fis>8 | r4 r8 <b d e gis> |
  r4 r8 <cis='' e a cis>8 | r4 r8 <fis a cis fis> |
  r4 r8 <fis='' b d fis>8 | r4 r8 <d e gis> |
  <cis='' e a>8 r \ottava #1 <a'='' cis e a> \ottava #0 r |

  \ottava #1
  {{ rh1("a=''16\\(->\\f") }}
  {{ rh2("e='''16\\(->") }}
  \ottava #0
  {{ rh3("a=''16\\(->") }}
  e=''16\(-> fis gis fis e d cis b | a b cis b a8\) r |
  {{ rh1("a='16\\(->\\p") }}
  {{ rh2("e=''16\\(->_\\dCre") }}
  {{ rh3("a='16\\(->") }}
  e='16\(-> fis gis fis e d cis b | a8\)\f r <a= cis e a> r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key a \major
  {{ lh1("a,=,8-\\stBass") }} {{ lh3() }} | a+aM! r r4 | {{ lh1("a,=,8") }}
  a=,8 r aM! r | d+b@m! r8 r4 | e8 r r e( | a)-> r a=,-> r |

  {{ lh2() }} | e,=,16(-> fis gis fis e d' cis b |
  a=,8) r a+aM! r | {{ lh2() }}
  e,=,16(-> fis gis fis e8) r | a=,8 r a+aM! r |

  {{ lh1("a=,8") }}
  {{ lh3() }} | a, r aM! r | {{ lh3() }} | a, r aM! r |
  a=,8 r aM! r | b r bm! r | e r e7! r | a,=, r a+aM! r |
}
{% endmacro %}
