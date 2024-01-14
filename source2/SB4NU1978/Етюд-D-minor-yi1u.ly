{{ define "rh1" }}
  {{ .a }} f d f' d a f a' f d a d' a f {{ .b }} d='' |
{{ end }}

{{ define "lh1" }}
  r16 {{ .a }}[ {{ .b }} {{ .b }}] {{ .b }} r16 r8 %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro moderato"
  \clef treble
  \key d \minor
  \time 4/4
  \repeat segno 2 {
    {{ template "rh1" (w `d''=''16\mp\< a_\aLeg` ` \af 16\!`) }}
    e'='''16 bes g e d' bes g d c'\> g e c bes' g e \af 16\! bes |
    a'=''16 f d a f' d a f e' bes g e d' bes f d |
    \duo { a'='4\< \af 4\! bes d\> \af 4\! cis='' | }
    { a'='16 e cis e bes' f d f d' a g f cis' bes a g=' | }
    {{ template "rh1" (w `d'=''16\mp\< a` ` \af 16\!`) }}
    e'='''16\mf bes g e d' bes g d c' a e c a' f c a |
    cis'='''16\p bes f cis bes' f cis bes a' f d a g' d bes g |
    f'=''16 d bes a e' cis bes a d a f e d='4 \bar "||"

    \alternative {
      \volta 1 {
        c='16\p e_\dCre g c cis, e g cis d, g bes d e, g bes e |
        e,='16 a c e f, a c f g, a c g' f, a c f |
        d,='16 fis a d dis, fis a dis e, a c e fis, a c fis |
        fis,='16 bes d fis g, bes d g a, bes d a' g, bes d g |
        \duo { bes'='4 a bes c | d f g g='' | }
        {
          bes'='16 des f bes a, des f a bes, d g bes c, d g c |
          d,=''16 f bes d f, bes d f g, b d g g, c ees g=''' |
        }
        bes,='16 des f bes a, des f a g, bes des g f, bes des f |
        \duo {
          r16\f \rep 12 { <des''='' f a>16 } %
          <des='' f>16\> 16 \af 16\! 16 \bar "||"
        } { a'='1 | }
      }

      \volta 2 { \section \sectionLabel "Coda" } %
    }
  }

  {{ template "rh1" (w `d=''16 a` ``) }}
  cis'='''16 a e cis a' e cis a e' cis a e cis' a e cis |
  c='16( f a c) f,( a c f) c,( d f c') cis,( e g cis) |
  <d,=' f a d>4~ 8 r r2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  d=8(-\stBass dm!)-. r4 f,8( d@m)-. r4 | g8( gm!)-. r4 e8( g@m)-. r4 |
  f=,8( d@m!)-. r4 r8 g(  \noBeam gis) r | \rep 4 { r a } |
  d=8( dm!)-. dm-. r f,[( d@m!)-. dm8]-. r |
  c'=8( c7!)-. c7-. r f,( fM!)-. fM-. r |
  bes=,8( besm!) besm-. r d( dm!)-. g@m! r8 | r a r a r d@m! r8 d= |

  {{ template "lh1" (w `c+c7!16` `c+c716`) }}
  {{ template "lh1" (w `e+c@7!16` `e+c716`) }} |
  {{ template "lh1" (w `f+fM!16` `f+fM16`) }}
  {{ template "lh1" (w `a+f@M!16` `a+fM16`) }} |
  {{ template "lh1" (w `d+dM!16` `d+dM16`) }}
  {{ template "lh1" (w `fis+d@7!16` `fis+d716`) }} |
  {{ template "lh1" (w `g+gm!16` `g+gm16`) }}
  {{ template "lh1" (w `bes+g@m!16` `bes+gm16`) }} |
  {{ template "lh1" (w `ees=16` `ees16`) }}
  {{ template "lh1" (w `e=16` `e16`) }} |
  {{ template "lh1" (w `f+bes@M!16` `f+besM16`) }}
  r16 f+g@M![ f+gM16 f+gM] f+c@m! r16 r8 |
  \rep 2 { {{ template "lh1" (w `bes=,16` `bes16`) }} } |
  r16 b=,16 b b b bes bes bes bes a a a a b bes a=, |

  \rep 2 { {{ template "lh1" (w `d=16` `d16`) }} } |
  \rep 2 { {{ template "lh1" (w `bes=,16` `bes16`) }} } |
  r8 a=,8-- r a-- r gis-- r a-- | d+dm!4~ d+dm8 r d=4 r |
}
{{ end }}
