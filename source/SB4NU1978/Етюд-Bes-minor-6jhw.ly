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
      \hideTupletBracket
      {{ template "t2" (w `<f=' f'>8 8 8` `8 8 8`) }}
      {{ template "t2" (w `<f=' f'>8 <e e'> <f f'>`
         `<g g'> <a a'> <bes bes'>`) }}
      {{ template "t2" (w `<c='' c'>8 8 8` `8 8 8`) }}
      {{ template "t2" (w `<ees='' ees'>8 <des des'> <c c'>`
         `<c='' c'>8 <des des'> <bes bes'>`) }}
      {{ template "t2" (w `<c='' c'>8 8 8` `8 8 8`) }}
      {{ template "t2" (w `<c='' c'>8 <a a'> <bes bes'>`
         `<c='' c'>8 <des des'> <ees ees'>`) }}
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
      <des,='' f des'>4_\markup \dAlt f p <des f bes> |
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key bes \minor
}
{{ end }}
