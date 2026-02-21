{{ define "rh1" }}
  d=8(-> <f a d>8) 8 8 a,(-> <f' a d>8) 8 8 | bes,=,8(-> <g'= bes d>8) 8 8 %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Tempo di marcia"
  \clef treble
  \key f \major
  \time 4/4
  f'='8->\f f16 f a f a c f2-> | f,8-> f16 f bes f bes d f2-> |
  bes,='8.(-> a16) g8 f e f g a | f4-> f8. f16 f8(-> c) d-. e='-. \bar "||"

  \repeat segno 2 {
    f='8.(-> c16) f8 g a g f a | g8.(-> d16) g8 a g2 |
    c,='8.(-> c16) e8 f g f e g | f8.(-> g16) a8 bes c-> c,16 c c8 c |
    f='8.(-> c16) f8 g a(-> g) fis-. a-. | g8.(-> d16) g8 bes d2-> |
    c=''8.(-> a16) c8 d c(-> bes) a-. g='-. \bar "||"
    \alternative {
      \volta 1 {
        f='8.(-> c16) a'8 g f(-> g) f-. e-. | d4(->\mp a) f'( d) |
        f='8(-> f) e-. d-. cis4-> a | cis-> d-> e-> g-> |
        a='8.(-> g16) f8 e d(-> a) b-. cis-. | d4(-> a) f'(-> a) |
        g='8.(-> d16) g8 bes d2-> | c8.(-> a16) c8 d bes8.(-> g16) bes8 d |
        c=''8(-> c,16) c c8 c f(-> c) d-. e='-. |
      }
      \volta 2 { \section \sectionLabel "Coda" }
    }
  }
  f='4-> f8. f16 f='4-> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  r2 r4 f=16-\frBass f f8 | r2 r4 bes16 bes bes a |
  <g= c e>4 r <bes c e> r | <a c f> <bes d f> <a= c f> r |

  <a= c f>4 4 <f a c>4 4 | <g bes d>4 4 8. f16 e8 d |
  c=4-> <bes' c> c, <bes' c> | <a c f>4 4 <bes c e> c, |
  <a'= c f>4 f fis <c' d> | <bes d> d, <g bes> <g bes d> |
  <f= a>4 <a c f> <bes= d f>4 4 |

  <a= c f>4 f <g a cis> r | {{ template "rh1" }} a,=,(-> <g' a cis>8) 8 8 |
  e=8-> <g a cis> f-> <g bes d> g-> <a cis> cis,-> <a' cis> |
  cis,=8[ <g' a cis> r8 8] <f a d> r r4 |
  {{ template "rh1" }} bes,=,8(-> <g' bes d>8) 8 r |
  <a= c>8 f <a c> c, <bes' d> d, <bes' d> e, |
  c=8-> <e bes'> c <e bes'> <f a> r8 r4 | <a c f>-> <bes d f> <a= c f>-> r |
}
{{ end }}
