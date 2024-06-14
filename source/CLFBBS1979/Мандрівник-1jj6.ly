{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key g \minor
  \time 6/8
  <bes'=' d>8(\mp 8 <a cis>) <bes d>4. | <a cis>8( <bes d> <cis e>) <bes d>4. |
  <cis='' e>8( <bes d>8 8) <g bes>4( a8) | <g bes>16( a g8 g) d4. |
  \duo {
    g'='8( bes bes) c4( g8) | g( a g) d4. | g='8( a bes) c4( g8) | g4.~ g='8 %
  } { f'='4.( e) | ees( d) | f( e) | ees8( d c bes=) } r r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \minor
  g=8(-\frBass d' ees e ees d) | g,( d' e f e ees) |
  g,=8( d' e f e ees) | des( ees4) c8( bes a=) \clef bass |
  \duo { g=4 } { g=8[ d'='] } r8 \duo { g=4 } { g=8[ c='] } r8 |
  \duo { f=4 } { f=8[ c'='] } r8 bes=8( a g) |
  \duo { ees=4 } { ees=8[ des'='] } r8 \duo { c=4 } { c=8[ g'=] } r8 |
  c,=8( bes a g=,) r r |
}
{{ end }}
