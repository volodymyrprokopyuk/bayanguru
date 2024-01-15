{{ define "rh1" }}
  {{ .a }} ees4 | <aes c>2.\) |
  <g=' bes>2\( <f aes>4 | <ees=' g>2.\) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} eesM! eesM | e c@7! c74 | f,=, fm! fm |
{{ end }}

{{ define "lh2" }}
  f,=,4 fm! fm | bes bes7! bes7 | ees= eesM! eesM |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key ees \major
  \time 3/4
  bes'='2\(\mf aes4 | g2 bes4 | aes2 g4 | f2.\) |
  aes='2\( g4 | f2.\) | g2\( f4 | ees2.\) |
  bes'='2\( c4 | bes2 g4 | aes2 g4 | f2.\) |
  bes='2\( aes4 | g2 f4 | ees2.~ | ees='2.\) |

  {{ template "rh1" (w `ees='2\(`) }}
  f='2\( g4 | aes2 f4 | bes2.~ | bes2.\) |
  {{ template "rh1" (w `ees,='2\(`) }}
  aes='2\( c4 | g2 f4 | ees2.~ | ees='4\) r r \bar "|."

}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key ees \major
  {{ template "lh1" (w `ees=4-\stBass`) }} | aes f@m! fm4 |
  bes=,4 bes7! bes7 | d bes@7! bes74 |
  ees=4 eesM! eesM | g, ees@M! eesM4 |
  {{ template "lh1" (w `ees'=4`) }} | bes bes7! bes7 |
  d=4 bes@7! bes74 | bes bes7! bes7 |
  ees=4 eesM! eesM | bes=, ees@M! eesM4 |

  aes=,4( aesM!) aesM | f( aes@M!) aesM4 |
  bes=,4( bes7!) bes7 | ees( eesM!) eesM |
  {{ template "lh2" }} | g, ees@M! eesM4 |
  aes=,4( aesM!) aesM | f( aes@M!) aesM4 |
  bes=,4( besm!) besm | c( cm!) cm |
  {{ template "lh2" }} | ees+eesM! r r |
}
{{ end }}
