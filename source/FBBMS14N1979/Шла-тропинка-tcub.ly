{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key f \major
  \time 2/4
  \meter 1/2 #'(1)
  f'='4(\mp c' | bes a8 g | f4) d8( e) | f4( c' | bes8 a16 bes c8 bes |
  a='4) c8 c | d c bes a | g g c bes | a4 c8 c | d c bes a | g g c c | f,='2 |

  \repeat volta 2 {
    <a,= c f>4\mf <c e a c> | <d f bes> \duo { a'='8( g=') | } { <c'=' e>4 | }
    <a= d f>4 <g c> | \duo { f'='8( g) a c | bes( a16 bes) <a c>8[ <g=' bes>] | }
    { <a= c>4 <c e> | <d f> c=' | } | <d' f a>4 <c f c'>8 8 |
    <d=' f d'>8 <c f c'> <bes f' bes> <bes f' a> | <bes f' g>4 <bes e c'>8 8 |
    <a= f'>4 <c' f c'>8 8 | <d f d'> <c f c'> %
    \duo { bes''=''8 a | <f g>4( <e c'>) | } { <bes'=' f'>4 | bes='2 | }
    \alternative {
      \volta 1 { <a=' c f>4 r | }
      \volta 2 { \duo { <f'='_~ f'^~>2 | 2 \bar "|." } { bes'='2 | a=' | } | }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
}
{{ end }}
