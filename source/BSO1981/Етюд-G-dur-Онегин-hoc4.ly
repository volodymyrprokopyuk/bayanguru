{{ define "rh1" }}
  {{ .a }} a'16 g8. e'16 d8. a'16 g8. e16) |
  fis=''8.( g16 b8. d16 e4 \af 4\! d) |
  c='''8.(\> a16 e8. c16) a8. b16 c8. b='16 |
{{ end }}

{{ define "lh1" }}
  {{ .a }} gM! d' g@M! | g,4 gM! d' g@M! | a4 am! c= a@m! |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 4/4
  \repeat segno 2 {
    \volta 1
    {{ template "rh1" (w `d'='8.(\mf\<`) }}
    d=''8.( c16 a8. fis16 e4) fis8.( \af 16\! d16) |
    {{ template "rh1" (w `d='8.(\mf\<`) }}
    d=''8.( c16 e,8. fis16 \af 2\! g='2) \fine \bar "||"

    \volta 2
    fis='8[(\p a]) a-. r a-. r a-. r |
    a='4\< c8.( b16 d8. c16 b8. \af 16\! a16) |
    b='8[(\mp d]) d-. r d-. r d-. r |
    b='4\< d8.( e16 fis8. g16 a8. \af 16\! b16) |
    ais=''8[(\mf cis]) cis-. r cis-. r cis-. r |
    ais=''4\< cis8. d16 e8. d16 cis8. \af 16\! e16 |
    d='''8.\f cis16 b8. a16 g8. fis16 e8. d16 |
    c=''8.\> b16 a8. g16 fis8. e16 d8. \af 16\! c='16 \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  {{ template "lh1" (w `g,=,4-\stBass`) }} | fis,=,4 d@M! d'=4 dM! |
  {{ template "lh1" (w `g,=,4`) }} | fis,=,4 d@7! g=,4 gM! |

  d'=4( dM!8) r dM r dM r | d4( dM!) fis,( d@M!) |
  g=,4( gM!8) r gM r gM r | g4( gM!) d'( dM!) |
  fis,=,4( fis7!8) r fis7 r fis7 r | fis4( fis7!) ais=,( fis@7!) |
  b@m!4 r4 r2 | d+d7!2 r |
}
{{ end }}
