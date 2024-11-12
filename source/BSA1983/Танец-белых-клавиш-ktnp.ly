{{ define "rh1" }}
  {{ .a }} g-. e-. c-. d-. f4-- e8-. | d-. f-. a-. d-. g,4.-- b='8-. |
{{ end }}

{{ define "rh2" }}
  {{ .a }} 8-. 8(-> g) <c e>8-. 8-. 8(-> \af 8\! g=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegretto grazioso"
  \clef treble
  \key c \major
  \time 4/4
  \partial 8 { b'='8-.\mf | }
  \repeat volta 2 {
    {{ template "rh1" (w `c=''8-.`) }}
    c=''8-. g-. e-. c-. f-. a-. c-. f-. |
    \alternative {
      \volta 1 { <c='' e>8( a) <b d>( a) <b d>( g)-. a-. b='-. | }
      \volta 2 { <c='' e>8( g) <b d>( g) <e=' c'>4. r8 | }
    }
  }

  {{ template "rh2" (w `<b'=' d>8-.\p\<`) }}
  <d'='' f>8-.\mf 8-. 8(-> g) <c, e>2-- |
  <b=' d>8-.\p 8-. 8(-> e,) <a c>8-. 8-. 8(-> e) |
  <a=' c>8-. 8-. 8(-> d) <g, b>2-- |
  {{ template "rh2" (w `<b=' d>8-.\mf\<`) }}
  <d'='' f>8-. 8-. 8(-> a') <c, e c'>2-- |
  r8\f c,='8[-- r d]-- r e[-- r f]-- |
  r8\>^\tRit g='8[-- r a]-- r b[~-> \af 8\! b] \fermata b='-. |

  {{ template "rh1" (w `c=''8-.\p^\tATem`) }}
  e=''8-._\dCre c-. g-. e-. f'-. c-. a-. f-. |
  g'=''8-. e-. c-. g-. a'-. f-. c-. a-. |
  g'=''8(\f e) c'-. b-. a g f d | c_\dDim b a g f e d b |
  \rep 2 { c='8 g e' d=' } | r8 g='8 e' d c g e' d |
  r8^\tRit g=''8 e' d <e,='' c'>4. \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \partial 8 { r8 | }
  c=4-\stBass cM! f, d@m! | g4 g7! b g@7! | a4 am! a f@M! |
  d=4 f@M! d+g@7!8 r8 r4 | g+c@M! g+g7!4 c8[ g] c= r |

  \rep 2 { r4 g+g7! r g+a@m! | } | r4 e+d7! r a+am! |
  r4 d+d7! g=,4 gM! | r g+g7!8 g+g7 r4 g+a@m!8[ g+am8] |
  r4 g+g7!8 g+g7! a4 am! | c-- d-- e-- f-- |
  g,=,4-- a-- b8-- r g@7!-\fermata r8 |

  e=4 c@M! f,4 d@m! | g4 g7! b g@7! | c4 cM! a f@M! |
  e'=4 c@M! f,4 d@m! | \rep 2 { g+c@M!8[ g+cM8] r4 r g+d@m!8 r8 | }
  \rep 4 { g=,8-- r c@M![ d@m!8] } |
  g=,8 r d@m![ g@7!8] c@M!4.-\fermata %
}
{{ end }}
