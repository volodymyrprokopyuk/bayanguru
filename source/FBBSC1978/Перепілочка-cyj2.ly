{{ define "rh1" }}
  {{ .a }} d g \af 8\! bes | a4\> \af 4\! g) |
  a='8(\< bes a \af 8\! a | \af 2\! g='2)\> |
{{ end }}

{{ define "rh2a" }}
  {{ .a }} d( g bes | a4) g8 g | a(\< bes) \af 4\! a4 | g=''2 |
{{ end }}

{{ define "rh2b" }}
  r8 {{ .a }} d4( | cis2) | c='' |
{{ end }}

{{ define "rh3a" }}
  \rep 2 { a=''4-> g8-- g=''-- | } a( bes) a=''4-- |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \minor
  \time 2/4
  {{ template "rh1" (w `d'='8(\mf\<`) }}
  {{ template "rh1" (w `d='8(\<`) }}
  a='4(\< g8 g | a4 g8 \af 8\! g) | a(\> bes a4 | g \af 4\! g) |
  a='4( g8 g | a4 g8 g) | a(\< bes a \af 8\! a | g4\> \af 4\! g=') |

  \duo {
    {{ template "rh2a" (w `d''=''8\f`) }}
    {{ template "rh2a" (w `d=''8`) }}
    {{ template "rh3a" }} | g~ g16( d fis g) |
    {{ template "rh3a" }} | g=''2 |
  } {
    {{ template "rh2b" (w `d''=''8~`) }} | bes8. r16 r4 |
    {{ template "rh2b" (w `d=''8~`) }} | bes4~ bes16 r r8 |
    \rep 2 { a='2 | a | d4( c) | bes='8. r16 r4 | }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
}
{{ end }}
