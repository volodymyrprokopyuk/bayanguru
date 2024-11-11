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
}
{{ end }}
