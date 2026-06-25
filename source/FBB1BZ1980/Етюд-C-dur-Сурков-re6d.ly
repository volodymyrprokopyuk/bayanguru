{{ define "lh1" }}
  <d=' f>4 r4 r4 4 | <g,= d'>4 r4 r4 4 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 4/4
  g''=''4(\mf e c e | f e d2) | d4( c b d | c e g2) |
  g=''4( e g a | f e d c) | b( a g b | c e c='') r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  <c'=' e>4-\frBass r4 r4 4 | {{ template "lh1" }} | <c e> r r <b f'> |
  <c=' e>4 r r <cis g'> | {{ template "lh1" }} | <c=' e>4 4 4 r4 |
}
{{ end }}
