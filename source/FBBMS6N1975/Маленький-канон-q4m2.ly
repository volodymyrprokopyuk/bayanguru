{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \minor
  \time 6/8
  c'='4(\mf g'8 aes4 f8 | ees4. c) | g'4( bes8 aes g f | ees4.) r8 r b'( |
  c=''4 g8 f ees d | ees4.) r8 f( aes~ | aes g f ees f d | c2.~ | c=') \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \minor
  R2. | c=4(-\frBass g'8 aes4 f8 | ees4. c) | g'4( bes8 aes g f |
  ees=4.) r8 r b'( c4 g8 f ees d | ees4.) r8 f( aes~ | aes g f ees f d | c=2.) |
}
{{ end }}
