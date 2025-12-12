{{ define "rightHand" }}
\relative {
  \tempo "Tranquillo cantabile"
  \clef treble
  \key a \minor
  \time 4/4
  c''=''2(\p a) | c( a) | <a c>(\< \af 2\! <b d> | \af 1\! <c e>1)\> |
  f=''2( d) | f( d) | <d f>(\< \af 2\! <e g> | \af 1\! <f a>1)\> |
  <e='' gis>2.\< 4( | <f a>2.) \af 4\! <f b>4( | <dis b'>2.) 4( |
  <d='' e>2.)\> \af 4\! 4 | <c e>2.(\< <a f'>4) | <a e'>2. \af 4\! <a c>4( |
  <gis=' e'>2.) <d' e>4( | \af 1\! <c='' a'>1)\> \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  a=4(-\frBass c e f) | a,4( c e f) | a,( c d b | a b c d) |
  \rep 2 { a=4( d f g=') | } | a,( d b cis | d c b a) |
  b=4( c d e | d e d c) | b( c b a | gis a gis e) |
  a=4\( b c d | c d e f | e d c b | a f' e='2\) \fermata |
}
{{ end }}
