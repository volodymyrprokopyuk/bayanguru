{{ define "rightHand" }}
\relative {
  \tempo "Larghetto cantabile"
  \clef treble
  \key g \minor
  \time 4/4
  \meter 1/4 1,1,1,1
  g'='8(\p bes <bes d>4. <a c>8 <g bes>4) |
  g='8(\< bes \af 4\! <bes d>4. <a c>8\> \af 4\! <g bes>4) |
  \duo {
    \rep 2 { <fis'=' a>8 8 a( c bes a g='4) | }
    \rep 2 { g='8( bes~ <bes d>4. <a c>8 bes='4) | }
    \rep 2 { <fis=' a>8 8 a( c bes a g='4) | }
  } {
    \rep 2 { s4 fis'='2 g='4 | }
    g='4~\mf g2. | g4~ g fis <f g> |
    \rep 2 { s4 fis='2 g='4 | }
  }

  bes='8(\f d <d f>4. <c ees>8 <bes d>4) |
  \duo {
    bes'='8( d <d f>4. <c ees>8 d4) | <a c>8 8 c( ees d c bes4) |
    <a=' c>8^\tRit 8 c(\> ees d c \af 4\! d=''4) \fermata |
  } { s4 bes'='2. | s4 a2. | s4 a='2. | }
  g='8(\p^\tATem bes <bes d>4. <a c>8 <g bes>4) |
  \duo {
    g'='8( bes <bes d>4. \duo { c''=''16 d='' } { a'='8 } g'=''4) \fermata \bar "|."
  } { g'='4 f fis <g=' bes> | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \minor
  \meter 1/4 1,1,1,1
  \duo {
    bes'='4 \rest d,='4( ees d) | bes' \rest f( ees d) |
    \rep 2 { bes'='4 \rest <c,=' ees>4 bes' \rest <bes, d='> | }
  } { g=1-\frBass | g | g2 g | g g= | }
  g'='4( f ees d) | <c ees>( <bes d> <c ees> <des f>) |
  \duo {
    bes'='4 \rest <c,=' ees>4 bes' \rest <des, f> |
    bes'='4 \rest <c,=' ees>4 bes' \rest d,=' |
  } { bes=2 bes | bes bes= | }

  r4 bes=8( d f4 bes8 a) | r4 a8( aes g ges f e) |
  bes=8( ees g4 f g) | bes,8( ees g4 f8 ees d4) \fermata |
  g='4 <f a> <ees g> <d f> | <c ees> <bes d> <c ees> <g= d'> \fermata |
}
{{ end }}
