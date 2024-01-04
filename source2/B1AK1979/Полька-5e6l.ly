{% macro rh1(a) %}
  {{ a }} bes bes4) | bes8( d d4) | f8\( ees c a=' |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} besM! besM besM | bes besM besM besM | f=, fM! fM fM |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key bes \major
  \time 2/4
  {{ rh1("f'='8(\\mf") }} | bes d f,4\) |
  {{ rh1("f='8(") }} | bes4.\) r8 |

  \repeat volta 2 {
    \rep 2 { <a=' ees'>8 8 <bes d>8 16 <d f> | <c ees>8 8 <bes=' d>4 | }
    {{ rh1("f='8(") }} | bes='4.\) r8 |
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key bes \major
  \meter 1/2 #'(1)
  {{ lh1("bes,=,8-\\stBass") }} | bes besM! besM besM |
  {{ lh1("bes=,8") }} | bes=,[ besM!] besM r |

  c+f@7!4 bes+besM!4 | a+f@M! bes+besM!4 |
  c+f@M!4 bes+besM!4 | a+f@M! bes+besM!4 |
  {{ lh1("bes=,8") }} | bes=,[ besM!] besM r |
}
{% endmacro %}
