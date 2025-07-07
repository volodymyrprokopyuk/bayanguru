{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 3/4
  \duo {
    b'='4\(\p g e | fis2 a4 | <e a>4\< b' \af 4\! c |
    <a=' b>2.\)^\tRit \fermata |
  } { \rep 3 { s2. | } e'='2 dis='4 \fermata | }
  b'='4\(^\tATem g e | fis dis b | <g' b> <a c> <g b> |
  <fis=' a>4 <e g> fis\) | b,( dis fis | <e c'>2 <g b>4) |
  <fis=' a>4( <e g> <dis fis> | <b= e>2.) |

  \repeat volta 2 {
    <g= b e>4\(\mf g'_\dCre <e g b> | <e c' e>2 <b' d>4 |
    <e,=' b' d>4 <c' e> <b d> | <a c> b a\) |
    b,=4\(\mp dis fis | <e c'>2 <g b>4 | <fis a>_\dDim <e g> <dis fis> |
    \alternative {
      \volta 1 { <g,= b e>2.\) \sSlur ub #'((wb . 5.5) (ws . 11.5)) ( | }
      \volta 2 { \hSpace <g= b e>2.) \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  <e= g b>2.-\frBass | <e fis a c>2.~ | 2. | <b=, a'> \fermata |
  e,=,4\( b' g' | e, b' fis' | e, b' g' | a, e' c'\) |
  b,=,4( fis' a | a, e' c') | b,( cis dis | <e g> b g=,) |

  <e=, e'>2\( <d d'>4 | c g' e' | e, fis gis | a b c\) |
  b=,4\( fis' a | a, e' c' | b, cis dis | e b g=,\) %
  \sSlur nf #'((ws . 4.5)) ( | <e=, e'>2.) \bar "|."
}
{{ end }}
