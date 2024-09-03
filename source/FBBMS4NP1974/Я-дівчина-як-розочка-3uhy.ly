{{ define "rh1" }}
  {{ .a }} cis b a) gis8-. e='-. |
{{ end }}

{{ define "rh2" }}
  <d='' fis>8 <cis e>16 <b d> | <a cis> b <a cis> d <cis e>8 8 |
  d=''16( cis b a) gis8-. <d=' e>-. |
{{ end }}

{{ define "rh3" }}
  {{ .a }} e-. dis-. e-. d-. e-. d-. e-. |
  cis=''16-. e-. cis-. e-. cis'8( a) |
  d,=''16-. e-. d-. e-. b'8( gis='') |
{{ end }}

{{ define "lh1" }}
  {{ .a }} a gis e | a a a cis | b b d b=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key a \major
  \time 2/4
  {{ template "rh1" (w `d''=''16(\mf`) }} | a-. a-. a4-- \barFermata |
  \tempo Moderato
  {{ template "rh1" (w `d=''16(\p`) }} | a cis e8. cis16 |
  {{ template "rh1" (w `d=''16(`) }} | a-. a-. a16( b cis e) |
  {{ template "rh1" (w `d=''16(`) }} | a16 e a b cis a cis e |
  {{ template "rh1" (w `d=''16(`) }} | <cis=' a'>8-. 8-. 4-- |

  <a'=' b d>8 <b d>16 <cis e> {{ template "rh2" }} | <cis a'>8-. 8-. 4-- |
  <b'=' d>16 fis <b d>16 e {{ template "rh2" }} |
  <cis=' a'>8-.^\tRit 8-. <cis=' e a>4-- |

  {{ template "rh3" (w `dis'=''16-.^\tATem`) }} cis,=''16-. e-. cis-. e-. a8( cis) |
  {{ template "rh3" (w `dis,=''16-.\mf`) }} a=''8-. <cis,='' a'>-. 4-> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \major
  fis'='4(-\frBass e8 d | cis16 d cis b a=4) \clef bass |
  e@M!8[-\stBass e@7!8] eM!8 e7! |
  \rep 3 { a@M!8[ fis@m!8] aM!8 fism! | e@M!8[ e@7!8] eM!8 e7! | }
  a,=,8[-. gis-. fis-. e=,]-. |

  d'=8 b@m! e8 e7! | a, g fis fis7! | b bm! e e7! | a, aM! a4-- |
  b=,8 bm! e e7! | a, g fis fis7! | b bm! e e7! | a,-. e'-. a,=,4-- \clef treble |

  \meter 1/2 #'(1)
  {{ template "lh1" (w `b''='8-\frBass`) }} | a='8 a cis a |
  {{ template "lh1" (w `b='8`) }} | a='8-. e-. a,=4-> |
}
{{ end }}
