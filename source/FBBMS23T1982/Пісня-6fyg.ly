{{ define "rh1" }}
  {{ .a }} d c8 bes | a4 c bes8 a) | g4( bes a8 g=' |
{{ end }}

{{ define "rh2" }}
  {{ .a }} fis a4. fis8 | d4 fis a | g\< g8 a bes c | d4 g \af 4\! f\) |
  ees=''4\( f8 ees d c | bes4 a g | a8\> fis d4. fis8 | g2 \af 4\! g='4\) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Moderato cantabile"
  \clef treble
  \key g \minor
  \time 3/4
  bes'='4(\mf d c8 bes | a4 c bes8 a) | g4( bes a8 g | fis4 d2) |
  <g=' d'>2. | <fis c' d> | <e bes' d> | <a d> |
  {{ template "rh2" (w `d,='8\(`) }}

  {{ template "rh1" (w `bes='4(--\f`) }} | fis='4 d2) |
  {{ template "rh1" (w `bes'='4(--`) }} | <fis=' d'>2.) |
  {{ template "rh2" (w `d='8\(\p`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  <g= d'>2.-\frBass | <c ees> | <cis e> | <d, a'> |
  bes'=4( d c8 bes | a4 c bes8 a) | g4( bes a8 g | fis4 d2) |
  <d= c'>2.~ | 2. | bes'\( | b2 g4 | c2. | d | <d, c'>( | <g_~ c>2) <g bes>4\) |

  R2. | R2. | bes=4(-- d c8 bes | a4 c bes8 a) | g4( bes a8 g | fis4 d2) |
  bes'=4(-- d c8 bes | a4 d,2) | <d c'>2.~ | 2. | bes'2.\( | b2 g4 |
  c='2. | d | <d, c'~>2. | <g_~ c>2 <g= bes>4\) |
}
{{ end }}
