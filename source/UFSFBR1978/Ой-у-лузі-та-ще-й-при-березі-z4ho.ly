{{ define "rh1" }}
  {{ .a }} <c f a c> \duo { c'''='''4 | } { <f''='' f'>8 <ees='' ees'> | }
  <d='' bes' d>8 <c a' c> <bes g' bes> <a fis' a> <g g'>4 %
  <d'='' bes' d>8 <c a' c>16 <bes=' g' bes> |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \minor
  \time 4/4
  d'='4\(\p g g8 a bes4 | f8 e f g d ees c4 |
  d='4 fis8 a g4 d8 e | f4 a d,4~ d='8\) r |

  \repeat volta 2 {
    <f=' bes d>4\(\mf 4 <f a c> <f c' ees> |
    <bes=' d>8 <a c> <g bes> <fis a> g4 <bes d>8 <a c>16 <g bes> |
    <f=' a>4 <a c> <g bes>8 8 <ees a> <ees g> |
    \alternative {
      \volta 1 { <d=' d'>2 8\) r r4 | }
      \volta 2 {
        \hSpace <d=' d'>2 \sSlur nb #'((ws . 6) (ww . 2.9)) ( 4) r4 |
      }
    }
  }

  R1\mf | R1 |
  \duo { d''=''1(~ | d4 e d)\< \af 4\! b=' \rest | }
  { d'='4( fis8 a g4 d8 e | f4 <e a> d=') s4 | }

  {{ template "rh1" (w `<d'='' f bes d>4\(\f 4`) }}
  <a=' f' a>4 <c f a c> <bes g' bes>8 8 <a ees' a> <g ees' g> |
  <d'='' d'>2\) <d d'>8--\< ees-- d-- \af 8\! c=''-- |

  {{ template "rh1" (w `<d='' f bes d>4\(\ff <f bes d f>`) }}
  <a=' f' a>4 <c a' c> <ees g ees'>8 8 <d g d'>^\tRit <c g' c> |
  <d='' d'>2 4\) r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  R1 | R1 | d=4(-\puBass c bes2 | a d8 ees d c) |
  \duo { r4 besM! } { bes,=,2 } f,=,4( a | bes8 c d4 g, gm!) |
  d'=4( f ees c | d2 d8 ees d c) |
  \hSpace d=2 \sSlur nb #'((wb . 1) (ws . 6) (ww . 2.9)) ( d=4) r |

  d,=,4\( g g8 a bes4 | f8 e f g d ees c4 | d c' bes2 | a d8 ees\) d-- c=-- |

  \duo { r4 besM! } { bes,=,2 } f,=,4( g8 a | bes c d4) \duo { r4 gm! } { g,=,2 | }
  d=4_( f \duo { r8 eesM! } { ees=4 } c | d2) d8-- ees-- d-- c=-- |

  \duo {
    r8 besM!16 besM besM4 r8 fM!16 fM r4 | s2 r4 gm! | r4 fM! r8 cm! s4 | s2. %
  } {
    bes,=,2 f4( g8 a | bes c d4 g,2) | f c'4( d8 ees | d2 d=4) %
  } r4 \bar "|."
}
{{ end }}
