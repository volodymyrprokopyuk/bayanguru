{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  <c''='' e>4\(\p\< 4 | <d f>4 \af 4\! 4 | <e g>4\> 4 |
  <d='' f>8 <c e> <b d>\) \af 8\! r | <a c>4\(\< 4 |
  <b=' d>4 \af 4\! 4 | <c e>4\> 4 | <b d>8 <a c> <gis b>\) \af 8\! r |
  <f=' a>4(\mf\< 4 | <d b'>2) | <a' c>4( 4 | \af 2\! <f d'>2) |
  <c'='' e>4\(\> 4 | <d f>4 4 | <e g>4 8 \af 8\! <d f> | <c='' e>2\)\p \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  r8 c'='8[-\frBass e_\aSta g] | r b,[ d g] | r c,[ e g] | r <d f>[ r g,] |
  r8 a=8[ c e] | r gis,[ b e='] | r8 \clef bass a,=[ c e] | r <b d>[ r e,] |
  r8 f=8[ e f] | r g[ f g] | r a[ gis a] | r b[ a b=] |
  r8 \clef treble c='[ e g] | r b,[ d g] | r g,[ a b] |
  r8 \clef bass c='8 c,=4 |
}
{{ end }}
