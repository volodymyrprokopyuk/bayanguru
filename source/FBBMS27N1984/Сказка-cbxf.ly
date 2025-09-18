{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key a \minor
  \time 4/4
  e''=''4(\mp d8 e c b a4) | e'8( e d e c4 a) | b( a8 c b a b4 | e, g e2) |
  e'=''8(\mf e d e c b a4) | r8 e'( g e d4) a8( b | c b a c b a b4) |
  e,='2.(\mp g4) | e1~^\tRit | <e=' a e'> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  r2 <a= e'>4(-\frBass <d fis>4) | r <c g'>( <f a>2) | r2 <b, dis> |
  \duo { d'='2.( cis='4) | } { c'='4( b a=2) | }
  r4 <f'=' a>4 <e g> <d fis> | <c g'>2( <f a>) | r4 <f, c'> <b dis>2 |
  \duo { d'='1~ | d4 cis d cis | c='1 | } { c'='4 b c b | a1~ | a= | }
}
{{ end }}
