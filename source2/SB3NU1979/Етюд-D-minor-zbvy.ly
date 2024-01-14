{{ define "lh1" }}
  {{ .a }} r dm! r a r d@m r8 | cis r a@7! r8 a=, r a7 r |
{{ end }}

{{ define "lh2" }}
  g=,8 r g7! r d' r g@7 r8 | a r a7! r cis= r a@7 r8 |
{{ end }}

{{ define "lh3" }}
  fis=,8 r d@7! r8 d' r d7 r | g, r gm! r d'= r g@m r8 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key d \minor
  \time 4/4
  \duo {
    f''=''1\mp | e | ees | d | bes | a | a | a=' |

    f'=''1\p | e | fis_\dCre | g | gis | a | b | cis='''\f |

    f='''1\p | e | ees | d | bes | a | f2 e | a,1^\tRit |
    a='1_\dDim | a2 f'=''\pp \fermata \bar "|."
  } {
    \rep 2 { r8 a'='8-. bes-. a-. c( bes) bes-. a='-. | }
    r8 a='8_\aSim bes a c( bes) bes a |
    r8 g='8 a g bes( a) a g | r e f e g( f) f e |
    \rep 2 { r8 d='8 e d f( e) e d=' | }
    r8\< f='8 f \af 16.\! e g(\> f) f \af 8\! e=' |

    \rep 2 { r8 a='8 bes a c( bes) bes a=' | }
    r8 c=''8 d c ees( d) d c |
    \rep 2 { r8 bes='8 c bes d( c) c bes=' | }
    \rep 2 { r8 d=''8 e d f( e) e d='' | }
    r8 e=''8 f e g( f) f e='' |

    \rep 3 { r8 a=''8 bes a c( bes) bes a='' | }
    r8 g=''8 a g bes( a) a g | r f f e g( f) f e |
    r8 e=''8 e d f( e) e d | c( bes) bes e, bes'( a) a cis, |
    \rep 2 { e='8( cis) cis d r d( f e=') | }
    e='8( cis) cis d <d=' a'>2 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  {{ template "lh1" (w `d=8-\stBass`) }} {{ template "lh3" }}
  cis=8 r a@7! r8 a r a7 r | d r dm! r a=, r d@m r8 |
  {{ template "lh2" }}

  {{ template "lh1" (w `d=8`) }}
  d=8 r d7! r a r d@7 r8 | g r gm! r e' r g@m r8 |
  bes=,8 r bes7! r f r bes@7 r8 | d' r dm! r a=, r d@m r8 |
  {{ template "lh2" }}

  {{ template "lh1" (w `d=8`) }} {{ template "lh3" }}
  a=,8 r a7! r cis r a@7 r8 | d r dm! r a r d@m r8 |
  g=,8 r gm! r a r a7! r | d r dm! r g@m!4 r4 |
  d=8 r dm! r g@M!4 r4 | d=8 r dm! r d+dm2 \fermata |
}
{{ end }}
