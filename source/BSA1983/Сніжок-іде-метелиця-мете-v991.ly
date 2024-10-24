{{ define "rh1" }}
  {{ .a }} f e d | c c d b) | c( c b gis=') |
{{ end }}

{{ define "lh1" }}
  d=8 dm! f d@m! | e8 a@m! d8 dm! | e a@m! e8 e7! | a,=, am! %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 2/4
  \meter 1/2 #'(1)
  a'='8(\mf e')-. e-. e-. | e( f) d-. d-. | g-- g-- g-- a-- | e4( a) |
  {{ template "rh1" (w `g=''8(`) }} | a='4-- a'-- |
  {{ template "rh1" (w `g=''8(\mp`) }} | a='4 a=' \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,8-\stBass am! c a@m! | d8 dm! f d@m! | g,8 g7! b g@7! | c8 cM! cis a@7! |
  {{ template "lh1" }} c=8-- cis-- | {{ template "lh1" }} am4 |
}
{{ end }}
