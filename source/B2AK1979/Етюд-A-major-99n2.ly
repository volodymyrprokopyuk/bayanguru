{{ define "rh1" }}
  {{ .a }} e d fis e cis a cis | b e gis, e'='' %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key a \major
  \time 2/4
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      {{ template "rh1" (w `cis''=''16\mf`) }} a, e' e, e' |
      {{ template "rh1" (w `cis=''16`) }} a,\< cis e \af 16\! a='' |
      gis=''16\f b e, b' fis b dis, b' | e,-- b' d,-- b' cis,-- a' c,-- a' |
      b,='16-- gis' e-- gis a,-- fis' dis-- fis |
      gis,='16-- e' <b d> e <a,=' cis a'>4 \fine |
    }

    \volta 2
    \keyCancelBarChange
    \key d \major
    \repeat volta 2 {
      fis'=''16\mf a g b a fis d fis | e g cis, e d a d e |
      fis=''16 d g b a fis d fis | g e cis e fis d a d |
      cis=''16 e a, e' b e gis, e' | a, e' g, e' fis, d' f, d' |
      e,='16 cis' a cis d, b' <e, gis> b' | cis, a' <e g> a <d,=' fis d'>4 |
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \major
  a,=,8 d@M! a@M!4 | e'8 e7! cis a@M! | a8 d@M! a@M!4 | e'8 e7! a+aM!4 |
  e=8 eM! b b7! | e eM! a, am! | b e@M! b8 b7! | e= e7! a+aM!4 |

  \key d \major
  d=8 g@M! d@M!4 | a8 a7! fis d@M! | d'8 g@M! d@M!4 | cis8 a@7! d8 dM! |
  a=,8 aM! e' e7! | cis a@M! d8 dm! | e a@M! e8 e7! | a,=, a7! d+dM!4 |
}
{{ end }}
