{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \minor
  \time 2/4
  \repeat segno 2 {
    d''=''16->\p ees d8~ d16 ees d8~ | d16 ees d8~ d c'-> |
    c,=''16-> d c8~ c16 d c8~ | c16_\dCre d c8~ c bes'-> |
    \rep 2 { a,='16 bes a8~ a g'=''-> | }
    \time 3/4
    \duo { ees'='16\mf\> f ees8 d[ g]~ g \af 8\! fis \bar "||" }
    { c'='4 bes c=' | }
    \alternative {
      \volta 1 {
        \time 2/4
        <bes,,= g'>4 bes'='8\mp bes |
        \duo {
          bes'='8( a g fis | g g) bes bes | bes( a g fis | g g) d\mf d |
          ees='8( ees g g | d4) g8 g | ees( ees d fis |
          g='4~\> g16) a_( bes \af 16\! c='') \bar "||"
        } {
          ees'='4.( d8) | bes4 s4 | ees4.( d8) | bes4 s4 |
          r4 c='4( | bes)  d | r d8( c | bes4~ bes=) |
        }
      }
      \volta 2 { \section \sectionLabel "Coda" }
    }
  }

  \af 2\! <bes,= g'>2\> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \minor
  <a'=' c>4(-\frBass <g bes> | <f a> <ees g>) |
  <g=' bes>4( <f a> | <ees g> <d f>) | \rep 2 { <c=' ees>4( <bes= d>) | }
  \clef bass c,=4 d d= |

  <g,=, d'>4 r | \rep 2 { c=4( d | g,=,) r | }
  c=4( ees | g8 d bes4) | c( d) | g,8( d' g) r | <g,=, d'>2 %
}
{{ end }}
