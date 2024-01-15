{{ define "rh1" }}
  {{ .a }} c4 | f2 a,4 | c2 bes8 a | bes='2.\) |
{{ end }}

{{ define "rh2" }}
  g'=''2\( f4 | e2 d4 | c d e='' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} fM! fM | f fM fM | c c7! c7 | c c7 c7 |
  c=4 c7! c7 | c c7 c7 | c c7! c7 | f= fM! fM |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 3/4
  \repeat volta 2 {
    {{ template "rh1" (w `c''=''2\(\mp`) }}
    {{ template "rh2" }} | f a, bes\) |
    {{ template "rh1" (w `c=''2\(`) }}
    {{ template "rh2" }}
    \alternative {
      \volta 1 { f=''2.\) | }
      \volta 2 { \hSpace f=''4 \sSlur bu #'((bs . 3)) ( r) r \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  {{ template "lh1" (w `f=4-\stBass`) }}
  {{ template "lh1" (w `f=4`) }} | f+fM! r r |
}
{{ end }}
