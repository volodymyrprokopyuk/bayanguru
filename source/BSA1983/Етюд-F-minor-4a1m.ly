{{ define "t1" }}
  \tuplet 3/2 { {{ .a }} }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key f \minor
  \time 3/4
  \partial 4 { {{ template "t1" (w `c''=''8(\p aes f)`) }} | }
  f='4( e) {{ template "t1" (w `des'8( c bes)`) }} | bes='4( aes) %
  \duo {
    {{ template "t1" (w `f'='8(_\dCre aes c`) }} |
    \omit TupletNumber
    f=''4)~ {{ template "t1" (w `f8( <ees ges> <des f>`) }}
    {{ template "t1" (w `<c='' ees>8 <bes des> <c ees>`) }} |
    <des='' f>2.) |
  } {
    \omit TupletNumber
    \omit TupletBracket
    s4 | {{ template "t1" (w `r8 f'='( g`) }}
    {{ template "t1" (w `a='8) r r`) }} r4 |
    {{ template "t1" (w `r8 c=''8( bes`) }}
    {{ template "t1" (w `a='8 aes g)`) }}
    {{ template "t1" (w `<des'='' f>8( g aes='')`) }} |
  }
  \omit TupletNumber
  <bes=' des aes'>4 <bes des g> {{ template "t1" (w `bes'=''8( c des)`) }} |
  \undo \omit TupletNumber
  <ees,='' c'>4 {{ template "t1" (w `<c aes'>4 g'8(_\dDim`) }}
  \omit TupletNumber
  {{ template "t1" (w `f=''8 des bes)`) }} |
  {{ template "t1" (w `g='8( aes bes`) }}
  {{ template "t1" (w `c=''8 aes f`) }}
  {{ template "t1" (w `c='8 aes' g)`) }} |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \minor
  \time 3/4
  \meter 1/4 1,1,1
  \partial 4 { aes,=,8---\stBass f@m!-. | }
  g=,8-- c@7!-. c78-. c7-. e-- c@7-. | f8-- am!-. am-. am-. aes-- f@m-. |
  a=,8_\aSim f@7! f78 f7 f7 f7 |
}
{{ end }}
