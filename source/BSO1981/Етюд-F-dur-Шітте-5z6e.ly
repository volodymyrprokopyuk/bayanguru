{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key f \major
  \time 2/4
  a'='8\mf f a_\aSta f | e g bes4-> | bes8 g bes g | f a c4-> |
  c=''8 a c a | g d' bes g | a f g a | f a f='4-> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  f,=,8-\frBass fM! f fM | g c@7! g8 c@7 | e'8 c@M! e8 c@M! |
  f,=,8 fM! f fM | d' d7! d d7 | d g@m! d8 g@m |
  c=8 f@M! c8 c7! | f,=, fM! f=,4 |
}
{{ end }}
