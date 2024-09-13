{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key aes \major
  \time 4/4
  aes'='4(\p f' ees8[ c] des bes | aes g16 f ees4) aes( <g bes>8 <ges c> |
  <f=' des'>4 aes <aes des f>4. <c ees>16 <bes des>) |
  <aes=' c ees>4( <aes des f>8 <f aes des> <aes c>4 <bes des>8 <g bes> |
  \duo { aes'='8[ f='] } { ees'='4 } <des=' ees>4) <c aes'>4( <f bes des>8 <des g des'> |
  <ees=' aes c>8 <c f aes> \duo { <des'=' bes'>4 } { f'='8 g=' } <c=' aes'>2) |

  f='8(\mf aes des f ees f des bes | aes f ees bes' c aes bes c) |
  des=''8( c bes aes des ees f aes | ees c) f( des c aes des bes |
  aes='8_\dCre f ees g aes bes c ees) | f(\< ees des c des^\tRit bes g \af 8\! ees=') |

  \duo {
    aes'='4(->\f^\tATem f' ees des16 c bes8 | aes g16 f ees8 g aes2) |
    des=''8( aes des ees f des ees f | ees4) des8( bes c[ aes] bes g |
    aes='8 g16 f ees8 f16 g aes4) aes8( <des f> |
    ees=''16^\tRit des c8 des16 c bes8 <c,=' aes'>2) \fermata \bar "|."
  } {
    aes'='2~ aes8[( g]) f( g) | ees4 des c8[( ees] f ges) |
    f='2 g | aes4 ees2 c4~ | c bes aes f' | aes8 g f16 ees des='8 s2 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key aes \major
  r2 aes=4(-\frBass f' | ees8 c des[ bes] aes g16 f ees4) |
  aes=4( bes8 c des4 aes | f'4. ees16 des) ees4( f8 des |
  c='4 des8 bes aes[ f] ees4) | aes( des,8 ees aes,=,2) \clef treble |

  des'='8 ees f4 c bes | f'8( des bes g aes c ees ges) |
  \duo {
    aes'='4(~ aes8 ges <des f>4 <bes des>) | c( des ees f) |
    ees='1(~ | ees2. des='4) |
  } { f'='8 e ees4 s2 | aes,1 | ees'4 des c2 | bes4 aes bes ees,= | }

  \clef bass
  r8 c,='8-> des[ bes] c aes bes[ ees,] |
  f=8 aes g[ ees] aes,4 c8 ees | aes4 bes8 c des4 c8 bes |
  c='4 bes8 des aes[ c] g bes | <f aes>4 <ees g> <des f> <bes des> |
  <c= ees>4 <bes f'>8 <ees g> <aes,=, ees' aes>2 \fermata |
}
{{ end }}
