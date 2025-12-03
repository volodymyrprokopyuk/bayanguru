{{ define "rh1" }}
  {{ .a }} d c b a g f e | | d16 e f g a d e f | | d16 c b a g f e d |
{{ end }}

{{ define "rh2" }}
  {{ .a }} d e f g a b c | d e f a g f e d |
{{ end }}

{{ define "rh3" }}
  {{ .a }} d {{ .b }} c d \rep 3 { c='16 d c d=' } |
  c='16 d e f g c, d e | f e f g a g a bes | \rep 4 { c=''16 d c d='' } |
  c=''16 d e f g c, d e | f\> c f a \af 8\! f=''8-. r |
{{ end }}

{{ define "rh4" }}
  {{ .a }} f e d c bes a g | f e d c bes a g f |
  e=16 f g a bes c d e | f g a bes c d e f='' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} fM!4 fM8 | g bes@M!4 besM8 | c=8 c7!4 c78 |
{{ end }}

{{ define "lh2" }}
  {{ .a }} cM!4 cM8 | c d@m!4 dm8 | b=,8 g@7!4 g78 |
{{ end }}

{{ define "lh3" }}
  bes=,8 g@m!4 gm8 | c f@M!4 fM8 | c=8 c7!4 c78 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key f \major
  \time 2/4
  \repeat volta 2 { {{ template "rh3" (w `c'='16\mf` `_ \aLeg`) }} | }

  \keyCancelBarChange
  \key c \major
  {{ template "rh1" (w `e'='''16\f`) }}
  c=''16 d e f g c d e | c-> b a g f e d c |
  a'=''16-> g f e d c b a | d-> c b a g f e d |
  c='16->\> d e f fis g c \af 16\! d |
  {{ template "rh1" (w `e=''16\p`) }}
  cis='16 d e f g cis d e | f e d c b a g f |
  e='16 f g a b cis d e | \rep 7 { d=''16 e d e='' } %
  d=''16 c b a | g\p a_\dCre g a \rep 6 { g='16 a g a=' } g f e d |
  {{ template "rh2" (w `c='16`) }}
  {{ template "rh2" (w `c=''16\f`) }}
  c='''16\f d c bes a g f e | d c bes a g f e d |
  c='16_\dDim d c d \rep 3 { c='16 d c d=' } \bar "||"

  \key f \major
  {{ template "rh3" (w `c='16\p` ``) }}
  {{ template "rh4" (w `g=''16->\mf`) }}
  {{ template "rh4" (w `g=''16`) }}
  e=''16\< f g a bes c d \af 16\! e | f-> e d c bes a g f |
  g=''16 f e d c\> bes a g | f e d c bes a g \af 16\! f |
  e=16\p\< f g a bes c d e | f g a bes c d e \af 16\! f |
  g=''4\mf r | <g,,= bes e> r | <f= a f'>4 r | R2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  {{ template "lh1" (w `f,=,8-\stBass`) }} | f, fM!4 fM8 |
  {{ template "lh1" (w `f=,8`) }} | f,=,[ fM! fM] r |

  \key c \major
  {{ template "lh2" (w `c'=8`) }} | c cM!4 cM8 |
  a=,8 am!4 am8 | f d@m!4 dm8 | g g7!4 g78 | c cM!4 cM8 |
  {{ template "lh2" (w `c=8`) }} | a a7!4 a78 | d dm!4 dm8 | g, a@M!4 aM8 |
  f=,8 d@m!4 dm8 | d@m![ dm8] dm dm | fis d@7!4 d78 | d@7![ d78] d74 |
  g=,8 c@M!4 cM8 | g f@M!4 fM8 | g e@m!4 em8 | g g7!4 g78 |
  \rep 2 { c=8 cM!4 cM8 | c= g@7!4 g78 | }
  c+c7!4. r8 | R2 | r4 bes+c@M! | a+am!4 g+c@7! |

  \key f \major
  {{ template "lh1" (w `f,=,8`) }} | f, fM!4 fM8 |
  {{ template "lh1" (w `f=,8`) }} | f,[ fM! fM] r |
  {{ template "lh3" }} | f, fM!4 fM8 |
  {{ template "lh3" }} | f+fM!4 r |
  c=8 c7!4 c78 | f@M!4 r4 | c8 c7!4 c78 | f+fM!4 r |
  bes+c@M!4 bes+cM4 | a+f@M!4 d+f@M!4 | bes+g@m!4 r4 |
  c=4 r | f+fM!4 r | R2 |
}
{{ end }}
