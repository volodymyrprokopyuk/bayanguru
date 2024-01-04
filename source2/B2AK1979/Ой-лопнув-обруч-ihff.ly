{% macro rh1(a) %}
  {{ a }} 8 <e g> | <d fis>8 8 4 | <cis e>8 <d fis> <e='' g>4 |
{% endmacro %}

{% macro rh2(a) %}
  {{ a }} 8 <cis e> | <b d>8 8 4 |
  <ais=' cis>8 <ais e'> <ais d> <ais=' cis> |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} dM! a8 a7! | d dM! a d@M | e'8 a@7! a,=,8 a7 |
{% endmacro %}

{% macro lh2(a) %}
  {{ a }} bm! fis' fis7! | b, bm! fis' b@m | cis8 fis@7! fis=8 fis7 |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegro
  \clef treble
  \key d \major
  \time 2/4
  {{ rh1("<fis''='' a>4\\f") }} | <d fis>4 4 |
  {{ rh1("<fis='' a>4") }} | <d fis>4 <ais=' e' fis>-> |

  {{ rh2("<d='' fis>4\\mf") }}
  b='16( ais b cis d cis d e) |
  {{ rh2("<d='' fis>4") }} | b4 b=' \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key d \major
  {{ lh1("d=8-\\stBass") }} | d dM! a d@M |
  {{ lh1("d=8") }} | d4 cis=-> |

  {{ lh2("b=,8") }} | b, bm! fis' b@m |
  {{ lh2("b,=,8") }} | b,=,4 bm! |
}
{% endmacro %}
