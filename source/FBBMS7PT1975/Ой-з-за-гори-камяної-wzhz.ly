{{ define "rh1a" }}
  s2. | f'=''2.~ | f=''2 r4 | s2. |
{{ end }}

{{ define "rh1b" }}
  {{ .a }} f ees des c16 d e c | f4 ees des8 c) |
  ees=''8(_\dDim {{ .b }} ees des4 c8 bes | aes4 f=') {{ .c }} aes \rest |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key f \minor
  \time 3/4
  \meter 1/4 1,1,1
  \duo {
    f'='8(\mp aes c4 bes8 aes | c c bes4 aes8 g) |
    f='8(\< aes c4 bes8 \af 8\! aes | bes4\> \af 4\! aes) aes \rest |
    c=''8(\mf c bes4 c8 bes | f aes c4 bes8 aes) |
    c=''8( c bes4 c8 bes | f4\> \af 4\! f=') aes \rest |

    \once \override MultiMeasureRest.staff-position = #0 %
    R2.\mf | c=''8\< e g4 f8 e | f( c bes aes g f |
    g='8\> aes \af 4\! f4) aes \rest |
    \rep 2 { {{ template "rh1a" }} } \bar "|."
  } {
    s2. | c'='8( e g4 f8 e) | f2.~ | f2 s4 |
    aes='8 aes g4 aes8 g | f f aes4 g8 f | aes aes g4 aes8 g | f4 f=' s4 |

    s2. | c'=''2.~ | c8 c bes aes g f | e4 s2 |
    {{ template "rh1b" (w `c'=''8( \f` `` ``) }}
    {{ template "rh1b" (w `c=''8( \p` `^\tRit` `\pp`) }}
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \minor
  \meter 1/4 1,1,1
  R2. | R2. | des'='8(-\frBass c bes aes g f | des'4 c) r |
  aes=8( c ees4. ees8 | f ees16 des c4. c8) |
  <f,= c'>4( <bes des>4. 8 | c bes aes g f=4) |

  f=8( aes c4 bes8 aes | c4 bes aes8 g) | f( aes c4 bes8 aes | bes4 aes) r |
  \rep 2 {
    \duo { c'='4( bes c8 bes | aes aes c4 bes8 aes) | c4 bes c~ | c='2 } %
    { aes=4 g aes8 g | f aes c4 bes8 aes | c4( bes aes8 g | f4 f=) } r4 |
  }
}
{{ end }}
