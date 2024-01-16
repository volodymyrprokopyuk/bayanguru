{{ define "t2" }}
  \tuplet 3/2 { {{ .a }} {{ .b }} {{ .c }} } %
  \tuplet 3/2 { {{ .d }} {{ .e }} {{ .f }} } |
{{ end }}

{{ define "t3" }}
  \tuplet 3/2 { {{ .a }}[ r8 {{ .b }}] } %
  \tuplet 3/2 { {{ .c }}[ r8 {{ .d }}] } |
{{ end }}

{{ define "t4" }}
  \tuplet 3/2 { {{ .a }} r8 r } \tuplet 3/2 { {{ .b }} r8 r } |
{{ end }}

{{ define "rh1" }}
  {{ template "t2" (w .a .b `<e g>` `<a c>8` `<g b>` `<f a>`) }}
  {{ template "t2" (w `<e='' g>8` `<dis fis>` `<e g>`
     `<c e>` `<b dis>` `<c e>`) }}
  {{ template "t2" (w `<d='' f>8` `<cis e>` `<d f>`
     `<f a>` `<e g>` `<d f>`) }}
  {{ template "t2" (w `<c='' e>8` `<d f>` `<c e>`
     `<g d'>` `<c e>` `<d='' f>`) }}
{{ end }}

{{ define "rh2" }}
  {{ template "t2" (w `<a=' c>8(` `<gis b>)-.` `<a c>`
     `<c e>` `<b dis>` `<c e>`) }}
  {{ template "t2" (w `<a=' c>8(` `<gis b>)-.` `<a c>`
     `<fis a>(` `<eis gis>)-.` `<fis a>`) }}
  {{ template "t2" (w `<g=' b>8(` `<fis ais>)-.` `<g b>`
     `<b d>` `<ais cis>` `<a c>`) }}
  {{ template "t2" (w `<b=' d>8(` `<ais cis>)-.` `<b d>`
     `<d f>` `<c e>` `<b=' d>`) }}
{{ end }}

