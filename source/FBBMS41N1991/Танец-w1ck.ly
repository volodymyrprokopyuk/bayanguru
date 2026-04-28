{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key ees \major
  \time 2/4
  ees'='16->\f f g bes f g aes c | bes c d f ees f ees f |
  g=''16-> f ees d f ees d c | bes aes g f ees^\tRit d c d=' |

  \repeat volta 2 {
    ees='8->\mf <g bes>16 ees( <ees aes c>8) 8 |
    \duo {
      <g'=' bes>8( <aes c>) <g c> <g bes> | bes ees( <c ees>4) |
      <g=' bes>2 | c8 <c ees> <ees g> <c ees f> |
      c=''8 <c ees f>( <d f>) <c='' ees> |
    } {
      d'='4 ees | g aes8( f)~ | f( d) f( ees) |
      <ees=' g>8 g16 aes!~ <aes c>4 |
      <f=' aes>8 d16 aes' <g=' bes>4 |
    }
    <c'=''ees>8-> f,16( ees) <bes' d>8-> f16( ees) |
    \alternative {
      \volta 1 { <d=' aes' c>8-> c16( bes) ees bes c d=' | }
      \volta 2 { <d=' aes' c>8-> c16( bes) c bes c d=' | }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key ees \major
  g,=,8-\stBass ees@M! aes8 f@m! | f8 bes@7! g8 ees@M! |
  c=8 cm! c f@m! | d=8 bes@7! ees+eesM!8 r |

  bes=,8 ees@M! f8 fm! | f bes@7! ees'8 eesM! | c cm! c f@m! |
  f,=,8 bes@7! g8 ees@M! | bes8 ees@M! c8 f@m! | aes8 f@m c8 cm! |
  aes=,8 f@m! g8 c@m! | f8 bes@7! g8 ees@M! | f8 bes@7! ees=,8 r |
}
{{ end }}
