{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key d \minor
  \time 2/4
  \repeat segno 2 {
    \volta 1
    a'='16(\mf bes a bes a8) d | g,16( a g a g4) |
    g='16( a g a g8) c | f,16( g f g f8) e |
    d='16(-> f) bes d cis(-> e) a, g | f(-> bes) d f e(-> d) c bes |
    a='16( bes a bes a) f' e d | a(->\< bes) b cis d e f \af 16\! g='' |

    a=''16(->\f bes a bes a) d-. a-. d-. | g,(-> a g a g) a-. bes-. d-. |
    g,=''16(-> a g a g) c-. g-. c-. | f,(-> g) f-. g-. f(-> g) f-. e-. |
    d=''16(-> e) d-. e-. a(-> d,) d-. d-. |
    c=''16(-> d) c-. d-. f(-> bes,) bes-. bes-. |
    a='16(-> bes) a-. d-. a(-> bes) a-. bes-. |
    a='16(-> f') g,(-> e') d=''8-- r \fine \bar "||"

    \volta 2
    <a=' c>16(->\p f) f8 <a c>16(-> f) f'8 |
    <bes,=' d>16(-> g) g8 <bes d>16(-> g) g'8 |
    e=''16(-> g) d g c,(-> g') bes, g' | a, c f a g(-> bes) d, c |
    <a=' c>16(-> f) f f <a c>(-> f) f' f, |
    <bes=' d>16(-> g) g g <bes d>(-> g) g' g, | e' g d g c, g' bes, g' |
    a,='16(->^\tRit c) f a g(-> f) e a='' \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  r8 d@m!8[-\stBass r8 dm] | r g@m![ r8 bes@M!] |
  r8 c@7![ r8 c7] | r8 f@M![ r8 a@7!] |
  r8 bes@M!8[ r8 a@7!] | d@m!8[ r8 g@m!] r8 |
  f@M!8[ r8 d@m!] r8 | a@M![ a@7!8] d@m!8 r8 |

  d=8 dm! cis c | bes g@m! d8 g@m! | c8 c7! bes c@7! |
  a=,8 f@M! e'8 r | d dm! f, d@m! | g8 c@7! f8 bes@M! |
  a=,8 d@m! f=,8 d@m! | r8 a+a7![ d+dm!] r8 |

  f@M![ fM8] f@M![ d@m!8] | g@m!8[ gm8] bes@M!8[ g@m!8] |
  c'=8 c c c | f, fM! e' c@7! | f,8 fM! r d@m! |
  bes=,8 g@m! r8  g@m! | c8 c7! e c@7! | f,8 fM! e'= a@7! |
}
{{ end }}
