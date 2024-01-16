{{ define "rh1" }}
  {{ .a }} b8. d,16 | g4 d | \tuplet 3/2 { g='4( a8) } %
  \tuplet 3/2 { b='8( a g) } | <fis a>4 <d=' d'> |
{{ end }}

{{ define "lh1" }}
  {{ .a }} d+g@M4 | g+gM!4 d+d7! | g+gM! b+g@M | d+dM!4 d+dM |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Tempo di marcia"
  \clef treble
  \key g \major
  \time 2/4
  {{ template "rh1" (w `g'='4\f`) }}
  a'='4 <e g b>8. c'16 | <d, g d'>4. <e a c>8 |
  <d=' g b>4 <cis e a>8. g'16 | <fis a>4 d=' |

  {{ template "rh1" (w `g='4`) }}
  <e=' g e'>4 \duo { \tuplet 3/2 { c''=''8( b a=') } | } { <e'=' g>4 | }
  <d=' g b>4 <d g d'>8. 16 | <e g a>4 <c fis b>8. 16 | <b= d g>2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  {{ template "lh1" (w `g+gM!4-\stBass`) }} a+am!4 c |
  b=,4  c | d a=, | d+d7! d+d7 |

  {{ template "lh1" (w `g+gM!4`) }} c=4 a | d b | c d | g+gM! g,=, |
}
{{ end }}
