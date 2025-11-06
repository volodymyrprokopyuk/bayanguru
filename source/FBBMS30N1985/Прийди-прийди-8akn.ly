{{ define "rh1" }}
  {{ .a }} e c e | d c b a=') |
{{ end }}

{{ define "lh1" }}
  r16 a@m![ r16 am] r16 e@7![ r16 e7] |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key a \minor
  \time 2/4
  \meter 1/2 #'(1)
  {{ template "rh1" (w `c''=''8(\mp`) }}
  {{ template "rh1" (w `c=''8(`) }}
  c=''4( b8 gis | a a a b) | c( c b gis | a e f d) |
  c='4( b8 e | a, b c e) | a( c b e | a, a a='4) |

  \meter 1/4 1,1
  c=''16(->\f d e8) c16(-> d e8) | d16(-> e f8) e16( f e d) |
  c=''16( d e d c b a g | f g f e f g a b) |
  \duo { c''=''4 d8( b) | e( c) e( d) | d c~ c b | a a a='4 | }
  { a'='8( g) f4 | g fis | f e8 d | c c c='4 | }

  <a=' c>16 e f e <b' d> e, f e | <c' e> g a g <d' f> g, a g |
  <c='' e>16^\tRit a b c b e, e' e, | <a c> e f e a8 a'=''8 \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,8[-\stBass am! r8 am] | b[ d@m! r8 c@M!] |
  a=,8 am! e' a@m! | f8 d@m! f8 fM! |
  e=8 a@m! e8( d | c) a@m! d8 dm! | e a@m! e8 e7! |
  c=8 a@m! d8 dm! | f fM! e e7! | a+am! r r4 |
  a@m!4 d@m!8 r8 | a@m![ f@M!8] a@m!4 |

  c=8[ cM! r8 cM] | f, d@m! g8 g7! |
  c=8 cM! e c@m! | d8 dm! g, g7! |
  r8 c@M![ r8 d@m!] | r8 a@m!( d@M!4) |
  d@m!4 e@7!8[ e78] | a@m![ d@m!8] a=,4 |

  {{ template "lh1" }} | r16 c@M![ r16 cM] r16 g@7![ r16 g7] |
  {{ template "lh1" }} | a@m!8[ f@M!8] a@m!4^\fermata |
}
{{ end }}
