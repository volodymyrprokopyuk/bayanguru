{{ define "rh1" }}
  c='''8 \tuplet 3/2 { g=''16( aes g) } f8 ees |
  \tuplet 3/2 { ees=''16( f ees) } d8 d16 g, b d |
  g=''8 \tuplet 3/2 { f=''16( g f) } ees8 d='' |
{{ end }}

{{ define "rh2" }}
  c,='16 d ees f g8 c | \tuplet 3/2 { c=''16( d c) } b8 b16 c d=''8 |
{{ end }}

{{ define "rh3" }}
  c,='16 d ees f g a b c | \tuplet 3/2 { c=''16( d c) } b8 b16 c d=''8 |
{{ end }}

{{ define "rh4" }}
  \rep 2 { c=''8 c16 aes f g aes bes=' | }
  \set subdivideBeams = ##t
  \tuplet 3/2 { c=''16( des c) } b c='' %
  \set subdivideBeams = ##f
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \minor
  \time 2/4
  \meter 1/8 2,2
  \partial 8 { \tuplet 3/2 { g''=''16(\mf a b) } | }
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      {{ template "rh1" }} | ees=''8 d16 c b c ees g | {{ template "rh1" }}
      \alternative {
        \volta 1 { c=''8 r <c ees g c> \tuplet 3/2 { g'=''16( a b='') } | }
        \volta 2 { c,=''8 r <c='' ees g c> r | }
      }
    }

    {{ template "rh2" }} | g,='16 a b c d8 ees |
    \tuplet 3/2 { d=''16( ees d) } c8 c16 b c8 |
    {{ template "rh2" }}
    \set subdivideBeams = ##t
    \tuplet 3/2 { g,='16( aes g) } fis g a8 b |
    \set subdivideBeams = ##f
    c=''8 r <c='' ees g c> r |

    {{ template "rh3" }} | g,='16 a b c d cis d ees |
    \tuplet 3/2 { d=''16( ees d) } c8 c16 b c8 |
    {{ template "rh3" }}
    \set subdivideBeams = ##t
    \tuplet 3/2 { g,='16( aes g) } fis g a8 b |
    \set subdivideBeams = ##f
    c=''16( d ees g) <c,='' ees g c>8 r \fine |

    \volta 2
    \repeat volta 2 {
      c,='16 b c d e c d e | f e f g aes g f aes |
      g='16 g, b d g f ees d |
      \alternative {
        \volta 1 { ees='16 d c bes aes g a b= | }
        \volta 2 { c='16 d ees g <c, ees g c>8 bes'16 b=' | }
      }
    }

    \key f \minor
    \repeat volta 2 {
      {{ template "rh4" }} des=''8-. c-. |
      \rep 2 { bes='16 c bes aes g fis g aes=' | }
      bes='8 bes16 aes g fis g aes |
      \set subdivideBeams = ##t
      \tuplet 3/2 { bes='16( c bes) } a bes c8-. bes-. |
      \set subdivideBeams = ##f
      aes='16 bes aes g f g aes bes | {{ template "rh4" }} f8-. ees-. |
      des=''16 ees des c bes8 bes16 c |
      des=''8 \tuplet 3/2 { des=''16( ees des) } c8 bes |
      aes='16 bes aes g f g aes f | g aes g f e f g e |
      \alternative {
        \volta 1 { f='8 aes16 c <aes c f>8 bes16 b=' | }
        \volta 2 {
          f='8 aes16 c <aes c f>8 \tuplet 3/2 { g'=''16( a b='') } \bar "||"
        }
      }
    }
  }
  \keyChangeBeforeBar
  \key c \minor
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \minor
  \partial 8 { r8 | }
  c=8-\stBass cm! g c@m | b8 g@7! g8 g7 |
  d'=8 g@7! g,8 g7 | \rep 2 { c=8 cm! g=, c@m | }
  b=,8 g@7! d8 g@7 | b8 g@7! g8 g7 | \rep 2 { c=8 g c= r | }

  c=8 cm! g c@m | d'8 g@7! g,8 g7 |
  b=,8 g@7! g8 g7 | c cm! g c@m |
  c=8 cm! ees c@m | \rep 2 { d=8 g@7! g,=,8 g7 | } c g c= r |

  c=8 cm! g c@m | \rep 2 { d'=8 g@7! g,=,8 g7 | }
  \rep 2 { c=8 cm! g=, c@m | } d'=8 g@7! g,8 g7 |
  b=,8 g@7! g8 g7 | c g c= r |

  c=8 cm! e c@7! | f,8 fm! aes f@m |
  g=,8 g7! b g@7 | c8 cm! ees c@m | c8 g c= r |

  \key f \minor
  \rep 2 { f,=,8 fm! c'= f@m | } f,8 fm! aes f@m |
  \rep 3 { g=,8 c@M! c=8 cM | } g c@7! c8 c7 |
  f,=,8 fm! aes f@m | \rep 2 { f=,8 fm! c'= f@m | }
  f,=,8 fm! a f@7! | bes8 besm! bes r |
  bes=,8 besm! des bes@m | f,8 fm! aes f@m |
  c=8 c7! c c7 | \rep 2 { f,=,8 c' f,=, r | }
  \keyChangeBeforeBar
  \key c \minor
}
{{ end }}
