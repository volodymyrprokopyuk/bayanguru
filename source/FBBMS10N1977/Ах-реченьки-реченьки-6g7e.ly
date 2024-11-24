{{ define "lh1" }}
  r8 {{ .a }} r8 eM r a@m! r8 am | r8 d@m!8 r8 e@7! %
{{ end }}

{{ define "lh2" }}
  {{ .a }} eM!] d e@M c8 a@m! a8 am | d[ dm!] e= e7! %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 4/4
  e''=''4(\mf\< c d \af 4\! f | e8\> d c b \af 2\! a2) |
  c=''4(\< c d e8 \af 8\! f | e8\> d c b \af 2\! a2) |
  gis='4( e a c | c8 b a gis a2) | gis4( e a b8 c | c b a gis a='2) |

  c,='8\p g' c e c, d a' d | c, g' d' g, c, g' c g |
  c,='8 e a e' c, d a' d | b, e gis d' a, e' a e' |
  gis,='4\mf e a c | c8 b a gis a e a c |
  gis='8 e gis b a c b a | c b a gis %
  \duo { a'='2 | } { r8 <c'=' e>8( <d f> <c=' e>) | }

  r8\p c=''8_\aSta a' e r b a' d, | r b a' e r d a' c, |
  r8 e=''8 a a, r b a' d, | r b a' e r d a' c, |
  b='8 c d b c b a e | gis4( e a8 <d f> <c e> <b d>) |
  \duo { e''=''2\> a,~ | a4 gis \af 2\! <c='' e>2\pp \fermata \bar "|." }
  { c''=''8 b a gis a g f e | dis2 e=' | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  \rep 4 { R1 | } |
  {{ template "lh1" (w `e@M!8-\stBass`) }} r8 a@m![ f@M!8 a@m!8] |
  {{ template "lh1" (w `e@M!8`) }} a@m!8[ d@m!8 a@m!8 g@7!8] |

  c@M!8[ cM8 cM cM] f@M!8[ d@m!8 f@M!8 d@m!8] |
  f@M!8[ g@7!8 f@M!8 g@7!8] c@M!8[ cM8 cM cM] |
  a@m!8[ am8 am am] d@m!8[ dm8 dm dm] |
  e@M![ eM8 e@7! e78] a@m![ am8 am am] |
  {{ template "lh2" (w `e=8[`) }} a,=,8 am! am am |
  {{ template "lh2" (w `e'=8[`) }} a,=,2 \clef treble |

  e''='4(-\frBass c d f | e8 d c b a2) | c4( c d e8 f | e d c b a2) |
  gis'='4( e a c~ | c8 b a gis a2) | gis4( e a b8 c | c b a gis a='2) \fermata |
}
{{ end }}
