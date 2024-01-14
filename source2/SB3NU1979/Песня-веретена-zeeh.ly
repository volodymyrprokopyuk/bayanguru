{{ define "rh1" }}
  {{ .a }} bes a bes a bes a bes a g f a | g) a( g a g a g a g f e g |
  f='16) g( f g f g f g f ees d f | ees f ees d cis e d='4) r8 |
{{ end }}

{{ define "lh1" }}
  r4 {{ .a }} bes+besM!4.) | r4 e+em!8( a+aM!4.) |
  r4 d+dm!8( g+gm!4.) | r4 a+a7!8( d+dm!4) r8 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key d \minor
  \time 6/8
  a'='16\(\p bes a bes a bes a\< bes a bes a \af 16\! bes |
  a='16\> bes \rep 4 { a='16 bes=' } a \af 16\! bes |
  c=''16\) d\( \rep 5 { c=''16 d='' } |
  c=''16\< d c b a b c e g e \af 8\! c=''8\) |

  r4 \clef bass <f,,= a>8( <e gis>4.) | r4\< <ees g>8( \af 4.\! <d fis>4.) |
  \clef treble r4 <d'=' f>8( <cis e>4.) | r4 <d a'>8( <cis=' e>4) r8 |

  d='16\(\f ees \rep 10 { d='16 ees=' } d ees\) |
  f='16\( g \rep 10 { f='16 g=' } f g\) | {{ template "rh1" (w `a='16(\f`) }}

  r4\p <bes= d>8( <a cis>4.)_\dCre | r4 <aes c>8( <g b>4.) |
  r4 <g= bes>8( <fis a>4.) | r4 <fis c'>8( <g= bes>4)\> \af 8\! r8 |

  {{ template "rh1" (w `a'='16(\f`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  r4 d@m!8(-\stBass a@M!4.) | r4 a@7!8( d@m!4.) |
  r4 f@M!8( c@M!4.) | r4 d@m!8( c@M!4) r8 |

  bes,=,16\(-\puBass c \rep 11 { bes=,16 c= } |
  a=,16\) bes( \rep 6 { a=,16 bes=, } a g f g a bes a bes a=,8) |

  r4 g@m!8(-\stBass d@M!4.) | r4 d@7!8( g@m!4.) |
  r4 bes@M!8( f@M!4.) | r4 f@7!8( bes@M!4.) |
  {{ template "lh1" (w `f+bes@m!8(`) }}

  ees'=16\(-\puBass f \rep 11 { ees=16 f= } |
  d=16\) ees\( \rep 8 { d=16 ees= } d c bes a g=,8\) |

  {{ template "lh1" (w `f+bes@m!8(-\stBass`) }}
}
{{ end }}
