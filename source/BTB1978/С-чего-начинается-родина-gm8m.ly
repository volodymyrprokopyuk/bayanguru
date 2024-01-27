{{ define "rh1" }}
  b'='4.^~ b8 a g fis dis b | c'=''4 b='8 %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Lento
  \clef treble
  \key e \minor
  \time 9/8
  \partial 8 { b=8\(\p | }
  \repeat volta 2 {
    {{ template "rh1" }} b='4.~ b4\) b,8\( |
    \time 6/8
    g'='8 g g g dis e | fis4.~ fis4\) b,8\( |
    <fis'=' a>8 8 8 8 <e g> <dis fis> |
    <dis=' b'>4 <fis a>8 4\) b,8\( |
    <fis'=' a>8 8 8 8 <cis e> <dis fis> |
    <e=' g>4.~ 4\) b8\( | b'8 a g fis dis b |
    c'=''4 b8 b4\) e,8\( | <b' d>8 8 8 8 <fis a> <gis b> |
    <a=' c>4.~ 4\) e8_\( | <c' e> c a g fis8. fis16 |
    b='4 g8 b,4\) b8_\( | <a' c>4 16 16 8 <g b>8. <e g>16 |
    \alternative {
      \volta 1 { \time 9/8 <fis=' a>2.~ 4\) b,8 \sSlur nf #'() ( | }
      \volta 2 {
        \time 9/8 \hSpace
        <fis'=' a>2.)~ 4 %
        \sSlur ub #'((wb . 2.5) (ww . 6.3) (wh . 2)) ( b,8)\( |
        {{ template "rh1" }} b='2.~ | b4.\) %
        \ottava #1 <e='' c'>4 <g='' b>8(\> 4.~ | \af 8\! 8) \ottava #0 %
        r r r4. r4 \bar "|."
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  \partial 8 { r8 | }
  e=4-\stBass em!8 b4 e@m8 b4 bM!8 | e4 em!8 g,4 e@m8 b4 e@m8 |
  e=4 em!8 b4 e@m8 | \rep 2 { dis=4 b@7!8 b=,4 b78 | }
  fis=,4 b@7!8 b=,4 b78 | dis4 b@7!8 b=,4 b78 |
  e=4 em!8 b4 e@m8 | e4 em!8 b4 bM!8 |
  e=4 em!8 g,4 e@m8 | gis4 e@7!8 e'4 e78 |
  a,=,4 am!8 e'4 a@m8 | a,4 am!8 c4 a@m8 |
  g=,4 e@m!8 e'4 em8 | b2. |
  \rep 2 { b=,4 b7!8 b74 b8 a g fis=, | }
  e'=4 em!8 g,4 e@m8 b4 bM!8 | e4 em!8 em4 b8 e4 em!8 |
  em4 b=,8 e4 em!8 em4 b8 | e= r r r4. r4 %
}
{{ end }}
