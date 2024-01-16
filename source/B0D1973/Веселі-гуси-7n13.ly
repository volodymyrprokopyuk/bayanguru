{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  f'='8-.\mf e-. d-. c-. | g'4 g |
  f='8-. e-. d-. c-. | g'4 g |
  \repeat volta 2 {
    f='8-. a-. a-. f-. | e-. g-. g-. e-. |
    d='8-. e-. f-. d-. | c4 c=' |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  f=8-\stBass r fM! r | c4 cM! |
  f=8 r fM! r | c4 cM! |
  f=8 r fM! r | c r cM! r |
  g=,8 r gM! r | c=4 cM! |
}
{{ end }}
