{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key c \minor
  \time 2/4
  \duo {
    b'='8 \rest \p <ees,=' g>8 b' \rest 8 | b \rest 4 <d, g>8 |
    c='8 ees~ <bes ees~ g> <bes ees>~ | <ees f>4 ees8 <c d> |
    <ees=' g>4( <d f>) | <ees, g c>4 b''16 \rest d,16(\< <c ees> <d f> |
    ees='8 <ees g> <g bes>8 \af 8\! 8 | <aes c>4 <g bes>8 <f aes> | g4) r8 g(\< |
    <c,=' fis a>4 \af 4\! <b f' aes b> | <d g~ d'>8 <ees~ g~ c> <ees g>4~ |
    <ees=' g>8) ees[(\p d c]) |
  } {
    s2 | a=4 b | c2( | <a c>4) <aes c> | b2 |
    s2 | bes=4 des | c <aes d> | ees'8[ g,( bes <bes ees>]) |
    s2 | r8 c='~ c bes | <a c> r r4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \minor
}
{{ end }}
