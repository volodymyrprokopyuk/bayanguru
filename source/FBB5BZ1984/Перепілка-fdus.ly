{{ define "rh1a" }}
  {{ .a }} cis d ees d4. a8 | bes d \af 4\! cis4 bes8\> a \af 4\! g='4)^\tTen |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key g \minor
  \time 4/4
  \duo {
    {{ template "rh1a" (w `d''=''8(\p\<`) }}
    {{ template "rh1a" (w `d'=''8(\<`) }}
    bes='8(\< a <g bes>8 8 \acc { bes='8 } a4. \af 8\! g8 |
    a='8\> bes d4) \acc { c=''8 } bes8-. a-. g4-- |
    bes='8(\< a bes <bes d> a4. \af 8\! g8 |
    bes='8\> d cis d bes^\tRit a \af 4\! g='4) |

    r2^\tATem \acc { ees'=''8 } d=''8(\mp cis d ees |
    d=''4. a8 bes d cis4 | bes8 a g4) g2~\< | \af 2\! g~ g8\> d ees4 |
    \af 8\! d='8 r r4 ees2(~\< | ees8 d d4 g8 a \af 4\! bes4 |
    \acc { bes='8 } a='8\f\> g a bes a4.^\tRit \af 8\! g='8) |

    \tempo "Meno mosso"
    bes='8( d <c e> <bes d> cis bes16 a g4) |
    <ees'='' g bes>16( <bes=' d g>8.~ 2.) \fermata \bar "|."
  } {  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  r2 d'='8(-\frBass cis d ees | d4. a8 bes d cis4 |
  bes=8 a g4) %
}
{{ end }}
