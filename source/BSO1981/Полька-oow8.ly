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
  c='16\< g c e g e c \af 16\! e | \rep 2 { g,=8 <b= f' g>-> } |
  b=16 g b d f d b d=' |
{{ end }}

{{ define "lh1" }}
  r8 {{ .a }} cM!] r | r d16 e f e d8 | r g,=,8[ gM!] r |
{{ end }}

{{ define "lh2" }}
  r8 {{ .a }} am!] r | r b16 c d c b8 | r e=[ e7!] r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key c \major
  \time 2/4
  {{ template "rh3" (w `c'='8\f`) }} | c='16 b c d e d c b= |

  {{ template "rh2" (w `a=8\p`) }} | a=16\< b c d dis e f \af 32.\! fis=' |

  \repeat volta 2 {
    \rep 2 { g='16 a g fis g a g fis=' | } | g\< a b c d e f d |
    \alternative {
      \volta 1 { g=''16\> f e d c b a \af 32.\! gis=' | }
      \volta 2 { e'=''16\> f e d c b c \af 16\! d='' | }
    }
  }

  {{ template "rh1" (w `r8\p <gis,=' b e>8[`) }}
  {{ template "rh1" (w `r8  <gis=' b e>8[`) }}
  gis='8 b16 e e,8 b'16 e | a,8 c16 e e,8 c'16 e |
  \rep 2 { gis,='8 b16 e='' } | e,8 gis16 b e=''4 \fermata |

  {{ template "rh2" (w `a,,=8\f`) }} | a=16 b c d e g f d=' |

  {{ template "rh3" (w `c='8`) }} | c='8 r <c'='' e g c>\sf r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  {{ template "lh1" (w `c=8[-\frBass`) }} | r e'16 f e d c8 |
  {{ template "lh1" (w `c=8[`) }} | c+cM! r e+eM! r |

  {{ template "lh2" (w `a=,8[`) }} | r c=16 e c b a8 |
  {{ template "lh2" (w `a=,8[`) }} | a+am!8 r g+g7! r |

  r8 c@M![-\stBass r8 cM] | r g@M![ r8 gM] |
  r8 g@7![ r8 g7] | r c@M![ r8 cM] | c@M! r8 r4 \clef treble |

  e'='16-\frBass f e f \rep 6 { e='16 f=' } |
  \rep 4 { d='16 e=' } | \rep 4 { c='16 e=' } |
  \rep 4 { b=16 e=' } | \rep 4 { a,=16 e'=' } \clef bass |
  \rep 4 { e,=16 e'=' } | e,=8 r r4 \fermata |

  {{ template "lh2" (w `a,=,8[`) }} | r c=16 e c b a8 |
  {{ template "lh2" (w `a=,8[`) }} | a+am!8 r g+g7! r |

  {{ template "lh1" (w `c=8[`) }} | r e'16 f e d c8 |
  {{ template "lh1" (w `c=8[`) }} | c=8 r c+cM! r |
}
{{ end }}
