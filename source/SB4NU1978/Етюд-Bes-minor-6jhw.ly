{{ define "t2" }}
  \tuplet 3/2 { {{ .a }} } \tuplet 3/2 { {{ .b }} } |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro moderato"
  \clef treble
  \key bes \minor
  \time 2/4
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      {{ template "t2" (w `<bes'=' bes'>8\mf 8 8` `8 8 8`) }}
      {{ template "t2" (w `<des='' des'>8 <c c'> <bes bes'>`
         `<a a'> <bes bes'> <ges ges'>`) }}
      \omit TupletNumber
      {{ template "t2" (w `<f=' f'>8 8 8` `8 8 8`) }}
      {{ template "t2" (w `<f=' f'>8 <e e'> <f f'>`
         `<g g'> <a a'> <bes bes'>`) }}
      {{ template "t2" (w `<c='' c'>8 8 8` `8 8 8`) }}
      {{ template "t2" (w `<ees='' ees'>8 <des des'> <c c'>`
         `<c='' c'>8 <des des'> <bes bes'>`) }}
      {{ template "t2" (w `<c='' c'>8 8 8` `8 8 8`) }}
      {{ template "t2" (w `<c='' c'>8 <a a'> <bes bes'>`
         `<c='' c'>8 <des des'> <ees='' ees'>`) }}
      \ottava #1
      {{ template "t2" (w `<f='' f'>8 8 8` `8 8 8`) }}
      {{ template "t2" (w `<bes='' bes'>8 <aes aes'> <ges ges'>`
         `<f='' f'>8 <ges ges'> <d d'>`) }}
      {{ template "t2" (w `<ees='' ees'>8 8 8 ` `8 8 8`) }}
      {{ template "t2" (w `<aes='' aes'>8 <ges ges'> <f f'>`
         `<ees='' ees'>8 <ges ges'> <c,='' c'>`) }}
      \ottava #0
      {{ template "t2" (w `<des='' des'>8 8 8` `<f f'> <bes, bes'>8 8`) }}
      {{ template "t2" (w `<c='' c'>8 8 8` `<f f'> <a, a'>8 8`) }}
      {{ template "t2" (w `<bes=' bes'>8 <c c'> <des des'>`
         `<ees='' ees'>8\> <e e'> <f f'>`) }}
      \af 4\! <bes='' bes'>4 r \fine |
    }

    \volta 2
    \repeat volta 2 {
      \undo \omit TupletNumber
      <des,='' f des'>4_\markup \dAlt f p <des f bes> |
      <des='' f aes>4~ 8 r | <c ges' aes>4 <c ges' bes> |
      <c='' ges' c>4~ 8 r | <c ees ges c>4 <c ees ges bes> |
      <c='' f aes>4~ 8 r | <des f bes>4 <des fes g> |
      <des='' f aes>4~_\dCre 8 r | <des f des'>4 <ces des f> |
      <ces='' des f>4~ 8 r | <bes des bes'>4 <bes des ees> |
      <beses=' c ees>4~ \tuplet 3/2 { 8 <bes des e>4 } |
      <aes=' des f>4 <f aes des> | <ges aes c> <ges beses ees> |
      <f=' aes des>4 \tuplet 3/2 { <fes=' bes des>4 <ees ges c>8 } |
      <des=' f des'>4~\> 8 \af 8\! r |
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key bes \minor
  bes,=,4-\stBass besm! | bes ees@m! | bes4 besm! | des bes@m! |
  f,=,4 f7! | f bes@m! | a4 f@7! | f4 f7! |
  bes=,4 besm! | d+bes@7! bes+bes7!4 | ees eesm! | ees+eesm! ges+ees@m! |
  f,=,4 bes@m! | f4 f7! | bes+besm! f+f7! | bes+besm! r |

  {{ template "t2" (w `des'=8 8 8` `8 8 8`) }}
  {{ template "t2" (w `des=8 c bes` `aes ges f`) }}
  \omit TupletNumber
  {{ template "t2" (w `ees=,8 8 8` `8 8 8`) }}
  {{ template "t2" (w `ees=,8 d ees` `ges f ges`) }}
  {{ template "t2" (w `aes=,8 8 8` `8 8 8`) }}
  {{ template "t2" (w `aes=,8 bes aes` `ges f ees`) }}
  {{ template "t2" (w `des=,8 8 8` `8 8 8`) }}
  {{ template "t2" (w `des=,8 f ges` `aes bes c`) }}
  {{ template "t2" (w `des=8 8 8` `8 8 8`) }}
  {{ template "t2" (w `des=8 ees des` `ces bes aes`) }}
  {{ template "t2" (w `ges=,8 8 8` `8 8 8`) }}
  {{ template "t2" (w `ges=,8 f ees` `f ges g`) }}
  {{ template "t2" (w `aes=,8 g aes` `des aes f`) }}
  {{ template "t2" (w `ees=,8 d ees` `ges ees c`) }}
  {{ template "t2" (w `des=,8 ees f` `ges g aes`) }}
  \tuplet 3/2 { des=8 aes f } des=, r |
}
{{ end }}
