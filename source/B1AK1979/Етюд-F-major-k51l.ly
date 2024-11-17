{{ define "rh1" }}
  bes='8 c g c | a c f, c' | bes c g c='' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} r fM! r | \rep 2 { c'=8 r c7! r | } |
{{ end }}

{{ define "lh2" }}
  g=,8 r c@7! r8 | f r fM! r | g4 e=, |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key f \major
  \time 2/4
  \meter 1/2 #'(1)
  \partial 8 { f''=''8\f | }
  \repeat volta 2 {
    c=''8 a f c' | bes g e c' | bes g e d' | c[ a f] f'\p |
    c=''8 a f c' | bes g e d' | c bes g e | f=' r r %
  }

  \partial 8 { c'=''8\f | }
  \repeat volta 2 {
    {{ template "rh1" }} | a='8[ c f,] c'\p |
    {{ template "rh1" }} | f,='8 r r %
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  \partial 8 { r8 | }
  {{ template "lh1" (w `f,=,8-\stBass`) }} | f,=,8 r fM! r |
  {{ template "lh1" (w `f=,8`) }} | f+fM! r r %

  \partial 8 { r8 | }
  {{ template "lh2"  }} | f=,8 r fM! r |
  {{ template "lh2"  }} | f+fM!8 r r %
}
{{ end }}
