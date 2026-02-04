{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \minor
  \time 2/4
  c'='8(\mf c ees d | ees c g' f) | ees( ees d ees16 f | c8 c c bes) |
  ees='8( c f4) | ees8( c f4) | ees8( ees d4 | c8 c c bes) |
  ees='8(\< c f4) | ees8( c \af 4\! f4) | ees8(\> ees d4 | c8 c \af 4\! c='4) |

  \duo {
    ees''=''4(\mf c8 d | c ees e f) | g( c, b4 | c8\< c c \af 8\! bes) |
    ees=''8(\f c f4) | ees8( c f4) | ees8( ees d4 | c8 c c bes) |
    c=''8(\mf\< ees d f | g c, g' f16 \af 16\! d) |
    c=''8(\> c b4 | \af 2\! c=''2) |
  } {
    g'='4. b8 | c4 bes8 aes | g4 f | ees4. f8 |
    g='4 aes | g aes | g f | ees4. f8 | g4 aes | bes aes |
    g='8 g f( g16 f) | ees8( d <c=' ees>4) |
  }

  \duo {
    c''=''2~ | c | g4 b | c4.( bes8) | ees( c f4) | ees8( c f4) |
    ees=''8( ees d4) | c4.(\< \af 8\! bes='8) |
  } {
    c'='8( c ees d | ees c <ees g> <d f>) | ees8( ees d ees16 f |
    c='8 d ees f) | g4 aes | g aes | fis8 fis f4 | <ees g>8 8 8 <d=' g> |
  }
  <g'=' c ees>8\f <ees g c> <aes d f>4 | <g c ees>8 <ees g c> <f=' b f'>4 |
  \duo { <c''='' ees>8\>^\tRit 8 <b d>4 | \af 2\! c=''2 \fermata \bar "|." }
  { fis'='8 fis f4 | <ees g>8-- <d f>-- <c=' ees>4-- \fermata | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \minor
  c=8-.-\frBass g'-. c,-. f-. | c-. g'-. c, aes'-. | c,-. g'-. c,-. f-. |
  c=8-. ees-. c-. d-. | g4 d | c aes | a b | c d= |

  g=4 <f aes> | <g c> <aes c> | <a c> <g b> | g8( f ees d) |
  c=8 c ees d | ees c g' f | ees ees d( ees16 f) | c4. d8 |
  ees=4 d | c aes | a b | c4. d8 | ees( c f4) | ees8( c f4) |
  ees=8 ees d4 | c8 c c=4 |

  c=8 cm! bes aes | g ees@M! aes8 f@m! | f8 fM! g g7! | c g c d |
  ees=8 eesM! aes, aesM! | c cm! f, fm! | d' d7! g, g7! | c g c g |
  f=,8 f7! bes+bes7!4 | ees'8 eesM! aes,4 | d8 d g,4 |
  aes=,8-- bes-- c=4-- \fermata |
}
{{ end }}
