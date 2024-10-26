{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 4/4
  \partial 4 { e'='8(\mf g | }
  <g=' b>4 <fis a>8 <e g> \duo { a'='8[ fis] b a=' | } { e'='4 dis=' | }
  <e=' g>4 e2) g8( b | <b d>4 <a c>8 <g b> <fis a>4 %
  \duo { d''=''8 e='' | } { fis'='4 | } | <g b>2.) b8( b |
  \repeat volta 2 {
    <b=' g'>4 <b fis'>8 <g e'> <fis b>4 <g b>8 <fis b> |
    <e=' c' e>4 2) <b' d>8( <a c> | <g b>4 <fis a>8 e %
    \duo { d''=''8[ c=''] } { fis'='4  } <g b>8 <fis a> |
    \alternative {
      \volta 1 { <e=' e'>2.) b'8 \sSlur nf #'((wb . 1) (ww . 1.5)) ( b) | }
      \volta 2 {
        <e,=' e'>2~ \sSlur nb #'((wb . 3) (ws . 9.5) (ww . 3.5) (wh . 1.5)) ( 4) \bar "|."
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  \partial 4 { r4 | }
  e=8( em!) em em c( a@m!) b8( b7!) | e( em!) em em e( am) r4 |
  d=8[_\aSim g@M! gM8 gM] d d7! d7 d7 | g, gM! gM gM g gM g[( fis]) |
  e'=8 em! em em b b7! b7 b7 | c cM! cM b( a[ g] fis) a@m! |
  b=,8 e@m! em8 em a[ am!] b b7! | e em! em em e[ em ]g,( fis) |
  e'=8 em! em em em4 %
}
{{ end }}
