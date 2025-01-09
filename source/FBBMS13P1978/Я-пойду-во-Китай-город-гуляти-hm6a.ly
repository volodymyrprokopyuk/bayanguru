{{ define "rh1" }}
  {{ .a }} g16 aes bes8. aes16 | g8 bes f {{ .b }} | ees16( f g aes bes4) |
  g='8( ees'16 d c4) | bes8( \tuplet 3/2 { bes='16 aes g } aes8 aes |
  g='8 ees f {{ .b }} | ees( g bes16 aes g f | \af 2\! ees='2)\> |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key ees \major
  \time 2/4
  {{ template "rh1" (w `ees'='8(\mf` `bes,)`) }}

  \duo {
    {{ template "rh1" (w `ees'='8(\p` `d)`) }}
  } {
    s4 f'='4 | ees c8 bes | ees\< d \af 4\! ees4 |
    ees='2 | d4 c | bes d8 bes | bes4\< \af 4\! d='4 | s2 |
  }

  ees='16\(\mf f g aes bes c bes aes | g bes aes g f bes, c d |
  ees='16 f g aes <g bes>4\) | g16( bes ees des <aes c>8) des16( c |
  bes='16 aes g bes <f aes>8) bes16( aes | g f ees g f bes, c ees) |
  f='16( g aes c bes aes g f | ees='2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key ees \major
  bes,=,8-\frBass <ees g> bes <d f> | bes <ees g> bes <f' aes> |
  bes,=,8 <ees g> bes <ees g> | bes <g' bes> bes, <ees aes> |
  bes=,8 <ees g> bes <d f> | bes <ees g> bes <f' aes> |
  bes,=,8 <ees g> bes <d aes'> | <ees g> ees ees ees= |

  r8 ees'='8( d c | bes4 aes) | g8( bes) ees,16( f g aes |
  bes=4) aes8( g16 f | ees8 e f16 ees d8) | ees( c bes aes) |
  g=,8( c bes4~ | bes16) aes( g f ees=,4) |

  g=,8-\stBass ees@M! f8 bes@7! | ees8 c@m! aes8 bes@M! |
  g=,8 ees@M! f8 ees | des' c16 bes aes8 aesM! |
  ees'=8 e f aes@M! | bes,8 ees@M! bes8 ees@M! |
  aes=,8 f@m! bes8 bes7! | ees= eesM! eesM4 |
}
{{ end }}
