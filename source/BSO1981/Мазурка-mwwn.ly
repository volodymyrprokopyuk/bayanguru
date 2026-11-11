{{ define "rh1" }}
  \duo { {{ .a }} d'2) | eis,4( cis'=''2) | } { fis'='2. | e='2. | }
{{ end }}

{{ define "rh2" }}
  b='4( a4. g8 | fis4. g8 a4) | b( a4. g='8 |
{{ end }}

{{ define "lh1" }}
  {{ .a }} fis,4) | cis'2( fis,=4) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key b \minor
  \time 3/4
  \repeat segno 2 {
    \volta 1
    {{ template "rh1" (w `fis'='4(\mf`) }}
    fis'='8.( ais16 cis4. d8 | cis4 b fis') |
    {{ template "rh1" (w `fis'='4(`) }}
    fis,='8.( ais16 cis4. d8 | b='2.) \fine \bar "||"

    \volta 2
    {{ template "rh2" }} | fis='2) d'4 |
    {{ template "rh2" }} | fis='2.) \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
  {{ template "lh1" (w `d'='2(-\frBass`) }}
  <ais= cis>2( fis4) | <b d>2( fis=4) |
  {{ template "lh1" (w `d'='2(`) }}
  <ais= e'>2( fis4) | <b d>2( b,=,4) |

  \rep 3 { cis=4 a' e' | d, a'= r | }
  r4 \duo { e=4 b'= | } { e=2 | } | <fis= ais>2. |
}
{{ end }}
