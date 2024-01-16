{{ define "rh1" }}
  g='8-.\mp\< bes-. ees-. \af 8\! g-. | f-. d-. bes-. aes-. |
  g='8-. bes-. ees-. g-. | f4 r8 {{ .a }} |
{{ end }}

{{ define "rh2" }}
  {{ .a }} <a ees' f> <a ees' g> <a ees' f> |
  <bes=' d g>8 <bes d f> <bes d g> <bes d f> |
  <a=' ees' g>8\< <a ees' f> <a ees' g> \af 8\! {{ .b }} |
{{ end }}

{{ define "lh1" }}
  {{ .a }} eesM! g, ees@M | bes8 bes7! d bes@7 |
  ees=8 eesM! g, ees@M | bes8 bes7! bes=, bes7 |
{{ end }}

{{ define "lh2" }}
  c=8 f@7! f,8 f7 | bes besM! f bes@M | c'8 f@7! f,=,8 f7 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key ees \major
  \time 2/4
  \meter 1/2 #'(1)
  \partial 8 { bes'='8-. | }
  {{ template "rh1" (w `bes,='8-.`) }}
  a='8-. g'-. f-. ees-. | d-. f-. bes,-. d-. |
  c=''8-. ees-. g,-. a-. | bes4 r8 bes='8-. |

  g='16(\mf bes ees g f8[)-. ees]-. | bes'-. d,-. f-. bes,-. |
  g='16( bes ees g f8[)-. ees]-. | bes'4 r8 bes,-. |
  a='16(\< c ees g f8[)-. \af 8\! ees]-. | d-. f-. bes,-. d-. |
  a='16( c ees g f8[)-. a,]-. | bes4\> r8 \af 8\! bes='-. |

  {{ template "rh1" (w `f=''8-.`) }}
  {{ template "rh2" (w `<a,=' ees' g>8` `<a=' ees' f>`) }}
  bes='4 r8 f'-. |
  {{ template "rh2" (w `<a,=' ees' g>8\mf` `<a=' ees' a>`) }}
  <bes=' d f bes>4\f r8 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key ees \major
  \partial 8 { r8 | }
  {{ template "lh1" (w `ees=8-\stBass`) }}
  {{ template "lh2" }} bes=,8 besM! besM r |

  {{ template "lh1" (w `ees=8`) }}
  {{ template "lh2" }} bes=,4 besM!8 r |

  {{ template "lh1" (w `ees=8`) }}
  {{ template "lh2" }} bes=,8 besM! bes besM |
  {{ template "lh2" }} bes=,4 besM!8 %
}
{{ end }}
