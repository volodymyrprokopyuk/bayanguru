{{ define "rh1" }}
  {{ .a }} fis b a16 g | fis8 e <d=' fis>4) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key g \major
  \time 2/4
  \repeat volta 2 {
    <e''='' g b>2~\pp | 2 | <d g b>4.( <e a>8 | fis <e a> <d fis b>4) |
    {{ template "rh1" (w `e,='8(`) }} {{ template "rh1" (w `g='8(`) }}
    c'=''8 b a <g e'> | \duo { d''=''8 e='' } { fis'='4 } <g b>4 |
    \alternative {
      \volta 1 {  }
      \volta 2 {  }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
}
{{ end }}
