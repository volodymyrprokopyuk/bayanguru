{{ define "t4" }}
  \tuplet 3/2 { {{ .a }} } \tuplet 3/2 { {{ .b }} } %
  \tuplet 3/2 { {{ .c }} } \tuplet 3/2 { {{ .d }} } |
{{ end }}

{{ define "t3" }}
  \tuplet 3/2 { {{ .a }} } \tuplet 3/2 { {{ .b }} } %
  \tuplet 3/2 { {{ .c }} } {{ .d }} |
{{ end }}

{{ define "rh1" }}
  {{ template "t4" (w .a `b-. ais-. b-.` `c( d) c-.` `a-. gis-. a='-.`) }}
{{ end }}

{{ define "rh2" }}
  {{ template "t4" (w .a `b g' fis` `e c b` `c fis c=''`) }}
{{ end }}

{{ define "rh3" }}
  {{ template "t4" (w .a `b-. g'-. fis-.` `e( c) b-.` `c-. fis-. c=''-.`) }}
{{ end }}

{{ define "rh4" }}
  {{ template "t4" (w .a `b(-> ais) b-.` `c(-> d) c-.` `a(-> gis) a='-.`) }}
{{ end }}

{{ define "rh5" }}
  {{ template "t4" (w .a `b ais b` `c d c` `a gis a='`) }}
{{ end }}

{{ define "t1" }}
  \tuplet 3/2 {
    \set stemRightBeamCount = #2 {{ .a }}
    \set stemLeftBeamCount = #1
    \set stemRightBeamCount = #1 r16
    \set stemLeftBeamCount = #2 {{ .b }}
  }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key g \major
  \time 2/4
  \meter 1/8 1,1,1,1
  \repeat volta 2 {
    {{ template "rh1" (w `d''=''16(\f e) d-.`) }}
    {{ template "t4" (w `b='16( c) b-.` `g-. fis-. g-.`
       `a( b) a-.` `fis-. e-. d-.`) }}
    {{ template "rh1" (w `d'=''16( e) d-.`) }}
    {{ template "t3" (w `b='16( c) b-.` `g-. fis-. g-.`
       `a( e) fis-.` `g='8`) }}
  }

  {{ template "rh2" (w `b='16\(\p ais_\aDol b`) }}
  {{ template "t4" (w `b='16 ais b` `b a' b,`
     `g' b, fis'` `e d c\)`) }}
  {{ template "rh2" (w `b='16\( ais b`) }}
  {{ template "t3" (w `b='16 ais b` `b a' b,`
     `g' b, fis'` `e=''8\)`) }}

  {{ template "rh3" (w `b='16( ais) b-.`) }}
  {{ template "t4" (w `b='16( ais) b-.` `b-. a'-. b,-.`
     `g'-. b,-. fis'-.` `e-. d-. c-.`) }}
  {{ template "rh3" (w `b='16( ais) b-.`) }}
  {{ template "t3" (w `b='16( ais) b-.` `b-. a'-. b,-.`
     `g'-. b,-. fis'-.` `e=''8`) }}

  {{ template "rh4" (w `d=''16(->\f e) d-.`) }}
  {{ template "t4" (w `b='16(-> c) b-.` `g(-> fis) g-.`
     `a(-> b) a-.` `fis(-> e) d-.`) }}
  {{ template "rh4" (w `d'=''16(-> e) d-.`) }}
  {{ template "t3" (w `b='16(-> c) b-.` `g(-> fis) g-.`
     `a(-> e) fis-.` `g='8`) }}

  {{ template "rh5" (w `d'=''16\(\p e_\dCre d`) }}
  {{ template "t4" (w `b='16 c b` `g fis g`
     `a b a` `fis e d\)`) }}
  {{ template "rh5" (w `d'=''16\( e d`) }}
  {{ template "t3" (w `b='16 c\) b-.` `g-. fis-. g-.`
     `a(-> e) fis-.` `g='8->`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g+gM!8-\stBass e+em! a+am! d+d7! | \rep 2 { g+gM!8 e+em! a+am! d+d7! | }
  g+gM!8 e+em! {{ template "t1" (w `a+am!16[` `d@7!]`) }} g+gM!8 |

  \rep 2 {
    e=8 em! a, am! | b b7! e+em! r | e em! a, am! |
    b=,8 b7! {{ template "t1" (w `e+em!16[` `b@7!]`) }} e+em!8 |
  }

  \rep 2 {
    \rep 3 { g+gM!8 e+em! a+am! d+d7! | }
    g+gM!8 e+em! {{ template "t1" (w `a+am!16[` `d+d7!]`) }} g+gM!8 |
  }
}
{{ end }}
