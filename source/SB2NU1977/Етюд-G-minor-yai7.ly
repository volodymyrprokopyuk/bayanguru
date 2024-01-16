{{ define "t1" }}
  \tuplet 3/2 { {{ .a }} 8-. 8-. } %
{{ end }}

{{ define "rh1" }}
  {{ template "t1" (w .a) }} <c=' d fis>8-.-> r %
  \tuplet 3/2 { <c=' ees g>8-. {{ .b }} 8-. 8-. } <c d fis>-.-> r |
  \tuplet 3/2 { <bes= d a'>8-. {{ .c }} 8-. 8-. } <bes d g>-.-> r %
  \tuplet 3/2 { <bes= d a'>8-. {{ .d }} 8-. 8-. } <bes= d g>-.-> r |
{{ end }}

{{ define "lh1" }}
  r4 \tuplet 3/2 { r8 {{ .a }}( {{ .b }}) } %
  r4 \tuplet 3/2 { r8 {{ .c }}( {{ .d }}) } |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro moderato"
  \clef treble
  \key g \minor
  \time 4/4
  {{ template "rh1" (w `<c'=' ees g>8-.\mf` `\p` `\f` `\p`) }}
  {{ template "rh1" (w `<c=' ees g>8-.\p` `` `\mp` ``) }}
  {{ template "t1" (w `<b= f' aes>8-.\mf`) }} <b f' g>-.-> r %
  {{ template "t1" (w `<f'=' g ees'>8-.`) }} <f g d'>-.-> r |
  {{ template "t1" (w `<c=' ees aes>8-.\p`) }} <c ees g>-.-> r %
  {{ template "t1" (w `<ees=' g d'>8-.`) }} <ees g c>-.-> r |
  {{ template "t1" (w `<ees=' g bes>8-._\dCre`) }} <ees g a>-.-> r %
  {{ template "t1" (w `<g=' c f>8-.`) }} <g c ees>-.-> r |
  {{ template "t1" (w `<fis=' c' ees>8-.`) }}
  {{ template "t1" (w `<fis=' c' d>8-.`) }}
  {{ template "t1" (w `<c=' fis bes>8-.`) }}
  {{ template "t1" (w `<c=' fis a>8-.`) }} |

  {{ template "rh1" (w `<c=' ees g>8-.\p` `` `` ``) }}
  {{ template "t1" (w `<a= ees' g>8-.\mp`) }} <a ees' f>-.-> r %
  {{ template "t1" (w `<a= ees' g>8-._\dCre`) }} <a ees' f>-.-> r |
  {{ template "t1" (w `<f'=' bes ees>8-.`) }} <f bes d>-.-> r %
  {{ template "t1" (w `<d=' f c'>8-.`) }} <d f bes>-.-> r |
  {{ template "t1" (w `<aes'=' bes g'>8-.\f`) }} <aes bes f'>-.-> r %
  {{ template "t1" (w `<g=' bes f'>8-.`) }} <g bes ees>-.-> r |
  {{ template "t1" (w `<f=' b ees>8-._\dDim`) }} <f b d>-.-> r %
  {{ template "t1" (w `<ees=' g d'>8-.`) }} <ees g c>-.-> r |
  {{ template "t1" (w `<c=' ees bes'>8-._\dCre`) }} <c ees a>-.-> r %
  {{ template "t1" (w `<ees=' g d'>8-.`) }} <ees g c>-.-> r |
  {{ template "t1" (w `<g=' c f>8-.`) }} <g c ees>-.-> r %
  {{ template "t1" (w `<fis=' c' ees>8-.^\tRit`) }} <fis=' c' d>-.-> r |

  {{ template "t1" (w `<c'='' ees g>8-.\pp^\tATem`) }} <c d fis>-.-> r %
  {{ template "t1" (w `<c='' ees g>8-.`) }} <c d fis>-.-> r |
  {{ template "t1" (w `<bes=' d a'>8-.`) }} <bes d g>-.-> r %
  {{ template "t1" (w `<bes=' d a'>8-.`) }} <bes d g>-.-> r |
  {{ template "t1" (w `<a=' b g'>8-.\mp`) }} <a b f'>-.-> r %
  {{ template "t1" (w `<g=' c f>8-.`) }} <g c ees>-.-> r |
  \tuplet 3/2 { <ees=' fis bes>8-.\< 8-. \af 16.\! 8-. } %
  {{ template "t1" (w `<c=' fis a>8-.`) }}
  \tuplet 3/2 { <bes= d a'>8-.\> 8-. \af 16.\! 8-. } <bes d g>-.-> r |
  \tuplet 3/2 { <aes= b g'>8-.\mf 8-._ \dDim 8-. } <aes b f'>8-.-> r %
  {{ template "t1" (w `<g= c f>8-.`) }} <g c ees>-.-> r |
  \af 4\! <g= bes d>4-.->\< \af 4\! <a c f>-.->\> %
  \af 4\! <g= bes d>4-.->\< \af 4\! <c ees aes>-.->\> |
  \tuplet 3/2 { r8 <bes= d g>8-._\dCre <bes d a'>-. } %
  \tuplet 3/2 { <bes= d g>8-. <d g bes>-. <d g c>-. } %
  \tuplet 3/2 { <d=' g bes>8-. <g bes d>-. <g bes ees>-. } %
  \tuplet 3/2 { <g=' bes d>8-. <bes d g>-. <bes d a'>-. } |
  \tuplet 3/2 { <bes=' d g>8-.-> <d g bes>8-. <f a c>8-. } %
  <g='' bes d>4~->\f 2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  r4 \tuplet 3/2 { r8 d,=,(-\puBass a') } %
  r4 \tuplet 3/2 { r8 d,=,( a') } |
  {{ template "lh1" (w `g=,8` `d'` `g,` `d'=`) }}
  {{ template "lh1" (w `d,=,8` `a'` `d,` `a'=,`) }} |
  {{ template "lh1" (w `g=,8` `d'` `g,` `d'=`) }}
  {{ template "lh1" (w `d,=,8` `g` `d` `g=,`) }} |
  {{ template "lh1" (w `g=,8` `c` `g` `c=`) }}
  {{ template "lh1" (w `f,=,8` `c'` `a` `c=`) }} |
  \rep 2 { \tuplet 3/2 { r4 a=,8( } d,4) } |

  {{ template "lh1" (w `d=,8` `a'` `d,` `a'=,`) }}
  {{ template "lh1" (w `g=,8` `d'` `g,` `d'=`) }} |
  {{ template "lh1" (w `f,=,8` `c'` `f,` `c'=`) }}
  {{ template "lh1" (w `f,=,8` `bes` `f` `bes=,`) }} |
  {{ template "lh1" (w `f=,8` `bes` `ees,` `bes'=,`) }}
  {{ template "lh1" (w `g=,8` `d'` `g,` `c=`) }} |
  {{ template "lh1" (w `g=,8` `c` `g` `c=`) }}
  {{ template "lh1" (w `g=,8` `c` `bes` `a=,`) }} |

  {{ template "lh1" (w `d,=,8` `a'` `d,` `a'=,`) }}
  {{ template "lh1" (w `g=,8` `d'` `g,` `d'=`) }} |
  {{ template "lh1" (w `f,=,8` `d'` `g,` `c=`) }}
  r2 r4 \tuplet 3/2 { r8 d,=,( g) } |
  {{ template "lh1" (w `d=,8` `g` `g` `c=`) }}
  \rep 4 { \tuplet 3/2 { r8 d,=, d } } |
  g=,4~ \tuplet 3/2 { g=,8 d4 } g4 d |
  \tuplet 3/2 { g=,8 d4 } g4 %
  \tuplet 3/2 { g=,8-- g-- d=,-- } g+gm!4 |
}
{{ end }}
