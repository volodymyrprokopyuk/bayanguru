{{ define "rh1" }}
  {{ .a }} g bes8) c,(-> bes) | <d aes'>8(-> c) <d aes'>(-> bes) |
  aes=16(-> c f8) c(-> <aes= d>) |
{{ end }}

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
      <ees=' g>8 g16 aes~ <aes c>4 |
      <f=' aes>8 d16 aes' <g=' bes>4 |
    }
    <c'=''ees>8-> f,16( ees) <bes' d>8-> f16( ees) |
    \alternative {
      \volta 1 { <d=' aes' c>8-> c16( bes) ees bes c d=' | }
      \volta 2 { <d=' aes' c>8-> c16( bes) c bes c d=' | }
    }
  }

  {{ template "rh1" (w `ees='16(->`) }}
  <g= ees'>8( <bes g>) <bes g>(-> <aes f'>) |
  {{ template "rh1" (w `ees'='16(->`) }}
  ees'='16(->\< f) g aes a( bes) c \af 16\! d |
  ees=''16(-> g bes8) c,(-> bes) | <d aes'>(-> c) <d aes'>(-> bes) |
  aes='16(-> c f8) \duo { c''=''8( d='') | } { aes'='4 | }
  <g,=' ees'>8(-> <bes g'> <d g bes> <c f aes>) |
  ees=''16(-> g bes8) c,16 d c bes | <d aes>8(-> c) <d aes>(-> bes) |
  aes='16 c f, g aes bes c d | ees\< g c, c ees g a \af 16\! b='' |

  c='''8-> ees16( g,) <f d'>8-> <ees c'>-> |
  bes'=''8-> c16 aes <bes, g'>8-> <aes f'>-> |
  \duo { <c''='' ees>4-> <bes d>-> | <aes c>-> <g=' bes> | }
  { aes'='8( f) g( ees) | f( d) ees( c=') | }

  aes,=16-> c f aes g f ees g | f-> g aes c bes aes g bes |
  aes='16-> bes c d \duo { ees''=''8 d16 c='' | } { ees''=''16 g, f ees=' | }
  bes='8(->\< f) bes16( aes g \af 16\! f=') |

  \duo {
    ees'='8(->\f <g bes>) ees(-> <aes c>) |
    bes='8(-> <aes c>) c(-> <g bes>) | ees'(-> g) g(-> f='') |
  } { ees'='4 ees | <d g> <ees g> | <g bes>8 <bes ees> <aes=' c>4 | }
  <c'='' f aes>16(-> 16 <bes d g>8) <aes c f>(-> <g bes ees>) |
  aes='16(-> c) f aes g f ees g | f(-> g) aes c bes aes g bes |
  aes=''16(-> g) f ees d(-> c) bes aes | g(-> bes) f(-> bes) %
  \duo { ees'='8(-> <g=' bes ees>) \bar "|." } { ees'='4 | }
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

  bes'=,8 ees@M! r8 ees@M! | f8 fm! r d' | c f@m! r8 bes8 |
  ees=8 eesM! c aes@M! | bes8 ees@M! g8 ees@M! |
  f=,8 fm! r fm! | c' f@m! r8 bes | g ees@M! f8 bes@7! |
  g=,8 ees@M! r8 ees@M! | f8 fm! r8 d' | c f@m! r8 bes |
  c=8 cm! bes bes7! | g ees@M! bes8 ees@M! | f8 fm! r g |
  f=,8 fm! f bes@7! | ees'8 bes c d | c bes aes g |
  f=,8 fm! d' f@m! | aes8 f@m! g8 c@m! | d'8 f@m! ees=4 |

  c=8 f@m bes8 ees@M! | aes8 f@m! g8 ees@M! | c8 f@m! g8 c@m! |
  f=,8 aes@M! d'8 bes@7! | g,8 ees@M! aes8 f@m! | bes8 bes7! ees eesM! |
  c=8 cm! aes f@m! | bes8 bes7! bes ees@M! | f8 fm! ees' c@m! |
  d=8 bes@7! ees8 eesM! | c aes@M! c8 f@m! | d8 bes@7! ees=4-> |
}
{{ end }}
