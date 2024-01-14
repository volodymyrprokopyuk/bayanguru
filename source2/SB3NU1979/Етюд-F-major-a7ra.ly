{{ define "rh1" }}
  {{ .a }} e d c d c d e | f e f g a g f e\) |
  f='16\( e d c d c d e | f g a bes c8\) a16[\( f='] |
{{ end }}

{{ define "rh2" }}
  g='16 c b c a c b c | g e f g a g f e\) |
  f='16\( d e f g f e d | e f d e c='8\) r |
{{ end }}

{{ define "rh3" }}
  {{ .a }} d c b c b c d | e d e f g f e d=''\) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} f+bes@M!8[ f+besM8] | f+fM!4 r |
{{ end }}

{{ define "lh2" }}
  e+c@M!8 r8 f+fM! r | e+c@M! r8 r4 |
  d+f@M!8 r8 g+gM! r | c= g@7! c+cM!8 r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key f \major
  \time 2/4
  {{ template "rh1" (w `f'='16\(\f`) }}
  {{ template "rh2" }}
  {{ template "rh1" (w `f='16\(`) }}
  d'=''16 a b a c a b a | f' e d c d c b a\) |
  e'=''16\( d c b c b a g | c e d e c=''8\) r |

  bes='16\(\p a g f g f g a | bes a bes c d c bes a\) |
  bes='16\( a g f g f g a | bes a g f\) e8(-> c=') |
  a'='16\(_\dCre g f e f e f g | a g a bes c bes a g\) |
  a='16\( g f e f e f g | a bes c d ees8\) c16\( a=' |
  {{ template "rh3" (w `e'=''16\f`) }}
  {{ template "rh3" (w `e=''16\(`) }}
  f=''16\( e d c d c b a | e' d c b c b a gis\) |
  a='16( b c d e d c b | a='8) r r4 |

  {{ template "rh1" (w `f='16\(\f`) }}
  {{ template "rh2" }}
  f='16\( e d c d c d e | f e f g a f g a\) |
  bes='16\( a g f g f g a | bes a bes c d\) g,\( a bes |
  c=''16 b c d e c d e | f e f g a f g a |
  bes=''16 a g f e f d e | f a g a f=''8\) r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  {{ template "lh1" (w `f+fM!4-\stBass`) }}
  {{ template "lh1" (w `f+fM!4`) }}
  {{ template "lh2" }}
  {{ template "lh1" (w `f+fM!4`) }}
  {{ template "lh1" (w `f+fM!4`) }}
  f+d@m!4 e+a@m!4 | d+dm!4 r8 f+d@m! |
  g+c@M!4 g=,8 g7! | c+cM![ c+f@M!] c+cM!8 r8 |

  \rep 2 { c@M!4 c@7!8[ c78] | c@M!4 r4 | }
  f+f7!4 f+f78 f+f7 | f+f74 r | f+f7!4 f+f78 f+f7 | f+f74~ f+f78 r |
  \rep 2 { e+c@M!4 r8 f+fM! | e+c@M!4 d+g@7!4 | }
  e+a@m!4 r4 | e+e7! r | a+am!8 r r e'= | a,=, r r4 |

  {{ template "lh1" (w `f+fM!4`) }}
  {{ template "lh1" (w `f+fM!4`) }}
  {{ template "lh2" }}
  {{ template "lh1" (w `f+fM!4`) }}
  f+bes@M!4 f+f7!8 f+f7 | bes+besM!4 r | bes+c@M!4 bes+c@M8[ bes+cM8] |
  a+f@M!4 r4 | g+gm!8 r c+c7!4 | f+fM!8 f+bes@M! f+fM!8 r8 |
}
{{ end }}
