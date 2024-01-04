{% macro rh1(a) %}
  {{ a }} e g e g \af 8\! e) | f[(\> e d e] \af 8\! f) r |
  f=''8(\< d f d f \af 8\! d) | e[(\> d c d] \af 8\! e) r |
  e=''8(\< c e c e \af 8\! c='') |
{% endmacro %}

{% macro lh1(a) %}
  b=,4 {{ a }} g@7! g74 | c cM! cM | e c@M! cM4 | f,=, d@m! dm4 |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Tempo di valzer"
  \clef treble
  \key c \major
  \time 3/4
  {{ rh1("g''=''8(\\p\\<") }} | d[(\> e f e] \af 8\! d) r |
  d=''8(\< e d e c d) | b4( g'8) r \af 8\! g='' r |

  {{ rh1("g=''8(\\f\\<") }} | d[(\> e f g] \af 8\! f) r |
  e=''8(\> g e g d g) | c, r \af 2\! c=''2 \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  c=4(-\stBass cM!)-. cM-. | d( g@7!)-. g74-. |
  {{ lh1("_\\aSim") }} | fis d@7! d74 | g=, gM! gM |

  c=4 cM! cM | d g@7! g74 | {{ lh1("") }} | g c@M! g@7!4 | c=( cM!2) |
}
{% endmacro %}
