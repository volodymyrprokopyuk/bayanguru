{{ define "rh1" }}
  {{ .a }} g8 aes | bes4 c | bes8 aes g='4) |
{{ end }}

{{ define "rh2" }}
  {{ .a }} <d fis c'> | <ees g bes>8 <c f aes> <bes=' ees g>4 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key ees \major
  \time 2/4
  {{ template "rh1" (w `ees'='4(\mp`) }}
  {{ template "rh1" (w `ees='4(`) }}
  aes='4( g | f ees | bes2) | bes'4.( aes8 | g4 bes) |
  aes='4( g | f ees | bes2) | bes'4( aes | ees='2) |

  <g=' bes ees>4\mf \duo { g''=''8( aes='') | } { <c''='' ees>4 | }
  {{ template "rh2" (w `<ees'='' g bes>4`) }}
  \duo { ees''=''8( f) g( aes='') | } { <g'=' bes>4 <bes=' ees> | }
  {{ template "rh2" (w `<ees='' g bes>4`) }}
  <c='' f aes>4 <bes ees g> | <aes c f> <g bes ees> |
  <aes=' bes>8 <g c> <f bes>4 |
  \duo { <g''='' bes>4. <f aes>8 | } { bes'='8( c bes='4) | }
  <bes=' ees g>4\< \af 4\! <ees g bes> |
  <aes,=' ees' aes>4\f <bes d g> | <f c' f> <g c ees> |
  \duo { <aes'=' bes>2 | <g'='' bes>4^\tRit <f='' aes> | }
  { d'='8( ees d4) | bes'='2 | } | <g=' bes ees>2 \bar "|."

}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key ees \major
  R2 | g=4(-\frBass aes8 bes | c d ees4) | c( bes8 aes) |
  g=4( aes8 bes | c d ees4) | f ees8( c | d4) c8( f, | g4) aes( |
  g=4 f | ees) d8( c | f4) ees8( c | d4) c | g'8( f g aes | g4) g8( f | ees=2) |

  \meter 1/2 #'(1)
  \rep 3 { ees'='8 bes c bes= | } \rep 2 { ees='8 d c bes= | }
  c='8 d ees4 | \rep 2 { ees,=8 bes' ees bes= | }
  \rep 2 { ees,=8 bes' d bes= | } | ees, bes' ees d |
  c='8 d c bes | aes g aes a | bes4 f | \duo { r4 <aes= d> | } { bes,=,2 | }
  <ees= bes'>2 |
}
{{ end }}
