{{ define "rh1a" }}
  {{ .a }} a-. b-. c]-. | d16( e d cis d8)-. {{ .b }} |
{{ end }}

{{ define "rh1b" }}
  {{ .a }} c-. d-. e]-. | b'16( c b ais b8)-. {{ .b }} |
{{ end }}

{{ define "rh2b" }}
  a='8[-. fis-. fis-. a] | b16( a b c d8)-. {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key g \major
  \time 2/4
  \duo {
    \repeat volta 2 {
      {{ template "rh1a" (w `g'='8[-.\mf` `g=''8-.`) }}
      {{ template "rh1a" (w `g,='8[-.` `b='8 \rest`) }}
    }

    \repeat volta 2 {
      fis'=''8[-. a-. d,-. fis]-. | g16( fis g a b8)-. g-. |
      fis=''8[-. a-. d,-. fis]-. |
      \alternative {
        \volta 1 { g=''16( fis g a b8)-. b,=' \rest | }
        \volta 2 { g'=''16( a g fis g8)-. b,=' \rest | }
      }
    }

    \repeat volta 2 {
      g='8-.\f g'-. e(-> d16 c) | b( ais b d) a( gis a d) |
      g,='8-. g'-. e(-> d16 c) |
      \alternative {
        \volta 1 { b='16( ais b d a8)-. b=' \rest | }
        \volta 2 { b='16( c b a g8)-. b=' \rest | }
      }
    }

    \repeat volta 2 {
      b='16( ais b d) a( gis a b) | b16( ais b e) d8(-> c) |
      b='16( ais b d) a( gis a b) |
      \alternative {
        \volta 1 { b='16( c b a g8)-. b=' \rest | }
        \volta 2 { b='16( c b a g8)-. b=' \rest | }
      }
    }

    \repeat volta 2 {
      g='8-. a-. b-. c-. | d16( e d cis d8)-. g-. |
      g,='8-. a-. b-. c-. |
      \alternative {
        \volta 1 { d=''16( e d cis d8)-. b=' \rest | }
        \volta 2 { d=''16( e f fis  g=''4)-> \bar "|." }
      }
    }
  } {
    {{ template "rh1b" (w `b=8[-.` `b='8-.`) }}
    {{ template "rh1b" (w `b,=8[-.` `s8`) }}

    {{ template "rh2b" (w `b='8-.`) }}
    {{ template "rh2b" (w `s8`) }}
    b='16( c b a b='8)-. s8 |

    b,=8-. b'-. c(-> b16 a) | g( fis g b) fis( eis fis8) |
    b,=8-. b'-. c(-> b16 a) | g( fis g b fis8)-. s8 |
    g='16( a g fis g='8)-. s8 |

    d='4 c | d8-. g-. fis(-> e) | g16( fis g b) fis( eis fis8) |
    \rep 2 { g='16( a g fis g='8)-. s8 | }

    b,=8-. c-. d-. e-. | b'16( c b ais b8)-. b-. |
    b,=8-. c-. d-. e-. | b'16( c b ais b8)-. s8 | d16( c b a g='4)-> |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  <g,=, d'>8-\frBass r8 8_ \aSta r | \rep 2 { <g=, d'>8 r8 8 r8 | } | 8 8 8 r8 |
  \rep 2 { d'=8 d' a d | g, d' g, r | } | g d g,=, r |

  g'=8 d' <c e>4-> | g8 d' a d | g, d' <c e>4-> | g8 b d d,= | g d' g,= r |
  \duo { b=4 a= | } { g=8 d fis d= | } | g8 d' <c e>4-> |
  g=8 d' a d | g, d' g, r | g d' g,= r |

  \rep 3 { <g,=, d'>8 r8 8 r8 | } | 8 8 8 r8 | <d' a'> r <g,=, g'>4-> |
}
{{ end }}
