{{ define "rh1" }}
  {{ .a }} a a8 g | fis4. a8 d=''4) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key d \major
  \time 3/4
  \meter 1/4 1,1,1
  {{ template "rh1" (w `a'='4(\mp`) }}
  {{ template "rh1" (w `a='4(`) }}
  cis=''8( d e d cis b | a4 d fis,) | cis'( b cis | d2 a4) |
  b='8( a g fis g b | a4 fis a) | g( fis e | d2 d='4) |

  \duo {
    a'='4(\mf a a8 g | fis4. a8 d4) | cis4( cis cis8 b | b4. a8 d4) |
    cis=''8( d e d cis b | a4 d fis,) | cis'( b cis | d2 a4) |
    b='8( a g fis g b | a4 fis a) | g( fis^\tRit e | d2)-- d='4-- \bar "|."
  } {
    fis'='4 fis fis8 e | d2 fis4 | a a a8 g | fis2. | g | fis2 d4 |
    e='2. | d2 fis4 | e2. | d | b4 a g | fis2--\> \af 4\! fis=4-- |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  \meter 1/4 1,1,1
  <d= a'>2.~-\frBass | 2. | 2.~ | 2. |
  \rep 2 { a'=4( a a8 g | fis4. a8 d='4) | }
  cis='8( d e d cis a | fis4 d' fis,) | cis'( b cis | d2 d,=4) |

  <a'=_~ cis>2. | <a d> | <a_~ e'> | <a d> |
  e'='4( cis a) | d( b a) | g( a g) | fis( a d) |
  a=4( cis a) | fis( a fis) | e( cis a) | d-- a-- d,=,-- |
}
{{ end }}
