{{ define "rh1" }}
  {{ .a }} fis e fis e fis e \af 16\! fis e\> fis g a b g fis \af 16\! e=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 4/4
  {{ template "rh1" (w `e'='16(\mf\<`) }}
  fis='16(\< g fis g fis g fis \af 16\! g fis\> b a g fis g fis \af 16\! g) |
  {{ template "rh1" (w `e='16(\<`) }}
  fis='16( g fis g fis gis ais fis b='8) r\> \af 4\! r4 |

  <g=' b e>4->\< \af 8.\! <a c e>-> <g b e>->\> \af 4\! r |
  <fis=' dis'>4->\< \af 8.\! <g e'>-> <fis dis'>->\> \af 4\! r |
  {{ template "rh1" (w `e='16(\<`) }}
  fis='16( g fis g fis g fis g e8) g16( b e=''8) r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  e@m!4-\stBass a@m!4 e@m!4 r4 | b@M!4 c@M!4 b@M!4 r4 |
  e+em!4 fis+a@m!4 e+em!4 r4 |
  fis+b@m!4 fis+fis7!4 b+bm!8 b,=,16-\puBass c b a g fis=, |

  e'=16_\aLeg fis e fis e fis e fis e fis g a b g fis e |
  b=,16 c b c b c b c b c b c b a g fis=, |
  e+em!4-\stBass fis+a@m!4 e+em!4 r4 | a+am! b+bM! e+em! r |
}
{{ end }}
