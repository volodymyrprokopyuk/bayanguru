{{ define "rh1" }}
  {{ .a }} e-. d-. e-. | d-. e-. d-. \af 8\! e-. |
  d='8-. e-. d-. g-. | fis-. g-. fis-. e='-. |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Presto
  \clef treble
  \key g \major
  \time 2/4
  {{ template "rh1" (w `d'='8-.\mf\<`) }}
  ees='8(-- d)-. d-. d-. | e(-- d)-. d-. d-. |
  f='8(-- d)-. d-. d-. | \acc { gis='8 } a8(-- d,)-. d='4-> |

  {{ template "rh1" (w `d='8-.\<`) }}
  <fis=' b>8->\f 8-> 4-> | <fis b>8-> 8-> <fis a>4-> |
  d='8-. e-. d-. <g b>-. | <d=' g>8-> 8-> 8-> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g@M!8-.-\stBass r8 b@m!-. r8 | e@m!-. r8 b@m!-. r8 |
  g@M!_\aSim r8 d= r | g@M! r8 d r |
  \rep 3 { d@7!8 r8 d= r | } d@7!8 r8 d=4-> |

  g@M!8 r8 b@m! r8 | e@m!8 r8 b@m! r8 |
  \rep 2 { g@M! r8 d= r | }
  R2 | R2 | d@7!8 r8 d= r | g+gM!8-> g+gM-> g+gM-> r |
}
{{ end }}
