{{ define "rh1" }}
    {{ .a }} r16 c]( d8[)-. r16 f]( e8[)-. r16 d']( c8[)-. r16 bes]( |
    a='4)-. f='-. %
{{ end }}

{{ define "lh1" }}
  {{ .a }} gm! c@M! cM4 | f@M! fM4 %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Vivo leggiero"
  \clef treble
  \key d \minor
  \time 4/4
  \repeat volta 2 {
    a=8[-.\p r16 a]( b8[)-. r16 cis]( d8[)-. r16 e]( f8[)-. r16 bes]( |
    a='4)-. f-. a-. r | a-. f-. d-. g( \codaMark 1 \bar "||"
    \alternative {
      \volta 1 {
        f='8[)-. r16 e]( d8[)-. r16 f] %
        \duo { e'='2 \codaMark 2 | } { d'='4 cis=' | }
      }
      \volta 2 {
        \hSpace
        f='8[-. \sSlur ub #'((wb . 3)) ( r16) d]( e8[)-. r16 cis] d='2 \fine \bar "||"
      }
    }
  }

  {{ template "rh1" (w `bes=8[-.\mf`) }} a( e) |
  {{ template "rh1" (w `bes=8[-.`) }} a='2 %
  \segnoRep \markup { D.C. al \coda }
  \markup { e poi \concat { \coda \coda } al Fine } \bar "||"
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  d=4-\stBass dm!_\aSta dm \rep 2 { a=,4( | d)-. dm! dm } bes( |
  a=,4)-. e@M! a2 | a4-. \sSlur ub #'((wb . 3)) ( aM!) d= dm! |

  {{ template "lh1" (w `g,=,4`) }} a@m! am4 |
  {{ template "lh1" (w `g=,4`) }} a@M! a=,4 |
}
{{ end }}
