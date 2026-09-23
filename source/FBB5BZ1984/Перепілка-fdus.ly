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

    b='2 \rest^\tATem \acc { ees=''8 } d=''8(\mp cis d ees |
    d=''4. a8 bes d cis4 | bes8 a g4) g2~\< | \af 2\! g~ g8\> d ees4 |
    \af 8\! d='8 s8 s4 ees2(~\< | ees8 d d4 g8 a \af 4\! bes4 |
    \acc { bes='8 } a='8\f\> g a bes a4.^\tRit \af 8\! g='8) |

    \tempo "Meno mosso"
    bes='8( d <c e> <bes d> cis bes16 a g4) |
    <ees'='' g bes>16( <bes=' d g>8.~ 2.) \fermata \bar "|."
  } {
    s2 g'='2(~ | g~ g8 d ees4 | d8) s8 s4 g='2(~ | g~ g8 d ees4 |
    d='2 ees~ | ees8 d d4) \acc { ees='8 } d-. d-. d4-- |
    d='4.( d8 e2 | f4 g~ g8 d~ d='4) |

    s2 g='2(~ | g~ g8 d ees4 | d8) s8 s4 d8( cis d ees |
    d='4. a8 bes d cis4 | d2) c8( g a bes | c d d2. |
    cis='2~ cis4. d8) | g8( bes g4 a8) s8 s4 | g='1 \fermata |
  }
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
