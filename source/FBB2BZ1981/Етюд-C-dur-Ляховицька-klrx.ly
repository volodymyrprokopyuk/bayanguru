{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  \partial 8 { e''=''16(\mf d | }
  c=''8) r r f16( e | d8) r r b16( a | g8) r r c16( d |
  e=''8) r r e16( d | c8) r r f16( g | a8) r r b16( c |
  d='''8) r r e16( d | \af 4.\! c='''4.)\> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  \partial 8 { r8 | }
  r8 c'='16(-\frBass d e8) r | r d16( e f8) r | r g,16( a b8) r |
  r8 e='16( d c8) r | r c16( d e8) r | r f16( e d8) r |
  r8 b=16( a g8) r | r a16( b c='8) %
}
{{ end }}
