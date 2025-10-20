{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key bes \major
  \time 4/4
  \meter 1/4 1,1,1,1
  f'='4.(\mp g8 a bes c a | bes4 bes bes8 d c bes) |
  f='4.( g8 a bes c a | bes4 bes bes8 aes g f) |
  ees='4(_\dCre g bes aes8 g | f4. f8 f4 ees8 d) |
  c='4.( d8 ees g f ees | bes'4.\> bes8 \af 2\! bes='2) |

  \meter 1/2 1,1
  a='8\mf bes c d ees g f ees | d f d c bes d bes g |
  ees'=''8 d c bes a c a g | f d f g a g a bes |
  ees,='8\< f g a bes c bes g | f g a bes c d ees \af 8\! f |
  g=''8\> ees d c bes a g a | bes^\tRit f d c \af 2\! bes=2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key bes \major
  c'='4-\frBass f ees f | d f bes, f' | a, bes c ees | d c bes aes |
  g=4 bes ees c | d c  d bes= \clef bass | a= f g a | bes8( g f[ ees] d c bes=,4) |

  f=,4-\stBass fM! g a | bes besM! g gm! | c cm! f ees |
  d=4 bes@M! g,4 bes@M! | c4 cm! ees c@m! | d4 dm! g, g7! |
  c=4 cm! f f7! | bes,=, ees@M! bes@M!2 |
}
{{ end }}
