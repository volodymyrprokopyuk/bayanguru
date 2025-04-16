{{ define "lh1" }}
  f+fM!8 r a+f@7! r8 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key bes \major
  \time 2/4
  \repeat volta 2 {
    f'='16\(\mf d f g f d f d' | c bes a g f ees d c\) |
    ees='16\( c ees f ees c ees bes' | a g f ees d c d ees\) |
    f='16_\( d f g f d f f' | ees d c bes a g fis g\) |
    c=''16\( bes a g f ees d c |
    \alternative {
      \volta 1 { d='16 f c f bes, c d ees='\) | }
      \volta 2 {
        \hSpace d='16 \sSlur ub #'((wb . 4.5) (ws . 9) (ww . 4)) ( %
        f='16 c f bes,=8) r \bar "|."
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key bes \major
  bes,=,8.-\stBass besM!16 besM8 r | {{ template "lh1" }}
  c=8. cm!16 cm8 r | {{ template "lh1" }}
  bes=,8. besM!16 besM8 r | c+cm!8 r ees+c@m! r8 |
  {{ template "lh1" }} \rep 2 { bes+besM!8[ a+f@7!] bes+besM!8 r | }
}
{{ end }}
