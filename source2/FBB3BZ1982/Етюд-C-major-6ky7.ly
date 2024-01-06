{{ define "rh1" }}
  {{ .a }} a='16( b c8)-. {{ .b }} a-. d16( e f e d c b a=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Moderato"
  \clef treble
  \key c \major
  \time 4/4
  \meter 1/4 1,1,1,1
  \repeat volta 2 {
    r8\mf g'='8 \rep 3 { <c='' e g>( g=') } | r8 g \rep 3 { <c='' e g>( g=') } |
    <d'='' f>8( <c e>) \rep 3 { <b=' d>( <a=' c>) } | <c='' e g>2~ 2 |
  }

  \repeat volta 2 {
    {{ template "rh1" (w `r8\p` ``) }} | r8 g16( a b8)-. d-. c16( d e f e d c b) |
    {{ template "rh1" (w `r8\<` `\af 16.\!`) }}
    \alternative {
      \volta 1 { r8 g='16( a b8)-. d-. c=''2 | }
      \volta 2 { r8 g='16( a b8)-. g-. c=''4-- r \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \meter 1/4 1,1,1,1
  <g= c e>8-\frBass \rep 15 { <g= c e> } |
  \rep 4 { <f= a d>8 } \rep 4 { <g= b d> } |
  \rep 2 { c,=8 \rep 3 { <g'= c e> } } |

  \rep 4 { <e= a c>8 } <f a d>-- r r4 |
  \rep 4 { <g= b d>8 } <g c e>-- r r4 |
  \rep 4 { <e= a c>8 } <f a d>-- r r4 |
  <g= b d>8-- r r8 8 \rep 4 { <g c e> } |
  <g= b d>8 r r8 8 <g= c e>4-- r |
}
{{ end }}
