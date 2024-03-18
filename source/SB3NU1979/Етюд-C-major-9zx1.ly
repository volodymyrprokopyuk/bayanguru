{{ define "rh1" }}
  {{ .a }} g e' c g)-. r | dis( e c' g e)-. r |
  b='8( c g' e c)-. r | fis,( g e' c g=')-. r |
{{ end }}

{{ define "rh2" }}
  fis='8( g f' d g,)-. r | fis( g d' b g)-. r |
  fis='8[( g a b c d] | e[ f fis g a g='']) |
{{ end }}

{{ define "rh3" }}
  {{ .a }} | 2. | <a c d>2.~ | 2. |
  b='8[( c d e fis g]) | gis,[( a b c d e='']) |
{{ end }}

{{ define "lh1" }}
  b=,4 r g@7!8 r8 | g4 r g7!8 r |
  \rep 3 { c=4 r cM!8 r | g=,4 r c@M!8 r8 | }
{{ end }}

{{ define "lh2" }}
  g=,8-\puBass r d'( cis d c | b d c b a g |
  fis=,8) r a( gis a g | fis a g fis e d=, |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Tempo di valzer"
  \clef treble
  \key c \major
  \time 3/4
  \meter 1/4 #'(2 1)
  \repeat segno 2 {
    \volta 1
    {{ template "rh1" (w `fis''=''8(\mp`) }}
    {{ template "rh2" }}
    {{ template "rh1" (w `fis=''8(`) }}
    ais='8( b g' d b)-. r | cis( d b' g d)-. r |
    gis=''8[\( a e' d c b] | a[ g fis g a fis] |
    a=''8[ g fis g fis g] | a[ g fis g fis g]\) |
    {{ template "rh1" (w `fis=''8(`) }}
    {{ template "rh2" }}
    {{ template "rh1" (w `fis=''8(`) }}
    gis='8[\( a f' e d c] | ais[ b g' f d b] |
    d=''8[ c b c e g] | c='''4\) r r \fine \bar "||"

    \volta 2
    \key g \major
    {{ template "rh3" (w `<b,=' d>2.~\mf`) }}
    g,='8[( a b c cis d]) | e[( d cis d e d]) |
    {{ template "rh3" (w `<b=' d>2.~`) }}
    r8 cis,='8[( d e f fis] | g) r g[\( a b c] | d[ e f fis a g] |
    fis=''8[\> g a^\tRal g fis \af 8\! g='']\) \bar "||"
    \keyCancelChangeBar
    \key c \major
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=4-\stBass r cM!8-. r | g4 r c@M!8-. r8 |
  c=4_\aSim r cM!8 r | g4 r c@M!8 r8 |
  {{ template "lh1" }}
  \rep 2 { d'=4 r g@M!8 r8 | } \rep 2 { d=4 r d7!8 r | }
  g+gM!8 r r4 r | R2. |
  \rep 2 { c=4 r cM!8 r | g=,4 r c@M!8 r8 | }
  {{ template "lh1" }}
  f+d@m!4 r4 r | g+g7! r r | \rep 2 { c+cM! r r | }

  \key g \major
  {{ template "lh2" }}
  g=,4)-\stBass r r | c+a@m! r4 r | d+g@M! r4 r | d+d7! r r |
  {{ template "lh2" }}
  g+gM!4)-\stBass r r | c+a@m! r4 r | d+d7!4 r r |
  g+gM!8 r r4 r | R2. | R2. |
  \key c \major
}
{{ end }}
