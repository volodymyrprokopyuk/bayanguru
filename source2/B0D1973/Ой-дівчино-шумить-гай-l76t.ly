{% macro rh1(a) %}
  {{ a }} c4 | f2 a,4 | c2 bes8 a | bes='2.\) |
{% endmacro %}

{% macro rh2() %}
  g'=''2\( f4 | e2 d4 | c d e='' |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} fM! fM | f fM fM | c c7! c7 | c c7 c7 |
  c=4 c7! c7 | c c7 c7 | c c7! c7 | f= fM! fM |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 3/4
  \repeat volta 2 {
    {{ rh1("c''=''2\\(\\mp") }}
    {{ rh2() }} | f a, bes\) |
    {{ rh1("c=''2\\(") }}
    {{ rh2() }}
    \alternative {
      \volta 1 { f=''2.\) | }
      \volta 2 { \hSpace f=''4 \sSlur bu #'((bs . 3)) ( r) r \bar "|." }
    }
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key f \major
  {{ lh1("f=4-\\stBass") }}
  {{ lh1("f=4") }} | f+fM! r r |
}
{% endmacro %}
