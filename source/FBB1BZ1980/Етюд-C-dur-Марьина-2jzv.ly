{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key c \major
  \time 4/4
  e''=''4(\mf e e e | e f d2) | d4( d d e | d2 c) |
  <c='' e>4(\p\< e <c e> e | <c f> g' \af 2\! <c, a'>2) |
  a'=''4(\> g d e | c2 \af 2\! c='') \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  c''=''1(-\frBass | b) | gis( | a) | c2( bes | a4 g f2) |
  <g=' b>1 | c,2 c=' |
}
{{ end }}
