{% macro rh1(a) %}
  {{ a }} b a16( g fis e) | b'8 b a16( g fis e) |
  \rep 2 { e='16( b e fis) g8( fis) | } | e16( b e fis) g8( b=') |
{% endmacro %}

{% macro lh1(a, b) %}
  {{ a }} e'-. e,-. e'-. {{ b }} |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 2/4
  {{ rh1("b'='8\\mf") }} | a16( g fis g e4) |
  e'=''8\f e <d e>16( c b a) | e'8 e <d e>16( c b a) |
  a='16( gis a b) c8 c16( b) | a( gis a e' d8) c16( b) |
  a='16( gis a b) c8( e) | d16( c b c a4) |
  {{ rh1("b='8\\mf") }} | a16(\> g fis g \af 4\! e='4) \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key e \minor
  e=8-\frBass r c'4-- | e,8 r cis'4-- | e,8 r d'4-- | e,8 r cis'4-- |
  e,=8 r d'(-> cis | c4) <e,= b'> |
  \clef treble <c'=' a'>8 e f4 | <c a'>8 e fis4 |
  e='8-. r f4( | e8)-. r fis4( | e8)-. r g4( | fis8 f) <a,= e'>4 |
  \clef bass {{ lh1("e=16-.", "c4--") }} {{ lh1("e,=16-.", "cis4--") }}
  {{ lh1("e,=16-.", "d4--") }} {{ lh1("e,=16-.", "cis4--") }}
  {{ lh1("e,=16-.", "d8(-> cis") }} | c4) <e,= b'> |
}
{% endmacro %}
