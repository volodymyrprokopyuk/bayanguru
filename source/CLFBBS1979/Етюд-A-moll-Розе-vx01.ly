{{ define "rh1" }}
  {{ .a }} cis d cis d c | b4 g)-. g-. | <fis=' a>2.\> |
{{ end }}

{{ define "rh2" }}
  {{ .a }} d cis d c d | b d a d g, \af 8\! d'='' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} r4 | <g b d>2 r4 | d'8( cis d cis d c=' |
{{ end }}

{{ define "lh2" }}
  a=8 d cis d c d | b d a d g, d'=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 3/4
  \repeat volta 2 {
    {{ template "rh1" (w `d''=''8(\mf`) }} | g='4 b \af 4\! d |
    {{ template "rh1" (w `d=''8(`) }} | \af 2\! g='2 r4 |
  }

  {{ template "rh2" (w `a='8\p\<`) }}
  fis,='8\> d' a d fis, d' | g, d' b d g, \af 8\! d' |
  {{ template "rh2" (w `a='8\mp\<`) }}
  a='8\> d a d g, cis | \af 2\! <fis,=' d'>2. |

  {{ template "rh1" (w `d'=''8(\mf`) }} | g='4 b \af 4\! d |
  {{ template "rh1" (w `d=''8(`) }} | \af 2\! g='2 r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  {{ template "lh1" (w `<g= b d>2-\frBass`) }} | b=2.) |
  {{ template "lh1" (w `<g= b d>2`) }} | b=2) r4 |

  {{ template "lh2" }} | c='4 d c | b d b |
  {{ template "lh2" }} | a=2. | d8 cis d c b a |
  {{ template "lh1" (w `<g= b d>2`) }} | b=2) r4 |
  {{ template "lh1" (w `<g= b d>2`) }} | <g= b>2) r4 |
}
{{ end }}
