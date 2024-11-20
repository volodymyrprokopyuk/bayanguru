{{ define "rh1" }}
  {{ .a }} d-. d( b) g-. g-. g( g') | e-. e-. e( c) a-. a-. a( e') |
  d=''16-. d-. d( b) c-. c-. c( a) | g-. g-. g-. b-. {{ .b }} r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key g \major
  \time 2/4
  \repeat segno 2 {
    \volta 1
    {{ template "rh1" (w `d''=''16-.\p` `<fis=' d'>8`) }}
    {{ template "rh1" (w `d'=''16-.` `g='8`) }} \fine \bar "||"

    \volta 2
    fis='16-.\p\< fis-. fis-. fis-. fis( gis ais b |
    cis=''16) cis-. cis-. cis-. cis( d e \af 16\! g |
    fis=''16) fis-. fis-. fis-. fis( e d cis |
    b='16)\> b b( d \af 4\! fis,='4) -- |
    a='16-.\mf a-. a-. a-. a( b cis d |
    e=''16)\< e-. e-. e-. e( fis g \af 16\! b |
    a=''16) a-. a-. a-. a( g fis e |
    d=''16)\>^\tRit d d( d \af 4\! d=''4)-- \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g,=,4-\stBass gM!8 r | c4 a@m!8 r8 | d g@M! d8 dM! | g, gM! d'16-. c-. b-. a-. |
  g=,4 g7!8 r | c4 a@m!8 r8 | d g@M! d8 d7! | g,=,4 gM!8 r |

  b=,4 bm!8 r | b4 e@m!8 r8 | ais4 fis@7!8 r8 | b4 bm!8 r | d4 dM!8 r |
  g,=,4 e@m!8 r8 | a4 a7!8 r | d=8( c@M! d@7!4) |
}
{{ end }}
