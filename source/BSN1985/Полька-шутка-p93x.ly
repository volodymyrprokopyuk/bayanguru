{{ define "rh1" }}
  {{ .a }} c)-. f a, | g-> a g4-- |
  bes='8(-> g)-. a bes | d4(-> c='')-. |
{{ end }}

{{ define "lh1" }}
  {{ .a }} fM! fM] r | bes[ g@m! gm8] r | c=8[ c7! c7] r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 2/4
  {{ template "rh1" (w ` \acc { c''=''16 cis } d=''8(->\mf`) }}
  f,='8_\dCre g a(-> c)-. | g a bes(-> d)-. |
  f=''8(-> d)-. e f | g4(->_\dDim c,='')-. |

  {{ template "rh1" (w ` \acc { c=''16 cis } d=''8(->`) }}
  bes='8(->_\dCre a)-. g \acc { cis=''8 } d-> |
  a='8(-> g)-. f \acc { b='8 } c-> | d(-> bes)-. a g |
  f='8->\f r \acc { d'=''16 e } f=''8-> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  \grace { s16 s }
  {{ template "lh1" (w `f,=,8[-\stBass`) }} | a=,8 f@M! g8 c@7! |
  f=,8 fM! c' f@M | bes8 g@m! d8 g@m | g,8[ gm! gm] r | c[ bes a g=,] |

  {{ template "lh1" (w `f=,8[`) }} | a=,8[ f@M! fM8] r |
  g=,8 gm! bes g@m | c8 f@M! c8 f@M | c8 c7! g c@7 | f8 fM! f=, r |
}
{{ end }}
