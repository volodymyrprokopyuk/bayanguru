{{ define "rightHand" }}
\relative {
  \tempo Lento
  \clef treble
  \key e \minor
  \time 3/4
  b=2\(\p b4 | b dis fis | e2 fis4 | g fis e\) |
  fis='2\( a4 | g2 fis4 | e2.~ | e2.\) |
  \repeat volta 2 {
    c'=''2\(\mf\< \af 4\! d4 | e d c |
    b='2. | b4\> a \af 4\! g\) |
    fis='2\(\mp a4 | g2\> \af 4\! fis4 | e2.~\p |
    \alternative {
      \volta 1 { \af 2\! e='2.\)\<-\sSlur ub #'((wb . 3) (ws . 13)) ( | }
      \volta 2 { e='2.) \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  b,=,4-\stBass b7! b7 | b b7 b7 | e em! em | e em em |
  b=,4 b7! b7 | b b7 b7 | e( em!) em | e( em) em |
  a,=,4 am! am | c a@m am4 | e em! em | g, e@m em4 |
  a=,4 am! am | b b7! b7 | e( em!) em | e,( fis gis=,) | e+em!2. |
}
{{ end }}
