{{ define "rh1" }}
  <bes,= d g>8\< bes' <g, c ees> \af 16.\! a' <fis,= c' d>4~\> 8) \noBeam \af 8\! %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Andante cantabile"
  \clef treble
  \key g \minor
  \time 4/4
  \meter 1/4 1,1,1,1
  \partial 8 { bes'='8(\mp | }
  \repeat segno 2 {
    \volta 1
    {{ template "rh1" }} bes'='8( | {{ template "rh1" }} d''( |
    <d,=' f bes>8\< d' <bes, ees g> \af 16.\! c' %
    <a,= ees' f>4~\> 8) \noBeam \af 8\! d'( |
    <d,=' f bes>8\< d' <bes, ees g> c' <a, ees' f> \af 16.\! a' %
    <fis,= c' d>8)\> \af 8\! bes'='8( |
    \rep 2 { <bes,= d g>8\< \af 16.\! bes' <g, cis>)\> \af 16.\! bes'='( } %
    <bes,= d g>8)\>^\tRit bes'( <a, c fis>) \af 8\! a'( <bes,= d g>4~\p 8) r \fine |

    \volta 2
    \keyCancelBarChange
    \key d \minor
    \repeat volta 2 {
      \tempo "Più mosso"
      f'='16(\mf\< e f d g f e \af 16\! d a'4. <e g>8) |
      f='16( e f d g f e d <a' c>4.\< \af 8\! <fis a>8) |
      bes='16( a bes d c8.) bes16( a\> gis a c bes8.) \af 16\! a16( |
      \alternative {
        \volta 1 {
          g='16\< fis g e) bes'( a bes g) %
          d'=''16( cis d \af 32.\! e cis8\> \af 8\! a=') |
        }
        \volta 2 {
          g='16(\< f ees f g ees g \af 32.\! bes) %
          a='16(\> g fis g \af 8\! <fis a>8) \noBeam bes=' \bar "||"
        }
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  \partial 8 { r8 | }
  g,=,4(-\frBass a) r8 a( d,) r | g4( a) r8 a8( d,) r |
  bes'=,4( c) r8 c( f,) r | bes4( c) r8 c( d) r |
  g,=,4( ees) g( ees'8) r | d4( d,) r8 d'8( g=) r |

  \keyCancelBarChange
  \key d \minor
  d=4( e f16 e f d cis b cis a) | d4( e ees16 c a' g fis e fis d) |
  g=16( fis g f e d e c) f( e f ees d cis d c) |
  bes=,16( a bes g) d'( cis d bes) f'( e f g e8 cis) |
  bes=,16( aes g aes bes g bes ees) c( bes a bes c=8) r |
}
{{ end }}
