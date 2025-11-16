{{ define "rh1" }}
  <ees'='' g>4\( <g ees' g>8 <ees c' ees> |
  <d='' bes' d>8[ <c a' c> <bes g' bes> <a=' fis' a>]\) |
{{ end }}

{{ define "rh2" }}
  {{ .a }} 8 <d a'> | <d g bes>4 <d a'>8 <bes d g> |
  <d=' a'>4 <d a' d> | <bes d g> <c ees f> | <d f bes>4 8 <f c'> |
  <f=' bes d>4 <f c'>8 <d f bes> | <f c'>4 <f c' f> |
  \duo { <f'=' d'>2 | } { bes'='4( b=') | }
  <g=' c ees>4 <g bes d>8 <g a c> | <g bes d>4 <g bes> |
  <g=' c>4 <fis bes>8 <fis a> | <g bes>4 g | <ees g>( <ees' g>8 <c ees> |
  <bes=' d>8[\> <a c > <g bes> \af 8\! <fis=' a>]) |

  \duo {
    g'='4->\p\< bes-> d-> \af 4\! g-> | <c ees>4\(\mf <bes d>8 <a c> |
    <bes='' d>4 <g bes> | <a c>4 <d, bes'>8 <c a'> | <d bes'>4 <d='' g>\) |
  } { g'='2~ | g | g'4 fis | f2 | ees4 fis | bes,='2 | }
  {{ template "rh1" }}
{{ end }}

{{ define "lh1" }}
  c=8-. bes-. a4(-> | d=8) r r4 | \rep 2 { g,=,8 gm! g=, gm | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Tempo di marcia"
  \clef treble
  \key g \minor
  \time 2/4
  <bes= d g>8\mf r r4 | R2 |
  {{ template "rh2" (w `<bes= d g>4`) }} | <g=' g'>2~ | 4~\> \af 8\! 8 r |

  g='16\mp d bes_\aLeg d g d a' d, | bes' g d bes' a d, g d |
  a'='16 d, fis a d c bes a | g d g bes a g f ees |
  bes'='16 f d f bes f c' f, | d' bes f d' c f, bes f |
  c'=''16 f, a c f ees d c | d bes a g a bes c d |
  ees=''16 c  g ees d' g, c a | d bes a g bes a g f |
  c'=''16 g ees c' bes d, a' d, | bes' a g f g f ees d |
  g='16 ees g c g' ees d c |
  <bes=' d>8[-.\> <a c>-. <g bes>-. \af 8\! <fis=' a>]-. |

  g='4(\p\< <fis a> | <g bes> \af 4\! <f g b>) |
  \duo { g''=''4\(\f a | bes2 | c4 bes8 a | bes4 g=''\) | }
  { ees''=''4 d8 c | d4 <bes g'> | <c ees g>4 <d=''_~ d'^~>4 | 2 | }
  {{ template "rh1" }}
  \duo { g''=''2~ | \af 2\! 2 | } { g'='4->\> d'-> | bes-> \af 4\! g='-> | }

  {{ template "rh2" (w `<bes,= d g>4\mf`) }} | <g=' g'>2 |
  <g'='' g'>2~\> | 2~ | 2~ | \af 8\! 8 r r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  g,=,8-\stBass gm! g gm | \rep 3 { g=,8 gm! g gm | }
  fis=,8 d@7! d'8 d7! | g, gm! a f@7! | \rep 2 { bes=,8 besM! bes besM | }
  a=,8 f@7! f8 f7! | bes besM! g gM! | c cm! c cm | g gm! f g@m! |
  ees'=8 c@m! d8 d7! | g, gm! g gm | {{ template "lh1" }}
  \rep 2 { c=8 cm! d d7! | g, gm! g=, gm | } | {{ template "lh1" }}

  g=,8 gm! g d@M! | g8 gm! bes g@m! | d8 d7! fis, d@7! | g8 gm! f f7! |
  bes=,8 besM! bes f@M! | bes8 besM! d bes@M! | f,8 f7! a f@7! |
  bes=,8 besM! bes besM | c cm! f, f7! | bes besM! ees eesM! |
  a,=,8 c@m! d8 d7! | g, gm! bes b | c cm! a c@m! | d=8 r r4 |

  g,=,8( gm!) d'( dM!) | g,( gm!) g( g7!) | c cm! f, f7! |
  bes=,8 besM! ees eesM! | a, c@m! d8 d7! | g, gm! bes g@m! |
  {{ template "lh1" }}

  g=,8(-> gm!16) gm16 gm8 d' | g,(-> gm!16) gm16 gm8 g |
  fis=,8[(-> d@7!16) d716] d78 fis | g gm! a f@7! |
  bes=,8(-> besM!16) besM16 besM8 f | bes(-> besM!16) besM16 besM8 bes |
  a=,8[(-> f@7!16) f716] f78 a | bes besM! g gM! | c(-> cm!16) cm16 cm8 cm8 |
  g=,8 gm! f g@m! | ees'8[(-> c@m!16) cm16] d8 d7! | g, gm! g gm |
  {{ template "lh1" }}

  \rep 2 { c=8 cm! d d7! | g, gm! g=, gm | } | {{ template "lh1" }}
  \rep 2 { g=,8 gm! g=, gm | } | g+gm! r r4 |
}
{{ end }}
