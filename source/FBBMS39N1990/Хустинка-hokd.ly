{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \minor
  \time 2/4
  g'='8(\mp\< fis g a | bes4 \af 4\! a) | g8( bes a g | \af 2\! d='2)\> |
  \duo { g'='8( fis g a | bes4 a) | g8( bes a g | \af 2\! d='2)\< | }
  { d'='4 ees | e2 | ees | d=' | }

  \repeat volta 2 {
    \duo {
      d''=''8(\mf d d c | bes4 a) | d8( d d c | bes4 a) |
      g='8( fis g a | <f bes>4 <e=' a>) |
    } {
      f'='4 fis | g fis | f fis | g16 f e ees d des c8 |
      <bes= d>4 c | bes=2 |
    }
    <d=' f d'>8(\> <c ees g c> <bes e g bes> \af 8\! <c d fis a> |
    \alternative {
      \volta 1 { \af 2\! <bes= d g>2)\< | }
      \volta 2 { \hSpace <bes= d g>2 \sSlur ub #'((wb . 4.5)) ( | }
    }
  }

  <bes= d g>2)\f | <bes cis e g> | <bes c ees g> |
  \duo {
    <a= c fis>2 | g'='8(\p\< fis g \af 8\! a | bes4 a) | g8( bes a g |
    \af 2\! <c,=' d>2)\< |
  } { ees'='4 d | <bes d>2 | <bes cis> | <bes c> | a4 g8 fis= | }

  \repeat volta 2 {
    \duo {
      d''=''8(\f d d c | bes bes a4) | d8( d d c | bes bes a4) |
      g='8(\mf fis g^\tRit a | bes4 a) \barFermata |
      d=''8(^\tATem c bes a=') |
    } {
      <c'='~ f>4 <c aes'> | <cis g'> <d fis> | <d g> <d fis> |
      <d=' g>8 <des f> <c f>4 | cis2 | <cis g'> | <d fis>4 <c d='> |
    }
    \alternative {
      \volta 1 { \af 2\! <bes= d g>2\< | }
      \volta 2 { <bes= d g>2 \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  \rep 3{ R2 | } | r4 c'='4-\frBass | bes c | cis2 | d4 cis | d8 ees d c=' |

  bes=2 | d8 d d c | bes a aes4 | g f | e ees | d8 des c4 |
  bes=,8 c cis d | g fis g a | g4 d= |

  g,=,8( fis g a | bes4 a) | g8( bes a g | d2) | g4 f | e2 | ees |
  d=,8 f bes a | aes g f4 | ees d8 c | bes bes' a aes | g4 f |
  e=,2 | ees | d8 ees e fis | g a bes a | g d g,=,,4 |
}
{{ end }}
