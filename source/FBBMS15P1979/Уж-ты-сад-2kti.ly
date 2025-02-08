{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key c \major
  \time 3/4
  \partial 4 { c'='8(\p c | }
  f='4. g8 a[ c] | g4~ g8 f16 e) d8( c | f4. g8 a[ c] | g2) g8( g |
  c=''4. d8 c[ bes] | f2) c'8( a | g bes a g d'4 | c=''2) r4 |

  r8\mf <a=' c f>8_\aSta 8 8 r8 8 | r <bes d g>8 8 8 r8 <bes e g> |
  r8 <a=' c f>8 8 8 r8 8 | r\< <bes d g>8 8 \af 8\! 8 r8 <b f' g> |
  r8\f <c='' e g>8 8 8 r8 8 | r <a d f>8 8 8 r8 <f a d> |
  r8_ \dDim <g=' bes d>8 8 8 r8 <f g b> | r <e g c>8 8 8 g[(\mp g] |
  \af 4.\! c=''4.\< d8 c[ bes] | \af 4.\! a2)\>^\tRit \fermata %
  \tempo Lento
  c=''8( a | g\> bes a g d'4 | \af 2\! c=''2)--\p \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \partial 4 { r4 | }
  r4 <a= c>4---\frBass r | r <bes c>-- r | r <a c>-- r | r <bes c>-- r |
  r4 <bes= c>4-- r | r <a c>-- r | r <bes d>-- r8 <b f'> | r <c e>8 8 r c,( d16 e= |

  f=4. g8 a[ c] | g4~ g8 f16 e) d8( c | f4. g8 a[ c] | g2) g8( g |
  c='4. d8 c[ bes] | f2)  c'8( a | g bes a g d'4 | c2) r8 f( |
  e='8 d c bes a g | f c f4) \fermata r |
  \duo { e'='4( f8 e f='4) | } { s2 r8 e=8-- | } | <c'=' e>2-- %
}
{{ end }}
