{{ define "rh1" }}
  r8 {{ .a }} fis e b e | d2 c4 | b4. a8 g fis | b='2.\) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} em! em | e a@m! am4 | dis b@7! b74 | e= em! em |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Tempo di valse"
  \clef treble
  \key g \major
  \time 3/4
  \repeat segno 2 {
    \volta 1
    r8 d''=''8(\mf e fis g e | d2 c4) | r8 d( e fis a fis | e2 d4) |
    r8 g,='8\(\< a b d \af 8\! b | d4.\> c8 d c | b4. a8 d e | \af 2.\! b2.\) |
    r8 d=''8(\mf e fis g e | d2 c4) | r8 fis8(\< g a b \af 8\! g | fis2\f e4) |
    r8 c=''8\(\p d ees g ees | d4. b8 a g | e4.\> g8 e fis |
    \af 2.\! g='2.\) \fine \bar "||"

    \volta 2
    {{ template "rh1" (w `g'=''8\(\f`) }}
    r8 e,='8(\mf fis g fis e | fis2 cis4) | r8 c(\p d e d c | e2 b4) |
    {{ template "rh1" (w `g''=''8\(\f`) }}
    r8 fis='8(\mf b cis d b | e4.\< fis8 d cis |
    b='4.) d8(^\tAcc ais cis | b4.) d8( ais \af 8\! cis |
    b='4.)\> d8( ais \af 8\! cis | b\<^\tRit d ais b c \af 8\! cis='') \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g,=,4-\stBass gM! gM | a c@M! cM4 | d d7! d7 | g, gM! gM |
  e'=4 em! em | a, am! am | d d7! d7 | g, gM! gM |
  g=,4 gM! gM | fis a@m! am4 | b b7! b7 | e em! em |
  c=4 cm! cm | d g@M! gM4 | d a@m! d@7!4 | g,=,4 gM! gM |

  {{ template "lh1" (w `e'=4`) }}
  e=4 em! em | e fis@M! fisM4 | e a@m! am4 | e em! em |
  {{ template "lh1" (w `e=4`) }}
  fis,=,4 b@m! bm4 | fis fis7! fis7 | \rep 3 { b=,4 bm! e@m! | } | b@m!4 r4 r |
}
{{ end }}
