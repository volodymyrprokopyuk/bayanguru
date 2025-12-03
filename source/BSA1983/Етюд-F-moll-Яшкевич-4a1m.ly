{{ define "t1" }}
  \tuplet 3/2 { {{ .a }}}
{{ end }}

{{ define "rh1" }}
  \omit TupletNumber
  <bes=' des aes'>4 <bes des g> {{ template "t1" (w `bes'=''8( c des)`) }} |
  \undo \omit TupletNumber
  <ees,='' c'>4 {{ template "t1" (w `<c='' aes'>4 g'8(_\dDim`) }}
  \omit TupletNumber
  {{ template "t1" (w `f=''8 des bes)`) }} |
  {{ template "t1" (w `g='8( aes bes`) }}
  {{ template "t1" (w `c=''8 aes f='`) }}
{{ end }}

{{ define "lh1" }}
  {{ .a }} f@7! f78 f7 f7 f7 | bes besm! besm besm besm besm |
  ees=8 ees7! ees7 ees7 ees7 ees7 | aes,=, aesM! aesM aesM des+bes@m! r8 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key f \minor
  \time 3/4
  \partial 4 { {{ template "t1" (w `c''=''8(\p aes f)`) }} | }
  f='4( e) {{ template "t1" (w `des'=''8( c bes)`) }} | bes='4( aes) %
  \duo {
    {{ template "t1" (w `f'='8(_\dCre aes c`) }} |
    \omit TupletNumber
    f=''4)~ {{ template "t1" (w `f=''8( <ees ges> <des f>`) }}
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
  {{ template "rh1" }} {{ template "t1" (w `c='8 aes' g=')`) }} |

  \duo {
    \omit TupletNumber
    \omit TupletBracket
    f'='2 r4 | {{ template "t1" (w `r8\mf r f'=''8(`) }}
    \undo \omit TupletNumber
    \undo \omit TupletBracket
    {{ template "t1" (w `ees=''8 des4~`) }} des4 | c2) r4 |
    \omit TupletNumber
    \omit TupletBracket
    {{ template "t1" (w `r8 r ges'=''(`) }}
    \undo \omit TupletNumber
    \undo \omit TupletBracket
    {{ template "t1" (w `f=''8 ees4~`) }} ees4 | des=''2) s4 |
  } {
    \omit TupletNumber
    \omit TupletBracket
    {{ template "t1" (w `r8 ees'='8( des`) }}
    {{ template "t1" (w `c='8 bes aes)`) }}
    \acc { \once \stemUp g'='8 } {{ template "t1" (w `f='8( ees d`) }}
    \undo \omit TupletNumber
    \undo \omit TupletBracket
    ees='4)~ {{ template "t1" (w `ees='4 f8(`) }}
    \omit TupletNumber
    \omit TupletBracket
    {{ template "t1" (w `g='8 aes bes)`) }} |
    {{ template "t1" (w `aes='8( ees c`) }}
    {{ template "t1" (w `aes=8 c ees)`) }}
    \acc { \once \stemUp aes='8 } {{ template "t1" (w `ges='8( f e`) }} |
    \undo \omit TupletNumber
    \undo \omit TupletBracket
    f='4)~ {{ template "t1" (w `f='4 g8(`) }}
    \omit TupletNumber
    \omit TupletBracket
    {{ template "t1" (w `a='8 bes c)`) }} |
    {{ template "t1" (w `r8 c=''8( bes`) }}
    {{ template "t1" (w `a='8 aes g)`) }}
    {{ template "t1" (w `<des'='' f>8( g aes='')`) }} |
  }
  {{ template "rh1" }} {{ template "t1" (w `c='8 d e`) }} |
  {{ template "t1" (w `f='8 des bes`) }} aes4)-- g-- | f=2. \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \minor
  \meter 1/4 1,1,1
  \partial 4 { aes,=,8---\stBass f@m!-. | }
  g=,8-- c@7!-. c78-. c7-. e-- c@7-. | f8-- fm!-. fm-. fm-. aes-- f@m-. |
  {{ template "lh1" (w `a=,8_\aSim`) }} | r4 c+f@m!8 r8 c+c7! r | f+fm! r r4 r |

  g=,8 ees@7! ees78 ees7 ees7 ees7 | aes aesM! aesM aesM aesM aesM |
  {{ template "lh1" (w `a=,8`) }} | r4 c+f@m!8 r8 r4 |
  bes=,4-- b-- c-- | \duo { r4 fm!8 fm fm4 | } { f,=,2. | }
}
{{ end }}
