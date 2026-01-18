{{ define "rh1" }}
  {{ .a }} e fis g a8)-. a-. d-. d-. a4 |
  g=''8( fis16 e) fis8( e16 d) a8-. a-. a4 |
  d=''16(\p e fis g fis8)-. fis-. b-. b-. fis=''4 |
{{ end }}

{{ define "rh2" }}
  {{ .a }} e) fis( d) e16( d cis b) d8( b=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key b \minor
  \time 4/4
  {{ template "rh1" (w `d''=''16(\mf`) }}
  e=''8( d16 cis) d8( cis16 b) fis8-. fis-. fis='4 |

  {{ template "rh2" (w `g'=''8(\mf`) }} | g'( fis16 g) a( g fis e) d2 |
  {{ template "rh2" (w `g=''8(\p`) }} | g'( a16 g fis e d cis b8)-. b-. b='4 |

  {{ template "rh1" (w `d=''16(\f`) }} | g8( fis16 e) a8-. a-. d,=''2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
  R1 | R1 | b,=,8[-\stBass r bm!] r bm[ r bm] r |
  e+em![ r e+em] r fis+fisM! r fis+fisM4 |

  \rep 3 { e+em!8[ r b+bm!] r } b+bm r b=,16( a g fis) |
  \rep 2 { e+em!8[ r b+bm!] r } | e+em![ r fis+fis7!] r b+bm! r b+bm4 |

  R1 | R1 | b=,8[ r a] r g[ r fis] r | e+em![ r a+a7!] r d+dM!2 |
}
{{ end }}
