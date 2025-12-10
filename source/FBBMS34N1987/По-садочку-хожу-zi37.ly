{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key e \minor
  \time 2/4
  e'='8\p\< <c' e> <fis, a> <g b> | e <c' e> <fis, a> \af 8\! <g b> |
  a='8\mf a e fis | g4 e | a8 a e fis | g4 e | a8 a a c |
  b='8 a g b | fis g a b=' | \duo { e'='8\< <fis a>8 8 \af 8\! <g=' b> | }
  { e'='2 | }

  r8\f <c='' e>8[ 8 8] | r <b e>[ <d e> <cis e>] |
  r8 <c='' e>8[ 8 8] | r <e g>[ <fis a> <g b>] |
  r8 <a='' c>16 <g b> <fis a> <e g> <d fis> <c='' e> |
  \duo {
    d''=''8 <a c e> <c e g> <d e g> | <e a>^\tRit <e g> <c fis> <b fis'> |
    <a=' c>8 8 b='4 |
  } { g'='4 a8 b | c b a a | <g=' e'>2 | }

  a='16^\tATem b a8 a16 b a e | g a g8 g16 fis e d |
  c='16 d c b c d e fis | g b fis b e, b' e b |
  a='16 b c d e fis g a | b a b g e d e b |
  a='16^\tRit b a g fis g a b=' |
  \duo {
    e''=''8 <c e> <fis, a> <g b> | r\> <c e>[ <fis, a> <g b>] |
    \af 2\! <g=' b e>2 \fermata \bar "|."
  } { e'='2 | e~ | e=' \fermata | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  e'='4---\frBass e-- | e-- e-- | e c | b8 b c b | c d c16 b a8 |
  b=16 a b8 c b | c g' fis e | d c b d | dis 4 b= \clef bass |
  e,=2 | a8 a e fis | g4 e | a8 b16 a e8 fis | g4 e | a8 a a c |
  b=8 a g b | fis g a b | e,=2 |

  e=8[-\stBass a@m! c@M!8] r8 | b[ e@m! em8] r |
  a=,8 am! d d7! | g,[ gM! gM] r | a[ am! am] r | g e@m! g8 gM! |
  c=8 a@m! b8 b7! | \rep 2 { e=8 c@M! a@m!8[ g@M!8] } | e=2 \fermata |
}
{{ end }}
