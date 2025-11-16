{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \minor
  \time 3/4
  <bes= d g>8\pp g' \rep 2 { <bes=' d g>8 g=' } |
  <bes,= ees g>8 g' \rep 2 { <bes=' ees g>8 g=' } |
  <c,=' d fis>8\< <c d g> \af 2\! \rep 2 { <c=' fis a>8 bes'=' } |
  <c,=' d bes'>4~->\>^\tRit \af 8\! 8 r r4 |

  \repeat segno 2 {
    \repeat volta 2 {
      bes=4(\mp^\tATem d8 g) a-. bes-. |
      \duo { \rep 2 { c'='4( bes' a=') | } | bes,( a' g=') | }
      { c'='2. | c | bes= | } | bes,=8(\< d g a) bes-. \af 8\! d-. |
      \duo { ees'='4( d' c) | ees,( d'8 c) bes a=' | }
      { ees'='2. | ees='2 r4 | } | g,='8( a) g-. f-. g-. a-. |
      \duo {
        r8 <d''='' f>8-. 8-. 8-. 8-. 8-. |
        r8 <c='' ees>8-. 8-. <d f>-. <c ees>4-- |
        r8 <d='' f>8-. 8-. <c ees>8-. 8-. 8-. |
        r8 <bes=' d>8-. 8-. <a c>-. <bes d>4-- |
      } { bes'='4.( a) | g2. | a4. ( g) | f='2. | }
      ees='4.(\mp\< <c' ees>8) <bes d>-. <a c>-. |
      d,='4.( <bes' d>8) <a c>-. \af 8\! <g bes>-. |
      c,='8( ees <c ees bes'>4) <c ees a> \bar "||"
    }
    \alternative {
      \volta 1 {
        \alternative {
          \volta 1 {
            \duo { \af 2\! d'='2\> } { d'='4 c^\tRit bes8 a= | }
          }
          \volta 2 { <c=' ees g>4 <c ees a> <ees=' f c'> | }
        }

        \repeat volta 2 {
          bes'='8\mf f g f ees d | ees g c d ees d |
          c=''8 g a g f ees | f g a bes c d |
          \alternative {
            \volta 1 {  }
            \volta 2 {  }
          }
        }
      }
      \volta 2 { \section \sectionLabel "Coda"  }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
}
{{ end }}
