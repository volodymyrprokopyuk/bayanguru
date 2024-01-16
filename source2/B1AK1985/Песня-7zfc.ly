{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \minor
  \time 4/4
  \meter 1/4 1,1,1,1
  g'='4(\p c8 d ees4 c) | d( ees8 d c4 bes8 aes) |
  g='4( c8 d ees4 c) | f( g8 aes \af 2\! g2)\< |
  f=''4(\mp g8\< d ees4 \af 4\! c) | d( ees8\> b c4 \af 4\! aes) |
  g='4(\p\< c8 d ees f g \af 8\! aes) | g4(\> b \af 2\! c='''2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \minor
  c=4-\stBass cm! c cm | b g@7! c4 cm! |
  ees=4 c@m! c4 cm | aes f@m! g'8( ees d c) |
  b=,4 g@7! c4 cm! | d g@7! ees4 aes@M! |
  b=,4( aes g f) | ees'( d c=2) |
}
{{ end }}
