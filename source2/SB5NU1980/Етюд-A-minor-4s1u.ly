{{ define "rh1" }}
  {{ .a }} e f a, d f | e {{ .b }} a, c e d f, a d |
  c=''16 e, a c b e, gis b | a e fis gis=' %
{{ end }}

{{ define "rh2" }}
  \rep 2 { f=''16-> aes, c f e g, c e='' | }
{{ end }}

{{ define "rh3" }}
  \rep 2 { b='16 e, gis b c e, a c='' | }
  d=''16 f, a d dis f, a dis | e {{ .a }} e, fis gis a b c d='' |
{{ end }}

{{ define "rh4" }}
  e=''16 a, c e f a, d f | e a, c e d f, a d |
  c=''16 {{ .a }} e, a c b e, gis {{ .b }} b=' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} am! d+dm! r | a=,8 am! d+dm! r | a am! e'= eM! | a+am! r r4 |
{{ end }}

{{ define "lh2" }}
  g+gM!8 r c+cM! r | \rep 2 { f+fm!4(-> c+cM!8)-. r | }
{{ end }}

{{ define "lh3" }}
  b+bM!8 r e+em! r | \rep 2 { a+am!4(-> e+em!8)-. r | }
{{ end }}

{{ define "lh4" }}
  fis+b@7!8 r8 g+e@m! r8 | a+am!8 b+b7! e+em! r |
{{ end }}

{{ define "lh5" }}
  \rep 2 { e=8 eM! a+am! r | } d c b4 | e8[ d c b=,] |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key a \minor
  \time 2/4
  {{ template "rh1" (w `e''=''16\mf a, c_\aLeg` ``) }} a b c d |
  {{ template "rh1" (w `e=''16 a, c` `_ \dCre`) }} a gis a ais |
  {{ template "rh3" (w `\f`) }}
  {{ template "rh4" (w `\>` ` \af 16\!`) }}
  a='16\< e fis gis a b c \af 16\! cis='' |

  d=''16\p g, b d e g, c e | {{ template "rh2" }}
  d=''16 fis, a d c f, aes c | b g b d e g, c e |
  {{ template "rh2" }} | d=''16 c b d c d e f |
  fis=''16_\dCre b, dis fis g b, e g |
  \rep 2 { a=''16-> c, e a g b, e g='' | }
  fis=''16 ais, cis fis e a, c e | dis b dis fis g b, e g |
  a=''16-> c, e a g b, e g | a-> e c e g e b e |
  fis=''16 e dis fis e b e g | b c b c b g fis e |
  fis=''16 e dis fis e b, e g | b_\dDim c b c b g fis e |
  fis='16 e dis fis e b e g | b b cis dis e b e g |
  b=''16 b cis dis e b g fis | e e, g b e fis, a c |
  e=''16^\tRit g, ais cis e gis, b d='' |

  {{ template "rh1" (w `e=''16\mf^\tATem a, c` ``) }} a b c d |
  {{ template "rh1" (w `e=''16 a, c` ``) }} a gis a ais |
  {{ template "rh3" (w ``) }} {{ template "rh4" (w `` ``) }}
  | a='16 b c e a=''8 r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `a,=,8-\stBass`) }}
  {{ template "lh1" (w `a,=,8`) }}
  {{ template "lh5" }}
  {{ template "lh1" (w `a=,8`) }}

  {{ template "lh2" }} | d+dM!8 r f+fm! r |
  {{ template "lh2" }} | d+dM!8 g+g7! c+cM! r |
  {{ template "lh3" }} | fis+fisM!8 r a+am! r |
  {{ template "lh3" }} | b+bM!8 r e+em! r |
  {{ template "lh4" }} {{ template "lh4" }}
  \rep 2 { b+b7!8 r e+em! r | } R2 | R2 |

  {{ template "lh1" (w `a,=,8`) }}
  {{ template "lh1" (w `a,=,8`) }}
  {{ template "lh5" }}
  a=,8 am! d+dm! r | a am! d+dm! r |
  a=,8 am! e' eM! | a, e' a+am! r |
}
{{ end }}
