{{ define "t1" }}
  \tuplet 3/2 { {{ .a }} } \tuplet 3/2 { {{ .b }} } |
{{ end }}

{{ define "rh1" }}
  {{ template "t1" (w .a `b ees bes`) }}
  {{ template "t1" (w `aes='8 ees' c` `g ees' c`) }}
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Moderato cantabile"
  \clef treble
  \key c \minor
  \time 2/4
  \duo {
    {{ template "rh1" (w `g'='8\mf ees'_\aLeg c`) }}
    {{ template "t1" (w `f,='8 c' aes` `ees c' aes`) }}
    {{ template "t1" (w `g='8 g' ees` `d ees c`) }}
    {{ template "t1" (w `ees,='8 c' g` `fis c' g`) }}
    {{ template "t1" (w `f='8 c' aes` `ees c' g`) }}
    {{ template "t1" (w `d='8 b' g` `fis <g b> f`) }}
    {{ template "t1" (w `ees='8 g c` `ees c g='`) }}

    {{ template "rh1" (w `g='8 ees' c`) }}
    {{ template "t1" (w `bes='8 f' ees` `d c bes`) }}
    {{ template "t1" (w `g='8 bes ees` `g ees bes`) }}
    {{ template "t1" (w `ees,='8 c' aes` `c, f ees`) }}
    {{ template "t1" (w `aes,=8 d c` `c f ees`) }}
    {{ template "t1" (w `ees='8 c' g` `d b' g`) }}
    \tuplet 3/2 { c,='8 ees g } c=''4 |

    b='4 b | c c | d d | ees 2 | f4 f | g g | a a | b=''2 |

    c='''4 c | bes bes | aes aes | g2 | fis4 fis | f ees | c=''2 |
  } {
    g'='2 | aes4 g | f ees | g2 | ees | f4 ees | d2 | ees=' |

    g='2 | aes4 g | bes aes | g2 | ees4 c | aes c | ees d | c='2 |

    {{ template "t1" (w `b'='8 f g` `b f g`) }}
    {{ template "t1" (w `c=''8 ees, g` `c ees, g`) }}
    {{ template "t1" (w `d'=''8 f, g` `d' f, g`) }}
    {{ template "t1" (w `ees'=''8 ees, c'` `aes c g`) }}
    {{ template "t1" (w `f'=''8_\dCre g, aes` `f' a, bes`) }}
    {{ template "t1" (w `g'=''8 a, bes` `g' b, c`) }}
    {{ template "t1" (w `a'=''8 b, c` `a' cis, d`) }}
    {{ template "t1" (w `b'=''8 d, g` `fis g f=''`) }}

    {{ template "t1" (w `c'='''8\f c, ees` `c' c, ees`) }}
    {{ template "t1" (w `bes'=''8 bes, ees` `bes' bes, ees`) }}
    {{ template "t1" (w `aes=''8 aes, c` `aes' aes, c`) }}
    {{ template "t1" (w `g'=''8 g, ees'` `d ees c`) }}
    {{ template "t1" (w `fis=''8 fis, c'` `fis_\dDim fis, c'`) }}
    {{ template "t1" (w `f=''8 aes, g` `ees' fis, f`) }}
    {{ template "t1" (w `c'=''8 c, ees^\tRit` `d f aes='`) }}
  }
  \af 2\! <ees'=' c'>2\> \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \minor
  c=4-\stBass cm! | c cm | c f@m! | c4 cm! |
  c=4 cm! | c cm | g gM! | c= cm! |

  c=4 cm! | c cm | d bes@7! | ees4 eesM! |
  aes,=,4 aesM! | f fm! | g+c@m! g+g7!4 | c'= cm! |

  d=4 g@7! | ees4 c@m! | b4 g@7! | c4 cm! |
  d=4 bes@7! | ees4 eesM! | d d7! | g,=, g7! |

  aes=,4 aesM! | g ees@M! | f4 fm! | ees' c@m! |
  aes,=,4 aesM! | g g7! | c= f@m! | c+cm!2 \fermata |
}
{{ end }}
