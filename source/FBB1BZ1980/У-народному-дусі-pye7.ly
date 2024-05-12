{{ define "rh1" }}
  d=''4.( d8 cis4 fis,) | b4.( a8 g4 e=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key d \major
  \time 4/4
  d'='4.(\p e8 fis4 a | g fis8 e d2) | d4.( e8 fis4 d | b'2 a) |
  {{ template "rh1" }}
  d='4( d cis8 b cis4 | b4.) cis8(\< d fis b \af 8\! cis) |
  {{ template "rh1" }}
  \duo { fis'='4(\>^\tRit a fis8 e d \af 8\! e | d='1)\p \bar "|." }
  { d'='2( cis=') | s1 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  R1 | b=4(-\frBass a8 g fis2) | R1 | g4( b8 cis d2) |
  b=4( fis ais2) | g4( dis e2) | fis( fis, | b4.) cis8( d fis b cis) |
  b=4( fis ais2) | g4( dis e cis) | a'2( <a, g'>) | <d= fis>1 |
}
{{ end }}
