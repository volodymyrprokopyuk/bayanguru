{{ define "rightHand" }}
\relative {
  \tempo "Con moto"
  \clef treble
  \key f \major
  \time 2/4
  r8\f <a'=' c d f>4 8 | r8 8[ r8 8] | r8 8 4 | r8\> 8[ r8 \af 8\! 8] |
  f'=''16(->\f e d c bes a g f | e8) g-. bes4-> | e16(-> d c bes a g f e |
  f='8) a-. c4-- | a16(->\< bes b c a bes b \af 16\! c |
  bes='16-> c a bes \af 4\! g4)\> | g16(->\< gis a bes g gis a \af 16\! bes |
  a='16-> bes g a \af 4\! f='4)\> |

  f'=''16(->\f e d c bes a g f | e8) g-. bes4-- |
  e=''16(->\< a, bes b c cis f e | d8) f-. \af 4\! a4 |
  bes=''16(-> cis, d dis e d c' bes) | a(-> cis, d f e d bes' a) |
  gis=''16(-> b, e d cis d e f | e d cis d c\> bes a \af 16\! g=') |

  a='8\f c <f a>(-> c) | bes16(-> c a bes g4) | g8 bes <c e>(-> bes) |
  c=''16(-> d bes c a4) | c16(->\< b bes a f' d des \af 16\! c |
  bes='16-> c a bes \af 4\! g4)\> | bes16(->\< a aes g e' c b \af 16\! bes |
  a='16-> bes g a \af 4\! f='4)\> |

  c'=''16(\< b bes a c b bes \af 16\! a) | <dis e>8-- 8-- 4-- |
  bes='16(\< a aes g bes a aes \af 16\! g) | <cis d>8-- 8-- 4-- |
  c=''16(\< a e f fis g bes \af 16\! a) | <cis, d>8-- 8-- 4-- |
  c='16\< c' cis, c' d, c' dis, \af 16\! c' |
  e,='8 <e gis c>-> <a=' c f>4->\f \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  f,=,8-\stBass fM! c' f@M! | \rep 4 { f,=,8 fM! c'= f@M! | }
  \rep 2 {
    \rep 2 { g=,8 c@7! c=8 c7! | } \rep 2 { f,=,8 fM! c'= f@M! | }
  }
  g=,8 c@7! c8 c7! | a a7! e' c@7! | d8 dm! f, d@m! | g8 gm! bes g@m! |
  a=,8 d@m! f8 d@m! | e8 e7! a a7! | d= dm! c+c7! r |

  \rep 3 {
    f,=,8 fM! c' f@M! | \rep 2 { g=,8 c@7! c=8 c7! | } | f, fM! c'= f@M! |
  }
  f,=,8 fM! d' d7! | g+gm!8 g+gm8 g+gm4 | c+c7!8 r8 r4 | r8 c-> f,=,4-> |
}
{{ end }}
