{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \minor
  \time 4/4
  \acc { g=16 a b } c='4\mp c g'4. ees8 | d4 d8 c b f' ees d |
  c='4. c8 d f c bes | ees f g aes bes des c bes=' |
  \duo {
    c''=''2 d4 c8 bes | bes4 g8 aes bes4( ees) |
    d=''4. c8 bes4 aes | g2 <f aes>4\> <ees g>8 \af 8\! <d=' f> |
  } {
    aes'='4( aes8 g) f2 | g4 ees8 f g2 | bes4 aes g f8( bes,) |
    ees='4 c8 bes b=2 |
  }

  c,='8\p ees g bes bes aes aes4 | aes8 d, f aes c bes bes4 |
  bes='8 aes c ees d c aes f | ees d c bes bes4 c16 d ees f |
  g='8 bes <ees g> <d f>8 8 f,16 g aes bes c8 |
  f,='8 aes <d f> <c ees>8 8 ees,16 f g aes bes='8 |

  \duo {
    <g'=' bes>8 8 4 <aes c>4. <g bes>8 | 4 <f aes> c f |
    c='8 bes bes4 r8 c d f | g4\> ees8 c g'8 aes \af 4\! f='4 |
  } { ees'='2 e | c aes | aes bes | bes b= | }

  c,='8\p g c ees g_\dCre aes g ees | d c d c b\> f' ees \af 8\! d |
  ees='8\< f g c d c aes \af 8\! f | f d c bes bes\< c16 d ees8 \af 8\! g=' |
  \duo {
    <c''='' ees>8\f 8 8 8 4 f,8 ees |
    <g=' bes>8 8 <aes c> <g bes>8 4\> c,8 \af 8\! b |
    c='8\p^\tRit ees g ees' d c aes f | r8 <c'='' ees>8 8[ d] c=''4 %
  } { g'='2 aes4 s4 | d,2 ees4 s4 | s1 | g4. f8 ees='4 } %
  <c='' ees g c>4 \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \minor
  \acc { s8. } c=4-\stBass cm! ees c@m! | f,4 fm! g g7! |
  c=4 cm! bes bes7! | ees eesM! e c@7! | c4 f@m! bes4 bes7! |
  ees=4 eesM! g, ees@M! | aes4 f@m! bes4 bes7! | ees4 eesM! d= g@7! |

  c=4 cm! f, fm! | bes bes7! bes ees@M! |
  aes=,4 f@m! c4 f@m! | bes4 bes7! ees eesM! |
  bes=,4 ees@M! aes4 f@m! | bes4 bes7! ees bes |
  ees=4 ees@M!8[ des8] c4 c7! | f, f@m!8[ c'8] f,4 f@m!8[ aes8] |
  bes=,4 bes7! d bes@7! | ees4 eesM! d= g@7! |

  c=4 cm! ees c@m! | f,4 fm! g g7! | c cm! aes f@m! |
  bes=,4 bes7! ees eesM! | c c@m!8[ g8] f4 fm! |
  bes=,4 bes7! ees d | c cm! aes=, f@m! |
  \duo { r4 r8 g7! r4 cm!4 \fermata | } { g,=,2 c= \fermata | }
}
{{ end }}
