{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key f \major
  \time 3/8
  f'='8\(\p g16 f e f | a8 bes16 a gis a |
  c=''8 d16 c b c | f8 g16 f e f\) |
  a=''8.( g16 f e | d c bes a g f) |
  f='8.( e16 g f | e='4) r8 |

  g='8\( a16 g fis g | c8 d16 c b c |
  e=''8 f16 e dis e | g8 a16 g fis g\) |
  bes=''8.( a16 g f | e d c bes a g) |
  a='16( bes c bes a g | f='4) r8 |

  a='8\(\p bes16 a gis a | cis8 d16 cis b cis |
  d=''8\< e16 d cis \af 16\! d | f=''4\)\mf r8 |
  f,='8\(\p g16 f e f | a8 bes16 a gis a |
  bes='8\< c16 bes a bes | f'8\)->^\tRit e-> \af 8\! d-> |
  c=''16->\f^\tATem c'16( bes a g f | e d c bes a g) |
  f='8-. a-. c-. | f=''4 r8 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  f,=,8-\stBass fM! fM | \rep 2 { f=,8 fM fM | f=, fM! fM | }
  f=,8 fM fM | g[ c@7! c78] | g=,[ c@7 c78] |

  \rep 3 { e'=8[ c@7! c78] | e=[ c@7 c78] | } f, fM! fM | f=, fM fM |

  e'=8[ a@7! a78] | e[ a@7 a78] | d dm! dm | d dm dm |
  c=8[ f@7! f78] | c[ f@7 f78] | bes besM! besM | b[ g@7! g78] |
  c=8[ f@M! fM8] | c c7! c7 | f,=, fM! fM | f+fM!4 r8 |
}
{{ end }}
