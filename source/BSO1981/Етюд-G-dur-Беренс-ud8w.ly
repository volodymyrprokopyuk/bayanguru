{{ define "rh1" }}
  {{ .a }} d16( e d8) d16( e | d8) b'-. g-. d16( e | d8) c'='''-. %
{{ end }}

{{ define "rh2" }}
  {{ .a }} c16 e g8 fis16 e=''') |
{{ end }}

{{ define "rh3" }}
  d,=''8-. e16( fis | g8[) g g=''] r |
{{ end }}

{{ define "lh1" }}
  {{ .a }} gM! g gM! | g gM! g gM | fis8 d@7! fis=,8 d@7! |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  \repeat volta 2 {
    {{ template "rh1" (w `d''=''8\p`) }} a=''8-. d,16( e |
    d=''16) b'( a g fis a g e | {{ template "rh1" (w `d=''8)`) }}
    {{ template "rh3" }}
  }

  \repeat volta 2 {
    {{ template "rh2" (w `g=''8(\f`) }} | d='''8( cis16 e d8 b16 g) |
    {{ template "rh2" (w `g=''8(`) }} | d='''8(\> c16 b a g fis \af 16\! e |
    {{ template "rh1" (w `d=''8)\p`) }} {{ template "rh3" }}
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g,=,8-\stBass gM! g gM! | g gM! g gM |
  fis=,8 d@7! fis=,8 d@7! | g8 gM! g c@M! |
  g=,8 gM! g gM! | g gM! g gM |
  fis=,8 d@7! a=,8 d@7! | g@M!8[ gM8 gM] r |

  c=8 cM! c cM | g gM! g gM | c cM! c cM | g@M! r8 r4 |
  fis,=,8 d@7! fis8 d@7! | g8 gM! g gM |
  a=,8 d@7! a=,8 d@7! | g@M!8[ gM8 gM] r |
}
{{ end }}
