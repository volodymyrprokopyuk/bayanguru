{{ define "lh1" }}
  b=,8[ g@7! g78] g7 r r | c cM! cM cM r r | d=8[ g@7! g78] g7 r r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Andantino cantabile"
  \clef treble
  \key a \minor
  \time 6/8
  \repeat segno 2 {
    \volta 1
    \partial 4 { c''=''8\p d | }
    e=''4.~ e8 c f | e4.~ e8 b e, | d'4.( c4) d8 | e4.~ e8 c a |
    f'=''4.(\< f8) b, \af 8\! g | e'4.( e8) c a | d4.(\> c4) \af 8\! b8 |
    a='4. a='8 \fine \bar "!!" %

    \volta 2
    g='8--\mf a-- | g4.( d'8 b a) | g4.(_\dCre e'8 c a) |
    g='4.( f'8 d b) | c4.~ c8\> b \af 8\! a | g4.(\p d'8 b a) |
    g='4.( e'8 c a) | g4.(\< f'8 d \af 8\! b) |
    e=''4. <gis,=' e'>8\p \fermata \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  \partial 4 { r8 r | }
  a,=,8-\stBass am! am am r r | gis[ e@7! e78] e7 r r |
  e'=8 e7! e7 e7 r r | a, am! am am r r | d dm! dm g+g7! r r |
  c=8 cM! cM f+fM! r r | b[ d@m! dm8] e+e7! r r | a=, am! am am r r |

  {{ template "lh1" }}| e=8[ c@M! cM8] cM r r |
  {{ template "lh1" }}| c=8[ cM! cM] b=, \fermata %
}
{{ end }}
