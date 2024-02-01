{{ define "rightHand" }}
\relative {
  \tempo "Allegretto scherzando"
  \clef treble
  \key bes \major
  \time 2/4
  \repeat volta 2 {
    <d''='' f>8[-.\pp 8-. 8-. 8]-. | bes'16( a c bes d c bes a |
    g=''16 f ees d c bes a bes | c8)-. r r4 |
    <c='' f>8[-. 8-. 8-. 8]-. | c'16( b d c ees d c bes |
    a=''16 g f ees d c bes c | d8)-. r r4 |
    <d='' f>8[-. 8-. 8-. 8]-. | e16( f fis g gis a bes b |
    \ottava #1 c='''16_\dCre cis d dis e f fis g | gis a bes b c b c cis) |
    e=''''16(->\p d_\aDol cis d bes8)-. g-. | d'16(-> c b c a8)-. f-. |
    c'=''''16( bes a bes a g f e | f8[)-. f-. f=''']-. \ottava #0 r |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key bes \major
  \meter 1/2 #'(1)
  <bes= d f>8-\frBass 8 8 8 | \rep 2 { <bes= d f>8 8 8 8 | }
  \rep 4 { <a= ees' f>8 8 8 8 | } \rep 2 { <bes= d f>8 8 8 8 | }
  \clef treble \rep 2 { <bes= c e g>8 8 8 8 | }
  <a= c f>8 8 8 8 | <bes d g>8 8 8 8 | <c f a>8 8 8 8 | <c e g>8 8 8 8 |
  <f=' a>8 8 8 r \clef bass |
}
{{ end }}
