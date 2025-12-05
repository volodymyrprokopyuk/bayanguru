{{ define "rh1" }}
  {{ .a }} a' g8 a16 g d8 \af 8\! e) | f(\> g e4 \af 2\! d2) |
  d='8(\< e f a g a16 g d8 \af 8\! e) | c(\> d bes4 \af 2\! a2) |
  f'='8(\< e d c d2) | e8( d c bes \af 2\! c='2) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Adagio cantabile"
  \clef treble
  \key d \minor
  \time 4/4
  {{ template "rh1" (w `d'='4(\p\<`) }}
  d='8( bes d g f4 d8 d) | c( a f' e d2) |
  c='8(\mf d e g f c' c4) | c,8( d e g f2) | g8( f g4) a4( f8 f) |
  e='8( d c g' f='2) |
  \duo { c''=''8( a g f g2) | bes8( g f e f='2) | }
  { s2 bes=8( d d4) | s2 a8( d c='4) | }
  g,=8( a bes d c f f4) |
  \duo { g'='8(\>^\tRit f g \af 8\! e \af 2\! a='2)\< | }
  { s2 r8 cis'='8 f e=' | }

  {{ template "rh1" (w `d='4(\mf\<^\tATem`) }}
  bes=8(\> d a' g f4 d8 d) | c(^\tRit a f' e d4 \af 4\! d'='') \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  R1 | r2 r8 bes,=,8( a g | f4) d@m! g4 gm! |
  f=,4 c@7! r8 g( f e | d4) dm! g8( a bes4) |
  c=4 c7! f,8( g a4) | bes g@m! a4 d@m! |
  a=,4 a7! d dm! | e c@7! f4 fM! | g, c@7! a4 f@M! |
  bes=,4 besM! c f@M! | c4 c7! f, fM! |
  f=,4 f7! g gm! | g c@7! a4 f@M! |
  bes=,4 g@m! a4 f@M! | g4 gm! e'= a@7! |

  d=8[ dm! dm] f, e[ g@M! gM8] g | a[ c@M! cM8] a r bes( a g |
  f=,8[) d@m! dm8] d' g,[ gm! gm] bes | c[ d7! d7] c f( g f e |
  d=8[) dm! dm] a g( a bes g | f[) c@7! c78] c' a[ f@M! fM8] a |
  g=,8[ gm! gm] bes a[ d@m! dm8] f | g f@M! a8 a7! d bes@M! d@m!4-\fermata |
}
{{ end }}
