{{ define "rightHand" }}
\relative {
  \tempo Lento
  \clef treble
  \key f \major
  \time 2/4
  \partial 8 { c'='8\(\p | }
  a'='8 a g a | f c c\) c\( | a' a bes g | c4.\) c=''8\( |
  \repeat volta 2 {
    d,='8 d bes' bes | a g f\) f\( | a a g a |
    \alternative {
      \volta 1 { f='4.\) f8 \sSlur nf #'() ( | }
      \volta 2 {
        \hSpace f='4.) \sSlur ub #'((wb . 2.5)) ( r8) \bar "|."
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  \partial 8 { r8 | }
  f=8-\stBass r c@M! r8 | f@M!8 r8 r4 |
  f=8 r c@M!( r8 | f@M!4.) r8 |
  bes,=,8 r g+gm! r | cis+a@M! r8 d+dm! r |
  c+f@M!8 r8 c+c7! r | f+fM!4 r | f+fM!4. r8 |
}
{{ end }}
