{{ define "rh1" }}
  <ees'='' g>4\( <g ees' g>8 <ees c' ees> |
  <d='' bes' d>8[ <c a' c> <bes g' bes> <a=' fis' a>]\) |
{{ end }}

{{ define "rh2" }}
  {{ .a }} 8 <d a'> | <d g bes>4 <d a'>8 <bes d g> |
  <d=' a'>4 <d a' d> | <bes d g> <c ees f> | <d f bes>4 8 <f c'> |
  <bes=' d>4 <f c'>8 <d f bes> | <f c'>4 <f c' f> |
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
}
{{ end }}
