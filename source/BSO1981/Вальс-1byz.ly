{{ define "rh1" }}
  r4 \acc { {{ .a }} } e'='''4-. b8( d) | c4-. b8( a) g4-. |
  r4 \acc { b,='8 } a'4-. \acc { a=''8 } b,='4-. |
{{ end }}

{{ define "rh2" }}
  {{ .a }} e {{ .b }} e e e e | \rep 2 { d=''8 e e c' b=''4 | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key c \major
  \time 3/4
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      {{ template "rh1" (w `e''=''8`) }} | a'=''4-. g8( e) c=''4-. |
      {{ template "rh1" (w `e=''8`) }}
      \alternative {
        \volta 1 { c=''4 <c='' e g c> r | }
        \volta 2 { c=''4 r r \fine \bar "||" }
      }
    }

    \volta 2
    {{ template "rh2" (w `e=''8\p` `_ \aSta`) }} | c,=''8 e a c e4 |
    {{ template "rh2" (w `e,=''8` ``) }} | a=''8 e c b a4 |
    {{ template "rh2" (w `e'=''8\p` ``) }} | c,=''8 e a c e4 |
    {{ template "rh2" (w `e,=''8` ``) }} | a=''4 r r \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=4-\stBass cM! cM | c cM! cM | g g7! g7 |
  \rep 3 { c=4 cM! cM | } | g g7! g7 | c= cM! cM | c+cM! r r |

  \rep 3 { e=4 e7! a@m! | \rep 2 { e=4 eM! e7! | } | a,=, am! am | }
  e'=4 e7! a@m! | \rep 2 { e=4 eM! e7! | } | a+am! r r |
}
{{ end }}
