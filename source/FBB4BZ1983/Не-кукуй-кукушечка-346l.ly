{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key d \minor
  \time 4/4
  d''=''4.(\p\< f8 a4 bes | a g8 f g4 \af 4\! g | \af 1\! d1)~\> |
  \af 1\! d=''1~\< | d~ | \af 1\! d=''\> |

  \duo {
    d'='4(\mp f a bes | a\< f \af 2\! g2 | f1) |
    a='4(\mf g8 a bes4 a8 g | a4. bes8 g4 g | \af 1\! d'=''1)\>^\tRit |
  } { d'='2 f4 g | f d e2 | c1 | f4 e8 f g4 f8 e | f2 e | a='1 | }

  r8\mp f=''8--^\tATem d-- r r f-- d-- r |
  \rep 5 { r8 f=''8-- d-- r r f-- d=''-- r | }

  \duo { d'='4.( f8 a4 bes | <f a>\< f \af 2\! <e g>2 | f='1) | }
  { d'='2~ <d f> | d1 | c='1 | }

  \trio {
    a'='4( g8 a bes4 a8 g | a4. bes8 g4 g | d'1~\> |
    \af 1\! d='')\pp \bar "|."
  } { c'='2\f bes | c2 e4 e | d1~ | d=' | }
  { f'='1_~ | f2 s2 | a1_~ | a=' | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key d \minor
  \rep 3 { R1 | } | a'='4(-\frBass g8 a bes4 a8 g | a4. bes8 g4 g |
  d='1) | d( | d2.) c4 | a1 | d~ | d2 c | d='1 |

  d='4.( f8 a4 bes | a g8 f g4 g | d1) | a'4( g8 a bes4 a8 g |
  a='4. bes8 g4 g | d1) | d4( c bes2 | c2 bes4 c=') \clef bass |
  a=4( g f e) | ees2( d2~ | d a | d,1~ | d=,) |
}
{{ end }}
