{{ define "rh1" }}
  {{ .a }} b c {{ .b }} b a g f e d e f e d c b a |
{{ end }}

{{ define "rh2" }}
  {{ .a }} a b a gis e fis gis a {{ .b }} b c d dis e fis {{ .c }} gis |
{{ end }}

{{ define "rh3" }}
  {{ .a }} a b a gis e fis gis a b c d dis e g fis |
{{ end }}

{{ define "rh4" }}
  {{ .a }} gis b e gis, b e gis a,\< c e a c, e a c |
  e,='32 gis b e gis, b e gis a, c e a c, e a \af 32\! c |
  b=''32\mf a f d b a f d e a c e a, c e a | b, d f a e\> gis b e=''' %
{{ end }}

{{ define "rh5" }}
  {{ template "rh2" (w `gis='32` `\<` ` \af 32\!`) }}
  {{ template "rh1" (w `a=''32\mf` ``) }}
  gis='32 a b c d e fis gis \ottava #1 %
  a=''32\< b c d dis e fis \af 32\! gis |
  {{ template "rh1" (w `a='''32\f` ``) }}
  {{ template "rh2" (w `gis=''32` `` ``) }}
  {{ template "rh1" (w `a='''32` ``) }}
  gis=''32 a b c d e fis gis=''' %
{{ end }}

{{ define "lh1" }}
  {{ .a }} am! f d@m! | e'8 eM! a,=, e@M |
{{ end }}

{{ define "lh2" }}
  e'=8 eM! a, am! | b e@7! c8 a@m! | {{ .a }} e8 a@m! | e8 e7! a,=, am! |
{{ end }}

{{ define "lh3" }}
  e'=8 d c r | e d c a | f' d@m! e8 a@m! | f8 e a,=, {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key a \minor
  \time 2/4
  {{ template "rh1" (w `a''=''32\mp` `_ \aLeg`) }}
  {{ template "rh5" }} a='''8 \ottava #0 r |

  {{ template "rh3" (w `gis,,,=32\p`) }}
  f='32 e d c b c e d c b a b c d dis e |
  g='32 fis f e d e f g a b c d dis e g fis |
  f=''32 e d c b c e d c b a b c d e fis |
  \ottava #1
  {{ template "rh3" (w `gis=''32\mf`) }}
  f='''32 e d c b c e d c b a gis g fis f e |
  \ottava #0
  d=''32 c b a b c d e c b a b c d dis e |
  g=''32 fis f e dis e fis gis a b c e a='''8 |

  {{ template "rh4" (w `e,,,=32\p`) }} a,=''32 e c a a e c \af 32\! a |
  {{ template "rh4" (w `e=32\p`) }} a,=''32 b c e \af 8\! a='''8\p |

  {{ template "rh1" (w `a,=''32\mp` ``) }} {{ template "rh5" }}
  a='''8 <a,='' c e a> \ottava #0 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `a,=,8-\stBass`) }}
  {{ template "lh1" (w `a=,8`) }}
  {{ template "lh1" (w `a=,8`) }}
  a=,8 am! d dm! | e eM! a,=, am! |

  {{ template "lh2" (w `d=8 dm!`) }}
  {{ template "lh2" (w `f=8 d@m!`) }}

  {{ template "lh3" (w `r`) }}
  {{ template "lh3" (w `am!`) }}

  {{ template "lh1" (w `a=,8`) }}
  {{ template "lh1" (w `a=,8`) }}
  {{ template "lh1" (w `a=,8`) }}
  a=,8 am! f d@m! | e'8 e7! a,=, a+am! |
}
{{ end }}
