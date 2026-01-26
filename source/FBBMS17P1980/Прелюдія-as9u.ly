{{ define "rh1a" }}
  {{ .a }} a a( \af 32\! cis) eis, a a( cis) |
  fis,='16 a a( d) gis,\> b b( \af 32\! e='') |
{{ end }}

{{ define "rh2" }}
  \duo { d''=''16(\> cis) cis( fis,) cis'( b) {{ .a }} | }
  { e'='8[ r d='] r | }
{{ end }}

{{ define "lh1" }}
  {{ .a }} a cis a | d b d e,= |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \major
  \time 2/4
  \repeat volta 2 {
    \duo {
      {{ template "rh1a" (w `e'='16\p\<`) }}
      {{ template "rh1a" (w `e,='16\<`) }}
      fis=''16(\mf e) e( a,) e'( d) d( a) |
    } { \rep 2 { e'='4 eis | fis gis=' | } | g='8[ r fis='] r | }
    \alternative {
      \volta 1 {
        {{ template "rh2" (w `b='16( \af 32\! fis)`) }}
        d''=''16(_\dDim cis) cis( fis,) cis'( b) b( eis,) |
        b'='16( a) a( fis) gis( a gis fis=') |
      }
      \volta 2 {
        {{ template "rh2" (w `a='16( \af 32\! f)`) }}
      }
    }
  }
  \duo { e'='16(\< a) a( d) cis8. \af 32\! b='16 | } { e'='4 <d=' gis> | }
  <cis=' e a>4\> \af 4\! r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \major
  {{ template "lh1" (w `cis'='8-\frBass`) }}
  {{ template "lh1" (w `cis'='8`) }}
  cis'='8[-- r d]-- r | ais[-- r b]-- r |
  <a= d>8[-- r <gis d'>]-- r | <a d>[-- r <b d>]-- r |
  ais=8[-- r b]-- r | cis-- e,-- r e-- | r4 a=4-- |
}
{{ end }}
