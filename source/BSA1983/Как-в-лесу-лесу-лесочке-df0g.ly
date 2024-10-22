{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 2/4
  \meter 1/2 #'(1)
  e''=''8\mf e c c | d4( c8 b) | a4( c) | e8 e e g | f4( e8 d) | a4( e') |
  b='8 b b a | e4( c'8 b) | a4( c) | b8 b b a | e4( e'8 d | a='2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,4-\stBass am! | d dm! | a am! | a am! | d dm! |
  \rep 2 { a=,4 am! | d dm! | e= e7! | } | a,=, am! |
}
{{ end }}
