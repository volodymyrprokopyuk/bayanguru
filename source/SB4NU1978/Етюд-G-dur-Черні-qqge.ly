{{ define "t1" }}
  \tuplet 3/2 { {{ .a }} } \tuplet 3/2 { {{ .b }} } %
  \tuplet 3/2 { {{ .c }} } \tuplet 3/2 { {{ .d }} } |
{{ end }}

{{ define "t2" }}
  \tuplet 3/2 { {{ .a }} } \tuplet 3/2 { {{ .b }} } {{ .c }} r8 r4 |
{{ end }}

{{ define "rh1" }}
  {{ template "t1" (w .a `8\< <a c> <b d>`
     `<c='' e>8 <d fis> <e g>8` `8 <d fis> \af 8\! <c e>)`) }}
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 4/4
  \repeat volta 2 {
    {{ template "rh1" (w `<b'=' d>8(\p <a c> <g b>8`) }}
    {{ template "t1" (w `<b=' d>8(\> <a c> \af 8\! <g b>8` `8\< <a c> <b d>`
       `<c='' e>8 <d fis> <e g>8` `8 <d fis> \af 8\! <c e>`) }}
    \omit TupletNumber
    {{ template "t1" (w `<b=' d>8) <g b>( <a c>` `<b d>\> <c e> <b d>`
       `<a=' c>8 <b d> <a c>` `<g b> <a c> <g b>`) }}
    {{ template "t1" (w `<fis=' a>8 <eis gis> <fis a>`
       `<g=' b>8 <fis a> \af 8\! <eis gis>` `<fis a>)\< <d fis>( <e g>`
       `<fis=' a>8 <g b> \af 8\! <a c>`) }}
    {{ template "rh1" (w `<b=' d>8\p <a c> <g b>8`) }}
    {{ template "t1" (w `<b=' d>8(\> <a c> \af 8\! <g b>8` `8\< <a c> <b d>`
       `<e='' g>8 <fis a> <g b>8` `8 <fis a> \af 8\! <e g>`) }}
    {{ template "t1" (w `<d='' fis>8)\f \ottava #1 <fis'=''' a>( <e g>`
       `<d=''' fis>8 <cis e> <b d>` `<a cis> <g b> <fis='' a> \ottava #0`
       `<e='' g>8 <d fis> <cis e>`) }}
    {{ template "t2" (w `d=''8)-.\> a'-. fis-.` `d-. a-. fis-.`
       ` \af 8\! d='8-.`) }}
  }

  \repeat volta 2 {
    {{ template "t1" (w `<a''='' c>8(\f <b d> <a c>` `<g b> <a c> <g b>`
       `<fis='' a>8_\dDim <g b> <fis a>` `<e g> <fis a> <e g>`) }}
    {{ template "t1" (w `<d='' fis>8 <e g> <d fis>` `<c e> <d fis> <c e>`
       `<b=' d>8 <c e> <b d>` `<a c> <b d> <a c>)`) }}
    {{ template "t1" (w `<g=' b>8(\< d <ais' cis>` `<b d> g <g' b>`
       `<fis='' a>8 <e g> <d fis>` `<c e> <b d> \af 8\! <a c>`) }}
    {{ template "t1" (w `<g=' b>8\> d <fis ais>` `<g b> d \af 8\! <a' c>`
       `<eis=' gis>8\p\< <fis a> <g bes>` `<gis b> <a c> \af 8\! <ais cis>)`) }}
    {{ template "t1" (w `<b=' d>8(\> <a c> \af 8\! <g b>8` `8\< <a c> <b d>`
       `<c='' e>8 <d fis> <e g>8` `8 <d fis> \af 8\! <c e>`) }}
    {{ template "t1" (w `<b=' d>8) <b' d>( <ais cis>` `<b d> <ais cis> <b d>`
       `e,=''8) <a c>( <gis b>` `<a c> <gis b> <a c>`) }}
    {{ template "t1" (w `d,=''8)\f <g b>(\< <fis ais>` `<g b> <fis ais> <g b>`
       `<fis='' a>8)-. <g b>-. <a c>-.` `<b d>-. <c e>-. \af 8\! <a fis'>-.`) }}
    {{ template "t2" (w `<b='' g'>8-.\sf d-. b-.` `g-. d-. b-.` `g='8-.`) }}
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g,=,8[-\stBass r gM!] r c[ r cM!] r | g[ r gM!] r c[ r cM!] r |
  g=,8[ r gM!] r d@M![ r8 g@M!] r8 | d'[ r dM!] r dM r r4 |
  g,=,8[ r gM!] r c[ r cM!] r | g[ r gM!] r e'[ r em!] r |
  a,=,8 r d@M!4 r4 a+a7! | d+dM!8-. r d-. r d=-. r r4 |

  d=1 | d2. fis,4 | g8[ r gM!] r c[ r a@m!] r8 | d2. r4 |
  g,=,8[ r gM!] r c[ r cM!] r | g[ r gM!] r c[ r a@m!] r8 |
  d=8[ r g@M!] r8 d[ r d7!] r | g@M!-. r8 g,-. r g=,-. r r4 |
}
{{ end }}
