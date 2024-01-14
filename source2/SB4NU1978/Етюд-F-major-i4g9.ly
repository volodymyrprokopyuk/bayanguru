{{ define "rh1" }}
  {{ .a }} bes b c d c e \af 16\! f g\> f a g f e d \af 16\! c=' |
{{ end }}

{{ define "rh2" }}
  {{ .a }} des d ees e f fis g aes a bes b c des d ees='' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro molto"
  \clef treble
  \key f \major
  \time 4/4
  \repeat volta 2 {
    {{ template "rh1" (w `a=16\pp\<_\aSta`) }}
    {{ template "rh1" (w `a=16\<`) }}
    bes=16\< c e g b c g c, bes c e g b c g \af 16\! c, |
    a=16\> c f a b c gis a e f b, c a c bes \af 16\! d |
    \rep 2 { {{ template "rh1" (w `a=16\<`) }} | }
    ais=16\< b cis d fis g ais b cis d fis g ais b cis \af 16\! d |
    e='''16\> f d b g f d b c c' c, \af 16\! c,=' r4 |
  }

  \repeat volta 2 {
    c''='''16\mf des d ees des c bes aes g aes c bes aes g f ees |
    des=''16 c bes aes g f ees d f ees g bes des ees g bes |
    des='''16 bes bes g g ees ees des des bes bes g g ees ees des |
    {{ template "rh2" (w `c='16`) }}
    e=''16 f fis g aes a bes b c des d ees e c d e |
    f='''16 e d c bes a g f e f b, c gis a e f |
    d''='''16 c bes a g f e d cis d a bes fis g d g |
    {{ template "rh2" (w `c,='16`) }}
    e=''16 f fis g gis a bes b c des d ees e c d e |
    f='''16 c a f c a f f' f,='8 r r4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  f,=,8-\stBass r fM! r \rep 3 { f=,8 r fM r } |
  c'=8 r c7! r c r c7 r | f, r fM! r r2 |
  f=,8 r fM! r \rep 3 { f=,8 r fM r } |
  g=,8 r g7! r g r g7 r | g r g7 r c+cM! r c= r |

  aes=,8 r aesM! r aes r aesM r | bes r ees@7! r8 bes r ees@7 r8 |
  ees=8 r ees7! r ees r ees7 r | aes, r aesM! r aes r aesM r |
  g=,8 r c@7! r8 c r c7 r | a r f@M! r8 a r f@M r8 |
  bes=,8 r g@m! r8 bes r g@m! r8 | c r f@M! r8 c r f@M r8 |
  c=8 r c7! r c r c7 r | f, r fM! r f=, r r4 |
}
{{ end }}
