{{ define "rh1" }}
  {{ .a }} b-. b-. b]-. | c16\( b a g f e d c='' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key c \major
  \time 2/4
  \repeat volta 2 {
    g''=''8\(\mf e16 f g f e d | c8[ e g c] |
    b=''8\) b\( c16 b a b | c4 g\) |
    g=''8\( e16 f g f e d | c d e f g a b c\) |
    g=''8( f) f( e) | d( g) g=''4 |
  }

  \repeat volta 2 {
    {{ template "rh1" (w `b=''8[-.\f`) }} | d8[\) d( g f] | e4 g4) |
    {{ template "rh1" (w `b=''8[-.`) }} | d8[ g f d] | c e c=''4\) |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \meter 1/2 #'(1)
  c=8 cM! cM cM | c cM! cM cM | g g7! g7 g7 |
  \rep 3 { c=8 cM! cM cM | } b g@M! c8 cM! | g=, gM! g+gM4 |

  \rep 3 { g=,8 g7! g7 g7 | g=,[ c@M! cM8 cM] | }
  g=,8 g7! g7 g7 | c= cM! c+cM4 |
}
{{ end }}
