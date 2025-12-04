{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key f \major
  \time 2/4
  \partial 4 { d'='4(\mp | }
  g='4 f8 e | f4 d~ | d) d( | g4 f8 e | f4 d~ |
  d='4) a'4\(\mf | d c8 d | a4 f8 f | bes4 a8 g |
  a='4 d~ | d\) a\( | d c8 d | a4\> f8 f | g4 d8 e |
  f='4 d~ | d='\) r\mf |

  r8 <d=' g bes>8[ r8 8] | r <d a' c>8[ r8 8] | r8 8[ r <fis c' d>] |
  r8 <e=' bes' d>8[ r8 8] | r <a c d>8[ r8 8] | r <a c d>[ r <fis c' d>]\f |
  r8 <g=' bes d>8[ r8 8] | r <f a d>8[ r8 <d a' c>] |
  r8 <d=' e g>8[ r <cis g' a>] | r\> <d f a>8[ r8 8] |
  r8 \af 8\! <d=' f a>8 <c' f>4\(\mp | <bes f'> <bes g'> |
  <d='' f>4 <c a'> | <b g'>2\>^\tRit | <d='' a'>2~ | \af 4\! 4\) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  \partial 4 { r4 | }
  d'='2-\frBass | c~ | c | bes | a~ | a4 f | bes a | f d | g e | f2 |
  d=4 c | bes8 c d e | f g a4 | bes g | a8 g f e | d4 d=( |
  g=4 f8 e | f4 d~ | d) d( | g f8 e | f4 d~ | d) a'( | d c8 d |
  a=4 f8 f | bes4 a8 g | a4 d~ | d) a( | d4 c8 d | a4 f8 f |
  g=4 d8 e | f4 d~ | d=) %
}
{{ end }}
