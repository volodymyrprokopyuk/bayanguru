{{ define "rh1" }}
  {{ .a }} c8 d e f | g4)-. d-. e-. | c( c8 d e f | g4)-. d-. e-. |
  c=''4 e8( d c b=' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} r r | g+g7! r r | c+cM!4 r r | g+g7! r r | c+cM!4 r r | f+d@m! r4 r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key c \major
  \time 3/4
  {{ template "rh1" (w `c''=''4(\mf`) }} | a4)-. b-. c-. |
  d=''4 d8( c b a | g4)-. e'-. d-. |
  {{ template "rh1" (w `c=''4(`) }} | a4) f'8( e d c |
  b='4) g'8( f e d | c=''4)-- r r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  {{ template "lh1" (w `c+cM!4-\stBass`) }} | fis+d@M! r4 r | g+gM! r r |
  {{ template "lh1" (w `c+cM!4`) }} | g+g7! r r | c+cM!4 r r |
}
{{ end }}
