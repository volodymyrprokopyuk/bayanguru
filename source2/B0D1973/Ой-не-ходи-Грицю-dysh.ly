{{ define "rh1" }}
  {{ .a }} b8 c4 a | e' c b a\) |
  gis='4\( b e4. gis,8 | a2 {{ .b }} |
{{ end }}

{{ define "lh1" }}
  {{ .a }} am! am am | a am am am |
  e'=4 eM! eM eM | a, am! {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Lento
  \clef treble
  \key a \minor
  \time 4/4
  {{ template "rh1" (w `a'='4.\(\p` `a='\)`) }}
  {{ template "rh1" (w `a='4.\(` `b='\)`) }}

  \repeat volta 2 {
    c=''4.\( g8 c4 e | g2 f8 e d c\) |
    b='4\( d g f | e d c b\) |
    a='4.\( b8 c4 a | e' c d8 c b a\) |
    gis='4\( b e4. gis,8 |
    \alternative {
      \volta 1 { a='2 b='\) | }
      \volta 2 { \hSpace a='2 \sSlur bu #'() ( a='4) r \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `a,=,4-\stBass` `am am`) }}
  {{ template "lh1" (w `a=,4` `g=, gM!`) }}

  c=4 cM! cM cM | e c@M! cM4 cM |
  g,=,4 gM! gM gM | e' eM! eM eM |
  a,=,4 am! am am | a am! d dm! |
  e=4 eM! eM eM | a, am! g gM! | a=, r am! r |
}
{{ end }}
