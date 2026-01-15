{{ define "rh1" }}
  \acc { e=''8 } {{ .a }} d d16(-> c bes8)-. |
  c=''8(-> g)-. g4-- | g16(-> f ees'8)-. g,16(-> f {{ .b }} |
{{ end }}

{{ define "lh1" }}
  {{ .a }} besM! f bes@M | ees'8 c@m! ees8 c@m | f8 f7! {{ .b }} f@7 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key bes \major
  \time 2/4
  e''=''16(->\f f)-. cis(-> d)-. a(-> bes)-. e,(-> f)-. |
  g='16(-> f)-. g-. a-. bes-.\>^\tRit c-. d-. \af 16\! ees=''-. |

  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      {{ template "rh1" (w `f=''8->\mf^\tATem` `g'=''8)-.`) }}
      f=''16( ees d c) bes-. c-. d-. ees-. |
      {{ template "rh1" (w `f=''8->` `ees'=''8)-.`) }}
      \alternative {
        \volta 1 { g,='16(-> f d'8)-. bes16-. c-. d-. ees=''-. | }
        \volta 2 { g,='16(-> f d'8)-. bes='8-> r \fine | }
      }
    }

    \volta 2
    \repeat volta 2 {
      <bes=' d>4--\p bes16(-> a g8)-. | <ees g>4-- c16 d ees f |
      <d=' fis>4-- <fis a>8-. <a c>-. | <a c>8(-> <g bes>8)-. g16 a bes c |
      <bes=' d>4-- bes16(-> a g8)-. | <c ees>8 <bes d> <a c> <g bes> |
      \alternative {
        \volta 1 {
          <c='' ees>8 <bes d> <a c> <c ees> | <bes d>4 d16 c bes a=' |
        }
        \volta 2 {
          \rep 2 { <f=' a>8 <ees'='' f> } |
          r8 <ees='' f>16 16 bes c d ees='' \bar "||"
        }
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key bes \major
  r8 bes+besM![-\stBass r d+bes@M] | r8 c+f@7! r4 |

  {{ template "lh1" (w `bes,=,8` `ees=8`) }} | d=8 bes@M! c8 f@7! |
  {{ template "lh1" (w `bes=,8` `c=8`) }} | \rep 2 { f=8 f7! bes+besM! r | }

  g,=,8[ gm! gm] bes-. | a[ c@m! cm8] g-. | a[ d@7! d78] d-. |
  g,=,8 gm! d'8-. r | g,=,8[ gm! gm] bes-. | a[ c@m! cm8] c-. |
  a=,8 c@m! cm8 a | d[ d7! d7] r | f=[ f7! f7] r | f+f7! r8 r4 |
}
{{ end }}
