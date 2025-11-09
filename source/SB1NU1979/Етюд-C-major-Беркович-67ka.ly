{{ define "rh1" }}
  {{ .a }} e g e g \af 8\! e) | f[(\> e d e] \af 8\! f) r |
  f=''8(\< d f d f \af 8\! d) | e[(\> d c d] \af 8\! e) r |
  e=''8(\< c e c e \af 8\! c='') |
{{ end }}

{{ define "lh1" }}
  b=,4 {{ .a }} g@7! g74 | c cM! cM | e c@M! cM4 | f,=, d@m! dm4 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Tempo di valse"
  \clef treble
  \key c \major
  \time 3/4
  {{ template "rh1" (w `g''=''8(\p\<`) }} | d[(\> e f e] \af 8\! d) r |
  d=''8(\< e d e c d) | b4( g'8) r \af 8\! g='' r |

  {{ template "rh1" (w `g=''8(\f\<`) }} | d[(\> e f g] \af 8\! f) r |
  e=''8(\> g e g d g) | c, r \af 2\! c=''2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=4(-\stBass cM!)-. cM-. | d( g@7!)-. g74-. |
  {{ template "lh1" (w `_ \aSim`) }} | fis d@7! d74 | g=, gM! gM |

  c=4 cM! cM | d g@7! g74 | {{ template "lh1" (w ``) }} |
  g=,4 c@M! g@7!4 | c=4( cM!2) |
}
{{ end }}
