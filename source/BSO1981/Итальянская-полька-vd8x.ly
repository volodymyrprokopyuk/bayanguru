{{ define "rh1" }}
  a=''8) <d, f a>16( bes' a8)-. f-. | g-! <e g a>8-! 4-> |
  a=''8-! a16( bes a8)-. g-. | f-! <d='' f a>8-! 4-> |
{{ end }}

{{ define "rh2" }}
  \acc { d=''16 f } d'8-! d-! \acc { d,=''16 fis } d'8-! d-! |
  \acc { d,=''16 g } d'16( c bes a g8)-. bes='' |
{{ end }}

{{ define "rh3" }}
  {{ .a }} e d cis b a g fis | eis fis eis fis eis fis g a='') |
{{ end }}

{{ define "rh4" }}
  gis=''8-! a-! gis-! a-! | g16(-> e g a a'8) a,16-. a-. |
  <e='' gis>8-! a-! <e g>-!^\tAcc a-! | fis16( d fis a a'8) a,16-. a-. |
  d='''16( cis fis e d cis b a='' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key d \minor
  \time 2/4
  \partial 8 { \tuplet 3/2 { a'='16(\mp d f } | }
  \repeat volta 2 {
    {{ template "rh1" }} {{ template "rh2" }} | a=''8-! a-! a-! a-! |
    a=''16( g f e d) a( d f | {{ template "rh1" }} {{ template "rh2" }}
    a=''16(^\tRit gis a gis a bes b cis |
    <f,='' a d>4) r8 \tuplet 3/2 { fis=''16^\tTen a d } %
    \keyCancelBarChange \bar "||"

    \key d \major
    {{ template "rh3" (w `fis='''16(\pp^\tAcc`) }}
    b=''16( a g fis g fis e d | cis d e fis g a b cis=''') |
    \tempo Presto
    e='''16( d cis b a g fis e | dis e dis e dis e fis g) |
    a=''16( g fis e fis e d cis | d e fis g a b cis d) |
    {{ template "rh3" (w `fis='''16(\pp`) }}
    b=''16( a g fis g fis e d | cis d cis b cis) cis'( b a |
    gis=''16 a gis fis gis) d'( cis b | a b a gis a)^\tRit e'( d cis |
    b=''16\> a gis fis e d cis \af 16\! b=' |

    a='8) cis16( e a8)\f \tempo Allegretto a16-. a-. |

    {{ template "rh4" }} | cis='''8)-. <e, g>-! 16(-!^\tATem b' a g |
    cis='''8)-. <e, g>8-! 16( b' a g | b8)-. <d, fis>8-! 8-! a'16-.\f a-. |
    {{ template "rh4" }} | cis='''16 b ais b a g b e,) |
    f=''16( g gis a ais b c cis | d8) <d,='' fis d'>16-. 16-. %
    \keyCancelBarChange \fine \bar "!!"

    \key d \minor
    \tuplet 3/2 { a='16[ d f=''] } %
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  \partial 8 { r8 | }
  d=8-\stBass dm! a d@m! | cis8 a@7! a74 |
}
{{ end }}
