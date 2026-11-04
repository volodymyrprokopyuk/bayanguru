{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \major
  \time 2/4
  r8\mf <d'=' g>8 r <fis a> | r\> <d g> r <fis a> | g\p g a4 |
  b='8 d4-> c8 | b4 a | g4~ g16 a b cis | <a d>8\mf 8 <a e'>4 |
  \duo { fis''=''8 a4-> g=''8 } { a'='8 d c b=' | }
  <a=' fis'>4 <g e'> | \duo { d''=''2_\dCre | } { fis'='8 a b c='' | }

  \repeat volta 2 {
    \duo { g''=''8\f b4-> a8 | g4(\> \af 4\! fis='') | } { b'='8 b4. | c=''2 }
    \alternative {
      \volta 1 {  }
      \volta 2 {  }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
}
{{ end }}
