{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef bass
  \key e \minor
  \time 3/4
  \meter 1/4 1,1,1
  e=8(\mf\< a b4 <g b e>8. d'32 \af 32\! cis |
  <fis,= b d>8\> <e a cis>16 e' <d, fis d'> cis' d8 \af 4\! <g, b>4) |
  <fis= b d>8(\< fis' <g, b e>4. \af 8\! b8 |
  <e,= a>4\> \af 2\! <d= g>2) \clef treble |

  \repeat volta 2 {
    <c'=' e a>8(\< <d g b> <c g' c> \af 16\! <e g e'> %
    <d=' g b>8\> \af 16\! <d g> |
    <c=' e a>8 <e g> <b fis'>16\> e g8 \af 4\! <g, b e>4) |
    <e'=' a c>8(\p\< <a c e> <d, g b>4. \af 8\! <d g>8 |
    <d=' fis a>4\> \af 2\! <g,= b e>2) |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  \meter 1/4 1,1,1
  e,=,8(-\puBass a b4 e | b8 a d4 g,) | b4( e2 | c4 b2) |
  a=,8( g e' c g4 | a8 c e2) | a,8( fis g4 g8 b | d4 e=2) |
}
{{ end }}
