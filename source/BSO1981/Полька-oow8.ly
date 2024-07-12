{{ define "rh1" }}
  {{ .a }} r8 8] | r\< <a=' c e>8[ r8 \af 8\! 8] |
{{ end }}

{{ define "rh2" }}
  {{ .a }} c16 e e,8 a16 c | \rep 2 { e,=8 <gis= d' e>-> } |
  e=8 b'16 d e,8 gis16 b | \rep 2 { e,=8 <a= c e>-> } |
  a=16 e a c e c a c | \rep 2 { e,=8 <gis= d' e>-> } |
  e=8 b'16 d e,8 gis16 b= |
{{ end }}

{{ define "rh3" }}
  {{ .a }} e16 g g,8 c16 e | \rep 2 { g,=8 <b= f' g>-> } |
  g=8 d'16 f g,8 b16 d | \rep 2 { g,=8 <c=' e g>-> } |
  c='16\< g c e g e c \af 16\! d | \rep 2 { g,=8 <b= f' g>-> } |
  b=16 g b d f d b d=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key c \major
  \time 2/4
  {{ template "rh3" (w `c'='8\f`) }} | c='16 b c d e d c b= |

  {{ template "rh2" (w `a=8\p`) }} | a=16\< b c d dis e f \af 16\! fis=' |

  \repeat volta 2 {
    \rep 2 { g='16 a g fis g a g fis=' | } | g\< a b c d e f d |
    \alternative {
      \volta 1 { g=''16\> f e d c b a \af 16\! gis=' | }
      \volta 2 { e'=''16\> f e d c b c \af 16\! d='' | }
    }
  }

  {{ template "rh1" (w `r8\p <gis,=' b e>8[`) }}
  {{ template "rh1" (w `r8  <gis=' b e>8[`) }}
  g='8 b16 e e,8 b'16 e | a,8 c16 e e,8 c'16 e |
  \rep 2 { gis,='8 b16 e='' } | e,8 gis16 b e=''4 \fermata |

  {{ template "rh2" (w `a,,=8\f`) }} | a=16 b c d e g f d=' |

  {{ template "rh3" (w `c='8\f`) }} | c='8 r <c'='' e g c>\sf r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
}
{{ end }}
