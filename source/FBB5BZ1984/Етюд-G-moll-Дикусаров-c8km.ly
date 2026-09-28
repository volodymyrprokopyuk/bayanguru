{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key g \minor
  \time 2/4
  \meter 1/2 #'(1)
  g'='8\mp bes_\aLeg d bes | ees c a g | f a c cis | d4 bes |
  ees,='8 g bes b | c bes aes g | fis a d c | d4 bes |
  b='8 d g d | f ees c bes | a c ees a, | c4 bes |
  g='8 bes d c | bes a a g | d fis d' fis, | g4( g'=''8) r |

  r8 <g,=' bes d>8( fis <g bes d>) | r <g c ees>( fis <g c ees>) |
  r8 <a=' ees' f>8( gis <a ees' f>) | r <f bes d>( e <f bes d>) |
  r8 <g=' ees'>8( ees <g ees'>) | r <aes c ees>( fis g) |
  r8 <fis=' a d>8( eis <fis a d>) | r <g bes d>( fis g) |
  aes='8( <b f'> g <b f'>) | r <g c ees>( fis <g c ees>) |
  r8 <a=' c ees>8( fis <a c ees>) | r <g a ees'>( fis <g bes d>) |
  r8 <e=' bes' d>8( d <e bes' d>) | r <ees g des'>( des <ees g des'>) |
  r8\> <fis=' a c>8( eis <fis a c>) | cis'( <c d> \af 4\! <bes=' g'>4) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  \meter 1/2 #'(1)
  g=8-\frBass d' bes d | g, ees' c ees | f, ees' c ees | f, d' bes d |
  g,=8 ees' des ees | aes, ees' c ees | a, d c fis | bes, g' d g |
  aes,=8  f' d f | g, ees' c ees | fis, ees' c ees | g, d' bes d |
  g,=8 e' c e | g, ees' des ees | fis, a d c | bes a g fis= |

  g=8 bes d bes | ees c a g | f a c cis | d4 bes |
  ees,=8 g bes b | c bes aes g | fis a d c | d4 bes |
  b=8 d g d | f ees c bes | a c ees a, | c4 bes |
  g=8 bes d c | bes a a g | fis a d c | bes a g=4 |
}
{{ end }}
