{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key f \major
  \time 3/8
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      a'='16(\p bes b c cis d | ees e f fis g gis |
      a=''8)-.\< bes-. \af 8\! b-. | d4(\> \af 8\! c8) |
      f,,='16(\p fis g gis a bes | b c cis d ees e |
      f=''8)-.\< g-. \af 8\! gis-. | bes4(\> \af 8\! a8) |
      g=''16(\mf a g a g8) | c16( d c d c8) |
      a=''16( bes a bes a8) | f16( g f g f8) |
      g=''16( a g a g8) | c,16( d c d c8) | f-. c-. a-. | f=' r r \fine |
    }

    \volta 2
    g'=''16(\mf\> fis f e ees d | des c b bes a \af 16\! aes |
    g='8)-.\< a-. b-. | c-. d-. \af 8\! e-. |
    f=''16(\mf\> e ees d des c | b bes a aes g \af 16\! fis |
    f='8)-. g-. \af 8\! a-. | b-. c-. d-. |
    e=''16( dis e dis e8) | g16( fis g fis g8) |
    d=''16( cis d cis d8) | f16( e f e f8) |
    b,='16( ais b ais b8) | d16( cis d cis d8) |
    c=''8-.\> d-. c-. | bes-. a-. \af 8\! g='-. \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  f,=,8-\stBass fM! fM | \rep 7 { f=,8 fM! fM | }
  \rep 2 { e'=8[ c@7! c78] | } \rep 2 { f,=,8 fM! fM | }
  \rep 2 { c'=8 c7! c7 | } | f, fM! fM | f=, r r |

  \rep 4 { e'=8[ c@M! cM8] | } \rep 4 { d=8[ g@M! gM8] | }
  \rep 2 { c=8 cM! cM | } \rep 2 { f,=,8[ d@m! dm8] | }
  \rep 2 { g=,8 g7! g7 | } | c+cM!4 r8 | R4. |
}
{{ end }}