{{ define "lh1" }}
  {{ template "t3" (w .a `cM!` `f,` `fM!`) }}
  {{ template "t3" (w `c'=8` `cM!` `g` `c@M`) }}
  {{ template "t3" (w `d'=8` `dm!` `g,` `g7!`) }}
  {{ template "t3" (w `c=8` `cM!` `g=,` `g7!`) }}
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro con fuoco"
  \clef treble
  \key c \major
  \time 2/4
  {{ template "rh1" (w `<e''='' g>8\mp` `<dis fis>_\aSta`) }}
  {{ template "t2" (w `<e='' g>8` `<dis fis>` `<e g>`
     `<a c>` `<g b>` `<f a>`) }}
  {{ template "t2" (w `<e='' g>8` `<dis fis>` `<e g>`
     `<g bes>` `<f a>` `<e g>`) }}
  {{ template "t2" (w `<fis='' a>8\<` `<eis gis>` `<fis a>`
     `<e c'>` `<d b'>` ` \af 8\! <c a'>`) }}
  {{ template "t2" (w `<b=' g'>8\>` `<g b>` `<a c>`
     `<b d>` `<c e>` ` \af 8\! <d='' f>`) }}

  {{ template "rh1" (w `<e='' g>8\mp` `<dis fis>`) }}
  {{ template "t2" (w `<e='' g>8_\dCre` `<dis fis>` `<e g>`
     `<g bes>` `<f a>` `<e g>`) }}
  {{ template "t2" (w `<d='' f>8` `<cis e>` `<d f>`
     `<f, d'>` `<e cis'>` `<f d'>`) }}
  {{ template "t2" (w `<g=' e'>8` `<fis dis'>` `<g e'>`
     `<f d'>` `<e cis'>` `<f d'>`) }}
  \tuplet 3/2 { <e=' c'>8\mf g <g e'> } <e=' c'>4 |

  {{ template "t2" (w `<b'=' d>8(` `<ais cis>)-.` `<b d>`
     `<gis b>(` `<fisis ais>)-.` `<gis b>`) }}
  {{ template "rh2" }}
  {{ template "t2" (w `<a=' c>8(` `<gis b>)-.` `<a c>`
     `<c e>` `<b dis>` `<c e>`) }}
  {{ template "t2" (w `<cis='' e>8(` `<bis dis>)-.` `<cis e>`
     `<e g>` `<d fis>` `<cis e>`) }}
  {{ template "t2" (w `<d='' fis>8(\>` `<cis eis>)-.` ` \af 8\! <d fis>`
     `<c e>\p` `<b dis>` `<c='' e>`) }}

  {{ template "t2" (w `<b=' d>8(` `<ais cis>)-.` `<b d>`
     `<g b>(` `<fis ais>)-.` `<g b>`) }}
  {{ template "rh2" }}
  {{ template "t2" (w `<c='' e>8_\dCre` `<b dis>` `<c e>`
     `<e c'>` `<d b'>` `<c a'>`) }}
  {{ template "t2" (w `<b=' d>8` `<ais cis>` `<b d>`
     `<d b'>` `<c a'>` `<b g'>`) }}
  {{ template "t2" (w `<a=' fis'>8` `<g e'>` `<fis d'>`
     `<e c'>` `<d b'>` `<c a'>`) }}
  {{ template "t2" (w `<b= g'>8(\sf` `fis')-.\p` `g`
     `<g b>` `<fis ais>` `<g b>`) }}
  {{ template "t2" (w `<a=' c>8_\dCre` `<gis b>` `<a c>`
     `<bes des>` `<a c>` `<bes des>`) }}
  {{ template "t2" (w `<b=' d>8` `<ais cis>` `<b d>`
     `<c ees>` `<b d>` `<c ees>`) }}
  {{ template "t2" (w `<cis='' e>8` `<c ees>` `<cis e>`
     `<d f>` `<cis e>` `<d='' f>`) }}

  {{ template "rh1" (w `<e='' g>8\f` `<dis fis>`) }}
  {{ template "t2" (w `<e='' g>8` `<dis fis>` `<e g>`
     `<g bes>` `<f a>` `<e g>`) }}
  {{ template "t2" (w `<f='' a>8` `<e gis>` `<f a>`
     `<a f'>` `<g e'>` `<f d'>`) }}
  {{ template "t2" (w `<e='' g>8` `<dis fis>` `<e g>`
     `<g e'>` `<f d'>` `<e c'>`) }}
  {{ template "t2" (w `<d='' b'>8` `<c a'>` `<b g'>`
     `<a f'>` `<g e'>` `<f d'>`) }}
  {{ template "t2" (w `<e=' c'>8` `<g e'>` `<f d'>`
     `<e c'>_\dDim` `<d b'>` `<c a'>`) }}
  {{ template "t2" (w `<b= g'>8` `<c a'>` `<b g'>`
     `<a f'>` `<g e'>` `<f d'>`) }}
  \clef bass
  {{ template "t2" (w `<e= c'>8` `<g e'>` `<f d'>`
     `<e c'>` `<d b'>` `<c a'>`) }}
  <b=, g'>4 \clef treble <b'= f' g>( |
  <c=' e c'>4)\p <c g' e'> <g= e' c'> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \hideTupletBracket
  {{ template "lh1" (w `c=8-\stBass`) }}
  {{ template "t3" (w `c=8` `cM!` `f` `fM!`) }}
  {{ template "t3" (w `c=8` `cM!` `a` `a7!`) }}
  {{ template "t3" (w `d=8` `d7!` `d` `d7`) }}
  \tuplet 3/2 { g+gM!8 r r } \tuplet 3/2 { f=8 e d= } |

  {{ template "lh1" (w `c=8`) }}
  {{ template "t3" (w `c=8` `cM!` `a` `a7!`) }}
  {{ template "t3" (w `d=8` `dm!` `f,` `d@m`) }}
  {{ template "t3" (w `g=,8` `c@M!` `g8` `g7!`) }}
  \tuplet 3/2 { c=8[ r g] } c=4 |

  {{ template "t4" (w `g+gM!8` `e+eM!`) }}
  {{ template "t4" (w `a+am!8` `c+a@m`) }}
  {{ template "t4" (w `d+a@m!8` `d+d7!8`) }}
  {{ template "t4" (w `g+gM!8` `d+d7!`) }}
  {{ template "t4" (w `g+gM!8` `e+e7!`) }}
  {{ template "t4" (w `a+am!8` `g+a@m!`) }}
  {{ template "t4" (w `fis+fis7!8` `fis+fis7`) }}
  {{ template "t4" (w `b+bm!8` `d+d7!`) }}

  {{ template "t3" (w `g=,8` `gM!` `d'` `g@M`) }}
  {{ template "t3" (w `a=,8` `am!` `g` `a@m`) }}
  {{ template "t3" (w `fis=,8` `d@7!` `d'8` `d7`) }}
  {{ template "t3" (w `g,=,8` `gM!` `d'` `d7!`) }}
  {{ template "t3" (w `g,=,8` `gM!` `e` `e7!`) }}
  {{ template "t3" (w `a=,8` `am!` `c` `a@m`) }}
  {{ template "t3" (w `d=8` `g@M!` `d8` `g@M`) }}
  {{ template "t3" (w `d=8` `d7!` `d` `d7`) }}
  g,=,2~ | g | \duo { r4 c@m! | r4 g7! | } { g,=,2 | g=, | }

  {{ template "lh1" (w `c=8`) }}
  {{ template "t3" (w `c=8` `cM!` `a` `a7!`) }}
  {{ template "t3" (w `d=8` `dm!` `f,` `d@m`) }}
  {{ template "t3" (w `g=,8` `c@M!` `g8` `c@M`) }}
  {{ template "t3" (w `g=,8` `g7!` `g` `g7`) }}
  \tuplet 3/2 { c+cM!8 r r } r4 |
  r4 \tuplet 3/2 { g+g7!8 r r } |
  \tuplet 3/2 { c+cM!8 r r } r4 |
  {{ template "t2" (w `g=,8` `a` `g` `f` `e` `d`) }} c4 r | c'= r |
}
{{ end }}
