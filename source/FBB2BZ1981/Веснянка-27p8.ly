{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 3/4
  \repeat volta 2 {
    b'='4(\p a8 b g16 fis e8) | b'4( a8 b g16 fis e8) |
    \time 2/4
    \rep 2 { e='8-- g-- g-- b-- | c( b16 a g='4) | }
    \time 3/4
    b='4( a8[ c] b a |
    \alternative {
      \volta 1 { g='8 e b16 cis dis e fis g a ais=') | }
      \volta 2 {
        g='8 \sSlur ub #'((wb . 4) (ww . 3) (ws . 8) (wd . -2)) ( e %
        b=2) \fermata \bar "|."
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \major
  e''=''16(-\frBass g e g dis g dis g d g d g) |
  cis,=''16( g' cis, g' c, g' c, g' b, g' b, g') |
  \duo { \rep 2 { e''=''2~ | e='' | } e2-- ees=''4-- | }
  { \rep 2 { r4 d''=''4-- | c-- b-- | } c=''2. | }
  d=''8[( c] b) r r4 | d8( c b='2) \fermata |
}
{{ end }}
