{{ define "rh1" }}
  d=''4-- f-- | f8(-> e)-. e16( f e8)-. |
  e=''8(-> d)-. d16( e d=''8)-. |
{{ end }}

{{ define "lh1" }}
  {{ .a }} cM! g g7! | c cM! c cM |
  g=,8 g7! g g7 | c cM! {{ .b }} |
{{ end }}

{{ define "lh2" }}
  g=,8 g7! g g7 | c cM! c cM |
  g=,8 g7! g g7 | c cM! {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 2/4
  c''=''16(\mf d e8)-. d16( e f8)-. | g8-. g-. e4-- |
  f=''8-. f-. d4-- | e8-. e-. c4-- |
  c=''16( d e8)-. d16( e f8)-. | g8-. g-. e4-- |
  f=''8-. f16( e d8) e16( d | c8) e-. c='' r |

  {{ template "rh1" }} | d8(-> c)-. c16( d c8)-. |
  {{ template "rh1" }} | c-. e-. c='' r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  {{ template "lh1" (w `c=8-\stBass` `c= cM`) }}
  {{ template "lh1" (w `c=8` `c= r`) }}

  {{ template "lh2" (w `c=8 cM`) }}
  {{ template "lh2" (w `c=8 r`) }}
}
{{ end }}
