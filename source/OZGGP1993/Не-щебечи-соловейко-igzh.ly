{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key d \minor
  \time 6/8
  d'='4(\p f8 a4 bes8 | a4 f8 d4 d8) |
  \duo {
    c''=''4( bes8 f4 g8 | <c, a'>4. <cis a'>) |
    c'=''4( c8 bes4 a8 | bes4 bes8 a4 g8) |
    f='4(\< f8 e4 a8 | d,4. f4 \af 8\! a='8) |
  } { d'='2. | s2. | d2. | d | cis=' | s2. | }
  d'=''4(\mf d8 c4 bes8 | a4\> g8 f4 \af 8\! g8) |
  a='4( f8 e4^\tRit a8 | d,4.\p d=') \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  R2. | f=4(-\frBass a8 c bes a) | g4.~ g8 c( bes |
  f=4 g8 e a g) | fis4( d8 e4 fis8 | g4 e8 c'4 bes8) |
  a=4.~ a8 gis( g | f e f d cis c) | bes( d f g4.) |
  a=8( b cis d c bes) | a4.~ a8 gis( g | f e f d=4.) |
}
{{ end }}
