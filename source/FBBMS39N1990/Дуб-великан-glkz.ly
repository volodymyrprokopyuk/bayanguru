{{ define "rh1a" }}
  {{ .a }} f8 g f4.) f8( | f g a bes d4 c='') |
{{ end }}

{{ define "rh1b" }}
  {{ .a }} | d g | g4 fis g='2 |
{{ end }}

{{ define "rh2" }}
  {{ .a }} <g bes d>8 <f a d>4. <g=' bes d>8 |
{{ end }}

{{ define "lh1a" }}
  f=4( f8 g g4 a) | a8( g a bes d4 c) | c c d='2 |
{{ end }}

{{ define "lh1b" }}
  bes,=,2 c | d ees | ees4 d4 g f= |
{{ end }}

{{ define "lh2" }}
  \rep 2 { {{ .a }} <g= d'>8 } |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Solenne
  \clef treble
  \key bes \major
  \time 4/4
  \meter 1/4 1,1,1,1
  f'='4\mf\< f8. f16 f4 \af 4\! f |
  \duo {
    {{ template "rh1a" (w `bes'='4(`) }}
    c=''4( c8 d bes4.) bes8( | c4\> bes8 a g4 \af 4\! f) |
    {{ template "rh1a" (w `bes='4(`) }}
    c=''4( ees8 d bes4.) bes8( | c4 f, bes='2) |
  } {
    {{ template "rh1b" (w `d'='2 ees`) }} | g ees |
    {{ template "rh1b" (w `d='2 ees`) }} | g4 ees d='2 |
  }

  {{ template "rh2" (w `<f=' a d>4.\mp`) }}
  \rep 2 { <f=' a d>4 <ees=' a> } |
  {{ template "rh2" (w `<f=' a d>4._\dCre`) }}
  <f=' a d>4\< \af 8.\! <ees a> \duo { c''=''2 | } { g'='4( a=') | }

  \duo {
    bes'='4(\f f8 g f4.) f8( | f\< g a \af 8\! bes d4 c='') |
  } { d'='2 ees | d g=' | }
  <g=' g'>4.\ff <g c>8 <f f'>4 <f bes> |
  <ees=' ees'>2^\tRit <ees g>4 <ees d'> |
  <d=' d'>2. r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key bes \major
  \meter 1/4 1,1,1,1
  f=4-\frBass f8. f16 f4 f |
  \duo {
    {{ template "lh1a" }} | c='4 bes8 a g4 a |
    {{ template "lh1a" }} | c='4 a bes=2 |
  } {
    {{ template "lh1b" }} | ees=2 c4 f |
    {{ template "lh1b" }} | ees=4 f bes,=,2 |
  }

  {{ template "lh2" (w `<d= a'>4.`) }} | \rep 2 { <d= a'>4 <a'= c> } |
  {{ template "lh2" (w `<d,= a'>4.`) }} | <d= a'>4 <a' c> <f= ees'>2 |

  \duo { f=4( f8 g g4 a) | a8( g a bes d4 c=') | } { bes,=,2 c | d ees= | }
  <ees= bes'>4. <ees c'>8 <d a'>4 <g bes> | <c, g'>2 <f bes>4 <f a> |
  <bes,=, f'>2. r4 |
}
{{ end }}
