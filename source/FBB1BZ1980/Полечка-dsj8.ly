{{ define "rh1" }}
  f='8) r r d'( | bes) r r bes( | a g f e=' |
{{ end }}

{{ define "lh1" }}
  r8 {{ .a }} d) r | r bes'( g) e( | a, bes b cis=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \minor
  \time 2/4
  \repeat volta 2 {
    \partial 8 { a'='8(\mf | }
    {{ template "rh1" }} g='16\mf f e f d8) a'( |
    {{ template "rh1" }} | d) a'-> d=''-> %
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key d \minor
  \partial 8 { r8 | }
  {{ template "lh1" (w `f'='8(-\frBass`) }} d e f) r |
  {{ template "lh1" (w `f='8(`) }} d) a=-> \clef bass d,=-> %
}
{{ end }}
