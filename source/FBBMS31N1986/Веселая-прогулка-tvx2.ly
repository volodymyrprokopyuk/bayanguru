{{ define "rh1" }}
  \duo { c''=''4. | } { a'='4( g='8) | }
{{ end }}

{{ define "lh1" }}
  b=,8 e@m! g8 e@m! | a8 am! e' a@m! | d8 d7! a d@7! | g8[ gM! gM] %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro moderato"
  \clef treble
  \key g \major
  \time 2/4
  \partial 8 { b'='16( a \bar "||" }
  \repeat segno 2 {
    g='8)-> d g b | e-> d4 c16( b | a8)-> c b a | b-> g4 b16( a |
    g='8)-> d g b | e-> d4 d16( e | d8) a d16( e c8) | b4. b16( c |
    b='8)-> e, b' \acc { d=''8 } c | b-> a4 a16( b |
    a='8)-> d, a' \acc { c=''8 } b | a(-> g4) a8 | g e g a |
    g='8 a b c | d d, d' e,=' \bar "||"

    \alternative {
      \volta 1 {
        d'=''8^\tRit fis, g a=' |

        <g=' b>8^\tATem <e' g>4 8~ | 8 {{ template "rh1" }} %
        <fis,=' a>8 <d' fis>4 <c e>8~ | 8 <b d>4 <a c>8 |
        <g=' b>16 fis <g b>8~ 8 e | <fis a>16 b <a c>8~ 8 <c e> |
        <a=' c fis>8 <b d g> <a c fis> <g b e> | <fis a d> <g b e> <fis=' a d>4 |

        <g=' b>8 <e' g>16( <dis fis> <e g>8) 8 | 8 {{ template "rh1" }} %
        <fis,=' a>8 <d' fis>4 <c e>8~ | 8 <b d>4 <a c>8 |
        <g=' b>16 fis <g b>8~ 8 <e' g> | <a, c>16 b <a c>8~ 8 <fis' a> |
        <d='' fis>8 <c e> <b d> <c e> | <b d> <a c>4 b16( a=' \bar "||"
      }
      \volta 2 { \section \sectionLabel "Coda" }
    }
  }

  d=''16)_\dDim g, b8 e d | g16 b, d8 a' g | \rep 2 { b=''16 d, e d='' } |
  <d='' e g b>2\pp \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  \partial 8 { r8 | }
  g,=,8[ gM! gM] r | b[ g@M! gM8] r | c a@m! d8 d7! | g, gM! d' r |
  g,=,8 gM! b g@M! | d8[ g@M! gM8] r | a d@7! d8 d7! | g, gM! fis b@7! |
  e=,8 e7! gis e@7! | a8[ am! am] r | d d7! fis, d@7! | g8[ gM! gM] r |
  a=,8 am! d d7! | g, a b c | d d d d |d d d c= |

  {{ template "lh1" }} r8 |
  e'=8 em! dis d | c a@m! e8 a@m! | d8 d d d | d d d  c |
  {{ template "lh1" }} fis=,8 |
  e=,8 em! b' e@m! | a8 am! e' a@m! | d8 d7! a d@7! | d8 e fis= r |

  \rep 3 { g,=,8 d' g, d'= | } | g, g g=,4 \fermata |
}
{{ end }}
