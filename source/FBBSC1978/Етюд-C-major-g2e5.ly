{{ define "rh1" }}
  {{ .a }} e g c b8 a | g[ f e d] | c16 e g c b8 a=' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} e g c b8 a | g[ f e d] | c16 e g c b8 a | g fis g g= |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key c \major
  \time 2/4
  \repeat volta 2 {
    {{ template "rh1" (w `c'='16\mf`) }}
    \alternative {
      \volta 1 { g='8 fis g g=' | }
      \volta 2 { g='8 fis g f=' | }
    }
  }

  \repeat volta 2 {
    e='16 e' gis, b d8 c | b[ e c a] | e16 e' gis, b d8 c |
    \alternative {
      \volta 1 { b='8 e a, a=' | }
      \volta 2 { b='8 e <c='' e a>4 | }
    }
  }

  \repeat volta 2 {
    {{ template "rh1" (w `c,='16`) }}
    \alternative {
      \volta 1 { g='8 fis g g=' | }
      \volta 2 { g='8 <f g b> <e=' g c>4 \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  {{ template "lh1" (w `c=16-\frBass`) }} | g fis g f= |

  e=16 e' gis, b d8 c | b[ e c a] | e16 e' gis, b d8 c |
  b=8 e a, a | b e <a,= c e>4 |

  {{ template "lh1" (w `c,=16`) }} | g <g b> <c,= g' c>4 |
}
{{ end }}
