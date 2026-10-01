{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key g \major
  \time 4/4
  \partial 2 { b'='4( g | }
  d'=''4 c8 b a4 c | b g) b( g d' c8 b a4 c |
  b='2) g4( b | a e) g( b | a e) b'( d | c a g e | <d=' g>2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  \partial 2 { g=2(-\frBass | }
  b=2 d | g,) g( | b d | g,) e( | a) e( | c') g'( | e=') %
  \duo { a=2( | b=) } { g=2~ | g= } %
}
{{ end }}
