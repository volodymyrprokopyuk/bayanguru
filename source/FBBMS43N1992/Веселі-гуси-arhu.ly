{{ define "lh1" }}
  {{ .a }} c'16( d c8) f='-. |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key f \major
  \time 2/4
  R2\mf | R2 | \rep 2 { bes'='8(-> a) g-. f-. | c'4-> c=''-> | }
  bes='8(-> d) d-. bes-. | a(-> c) c-. a-. | g(-> a) bes-. g-. | f4-- f-- |
  bes='8(-> d) bes16(-> a g8) | a(-> c) a16(-> g f8) | g-> g16( f e8) c |
  f='4 f=' |

  bes='8->\p a16( bes g8) f | c'16(-> d c8) c,16(-> d c8) |
  bes=16\< c d e f g a \af 16\! bes | c d c d c, f a c |
  <g=' bes>16(-> d) <bes' d>8 \duo { <bes'=' d>8( <g=' bes>) | } { e'='4 | }
  <f=' a>16(-> c) <a' c>8 \duo { <f'=' c'>8( <f=' a>) | } { d'='4 | }
  <bes,= d g>8-> g16 a bes c d e | f g a bes=' %
  \duo {
    c''=''16 d c d | bes8 bes d bes | a a c bes16 a |
    g='8^\tRit e f g | a4 r16 <cis, e> <d f> <e=' g> |
  } {
    a'='8 r | r16 <d, e>16[ r16 16] r <e bes'>[ r <d e>] |
    r16 <c=' f>16[ r16 16] r <d fis> r8 |
    r16 <bes= d>16[ r16 16] r <bes d>16[ r16 16] |
    r16 <cis=' g'>16 16 16 a=4 |
  }

  \tempo Largo
  \duo {
    d'='8(\p\< e) f( g) | \af 8.\! a4 \af 4\! d,\> |
    g='8( d) bes'( e,) | <f~ a>4 <f bes>8( a) | <e g>8 8 <e bes'> <e g> |
    <f=' a>8(\< 8) <fis c'>( <fis a>) |
    <g=' bes>8( <bes d>) <a c>( \af 8\! <g=' bes>) |
  } {
    d'='4 cis | c2 | bes4 c~ | c8 cis d4~ | d cis8 c~ | c4 d~ | d e=' |
  }

  \tempo Allegro
  \rep 2 { <f=' a c>8 8 8 8 | } |
  r <c=' f a>8[ r8 8] | r <e a c>[ r <c e a>] |
  r8 <c=' f a>8[ r8 8] | r8 <e a c>8[ r8 8] |
  <d=' g bes>8 <g bes d> <e bes' d> <c e bes'> |
  <c=' f a>8 <f a c> <d fis c'> <c d fis> |
  <bes= d g>8 <d g bes> <c e a> <bes e g> |
  <a= c f>8 c16 d e f g a | bes d bes a g f e d |
  c='16 d e f g a bes c | bes a g a bes c d e |
  \rep 5 { <f='' a c>16 d'=''' } %
  <f,='' a c>16 d'~ \af 4\! <f,='' a c d>4\> \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  {{ template "lh1" (w `f=8->-\frBass`) }}
  \rep 5 { {{ template "lh1" (w `f,=8->`) }} | }
  c,=8-> bes'16( a bes8) c,-. | c-> a'16( g a8) c,-. |
  d=8-> d'16( c d8) bes-. | a-. g-. a4-- |
  <g= bes>8-> 8 c, <e bes'> | <f a>8-> 8 c <f a> |
  c=8-> <bes' c> c, <bes' c> | <a c> f <a= c>4 |

  g=8 <bes d> d, <a' c> | \rep 2 { e=8 <bes' c> c, <bes'= c> | }
  <a= c>8 f <a c> c, | <bes' d>-> g c,4 | d8-> e f4 |
  bes,=,8 <bes' d> c, <bes' c> | <a c> f <a c> r |
  g=8 <bes d> c, <g' bes> | f c d <fis c'> |
  bes,=,8 <g' bes> g, <g' bes> | a,=,2 |

  \rep 7 { R2 | } | f=,8-\stBass r r4 | R2 | bes8-> a g f |
  c'=4-> c-> | bes8-> a g f | c'-> c16( d c8)-> a=, |

  bes=,8 g@m! c8 c7! | f, fM! fis d@7! | g8 gm! c c7! |
  f,=,8 fM! c' f@M! | g8 gm! c c7! | f, fM! d' d7! |
  g,=,8 gm! g c@7! | f8 e d c | f=,4 d@m!4-\fermata |
}
{{ end }}
