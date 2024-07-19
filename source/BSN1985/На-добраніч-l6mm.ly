{{ define "rh1" }}
  {{ .a }} ees8 \af 8\! d | c4 d8 c | bes4\> a | \af 2\! g=2\) |
{{ end }}

{{ define "rh2" }}
  {{ .a }} r <d g bes>] | r <ees g a>[ r8 \af 8\! 8] |
  r8\> <d=' g bes>[ r <d=' fis c'>] |
{{ end }}

{{ define "lh1" }}
  {{ .a }} | c@m!2 | d@7!2 | g@m!2 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \minor
  \time 2/4
  {{ template "rh1" (w `d'='4\(\p\<`) }}
  {{ template "rh1" (w `d'='4\(\<`) }}
  bes=4(\mf\< c | \af 2\! d2) |
  \duo { f'='4(\> ees | \af 2\! d='2) | } { g=4( a | bes c=') | }
  {{ template "rh1" (w `d='4\(\p\<`) }}

  {{ template "rh2" (w `r8\mp\< <bes= d g>8[`) }}
  r8 <bes'=' d>8[ 8 \af 8\! <a c>] |
  {{ template "rh2" (w `r8\< <bes,= d g>8[`) }}
  r8 <g=' bes>8[ 8 \af 8\! <a=' c>] |

  bes='4(\pp c | d2) | f4( ees | d2) |
  d=''4( ees8 d) | c4( d8 c) | bes4(^\tRit a | g='2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  {{ template "lh1" (w `g@m!2-\stBass`) }}
  {{ template "lh1" (w `g@m!2`) }}
  g,=,4( a | bes2) | c4 f@7! | bes4( a) |
  g=,4 gm! | a c@m! | d4 d7! | g,=, gm! |

  d'=4-\puBass ees8 d | c4 d8 c | bes4 a | g2 |
  d'=4 ees8 d | c4 d8 c | bes4 a | g f=, |

  bes@M!8[-\stBass besM8] f@7![ f78] | bes@M!8[ besM8 besM besM] |
  f@7!8[ f78 f7 f7] | bes@M![ besM8 besM besM] |
  gm!8 g=, gm g | c@m![ g8] c@m[ g8] | d7![ d'] d7[ d] | gm![ g,=,] gm4 |
}
{{ end }}
