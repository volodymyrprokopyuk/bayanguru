{{ define "rh1" }}
  \acc { {{ .a }} d e } {{ .b }} c-. d-. bes-. | c a g f |
  g='16 a bes g a f g e=' |
{{ end }}

{{ define "rh2" }}
  {{ .a }} e ees d des c b bes | a8. c16 bes a g f |
  g='16 a bes g a f g e=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key d \minor
  \time 2/4
  \repeat segno 2 {
    \partial 8. { a'='16(\mp \acc { c=''8 } bes16 a) | }
    \repeat volta 2 {
      a='4(\< d8. \af 16\! e16 | f4~ f16) f( e f |
      g=''8) f e d | \af 8.\! <g, cis>4~\> %
      16\< a='16( \acc { c=''8 } bes16 \af 16\! a) |
      a='4( cis8. d16 | e4~ e16) f e d |
      cis=''16\< b a \af 16\! b cis d e f |
      \alternative {
        \volta 1 {
          \af 8.\! <f,=' d'>4~\> 16 a='16( \acc { c=''8 } bes16 a=') |
        }
        \volta 2 { <f=' d'>4 <f=' a d>8 r | }
      }
    }

    \repeat volta 2 {
      {{ template "rh1" (w `c'=''16` `f=''8-.\f`) }} | <e c'>8 r <c' e> r |
      {{ template "rh1" (w `c=''16` `f=''8-.`) }} | f8 r <f=' a c f>4 |
    }

    {{ template "rh2" (w `f'=''16`) }} | <e c'>8 r <c' e> r |
    {{ template "rh2" (w `f=''16`) }} | f8 r <f=' a c f>16 \bar "|."
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  \partial 8. { r8. | }
  d=8-\stBass dm! f, d@m | d'8 dm! d dm | d dm! d dm | a aM! a aM |
  \rep 2 { a=,8 a7! e'= a@7 | }
  a,=,8 a7! a a7 | d dm! dm r | d dm! d= r |

  f,=,8 fM! bes besM! | f fM! f fM | c' cM! c cM | c cM! c r |
  f,=,8 fM! bes besM! | f fM! a f@M | c8 cM! c cM | f@M! r8 f,=,4 |

  \rep 2 { f=,8 fM! f=, fM | } c' cM! c cM | c g c4 |
  \rep 2 { f,=,8 fM! f=, fM | } c' cM! c c7! | f,=, r f+fM!16 %
}
{{ end }}
