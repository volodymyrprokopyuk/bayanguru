{% macro rh1() %}
  <a=' f'>8\f r <a c>2-> | <a f'>8\p r <a c>2-> |
  \duo { e''=''8(\< d c2) | e8( d \af 2\! c=''2) | } { bes'='2. | bes='2. | }
{% endmacro %}

{% macro rh2(a) %}
  \duo { r4\p <g'=' bes>4 4 | r <f=' a>4 4 | } { c'='2. | c='2. | }
  c='8(\< e g bes a \af 8\! {{ a }} |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} fM! fM | f fM fM | c'= c7! c7 |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Con moto"
  \clef treble
  \key f \major
  \time 3/4
  c'='8(\mf e g4)-. g-. | c a2-> | bes8( a g4)-. c-. | a f2-> |
  c='8( e g4)-. g-. | <a c> <f a>2-> |
  \duo { bes'='8( a g4)-. c=''-. | } { e'='2 e='4 | }
  <f=' a>4 f='2-> |

  {{ rh1() }}
  <a=' f'>8\f r <a c>2-> | <a f'>8\p r <a c>2-> |
  \duo { e''=''8(\< d c4) \af 4\! c='' | } { bes'='2 c=''4 | }
  f='4\f f='-> r |

  {{ rh2("g='8)") }} | a4(\> f) \af 4\! f-. |
  {{ rh2("g='8") }} | f4) f='-> r |

  {{ rh1() }}
  a='8.\f a16 a4.( f8) | f( e f a g f) |
  e='8( f g c, d e | f4) <a,= c f>-> r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key f \major
  c=4(-\stBass c7!)-. c7-. | f,( fM!)-. fM-. |
  c'=4_\aSim c7! c7 | f, fM! fM |
  \rep 2 { c'=4 c7! c7 | f,=, fM! fM | }

  {{ lh1("f=,4") }} | c c7 c7 |
  {{ lh1("f,=,4") }} | f,=, fM! r |

  g=,4 c@7! c74 | f fM! fM | e c@7! c74 | f fM! fM |
  e=,4 c@7! c74 | f fM! fM | c' c7! c7 | f,=, f+fM! r |

  f=,4 fM! fM | f fM fM | c' c7! c7 | c c7 c7 |
  f,=,4 fM! fM | a f@M! bes@M!4 | c cM! c7! | f,=, f+fM! r |
}
{% endmacro %}
