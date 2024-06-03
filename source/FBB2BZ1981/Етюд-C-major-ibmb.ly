{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  c''=''16(\mf d e d c8)-. b-. | a-. b-. c4-- |
  c=''16( d e d c8)-. b-. | a-. aes-. g4-- |
  a='16(\mp b c b a8)-. e-. | f16( g a g f8)-. c-. |
  d='16( e f e d8)-. c-. | b-. c-. d='4-- |

  e'=''8\mf g_\aSta e g | f d e g | e g e g | f d e g |
  c,=''8\p e c e | a,_\dCre c a e' | <b f'>8 r8 8 r |
  <g=' f'>8-. <g d'>-. c=''4--\f \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  <c'=' e>8-\frBass r <e g> r | \rep 2 { <c=' e>8 r <e=' g> r | }
  <c=' d>8 r <c=' e> r \clef bass |
  \rep 4 { <a= c>8 r8 } | <f a>8 r8 8 r | <g a> r <g= b> r |

  c='16( d e d c8)-. b-. | a-. b-. c4-- |
  c='16( d e d c8)-. b-. | a-. aes-. g4-- |
  a=16( b c b a8)-. e-. | f16( g a g f8)-. c-. |
  d=16( e f g a8)-. g-. | a-. b-. c='4-- |
}
{{ end }}
