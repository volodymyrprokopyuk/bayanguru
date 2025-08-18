{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \minor
  \time 2/4
  g'='4(\mf bes | a2) | g4( bes | a2) | bes4( d | c bes | a c | d2) |
  \repeat volta 2 {
    d=''4-.\f d-. | f-. f-. | bes,-. bes-. | d2-- | c4-.\p c-. | g-. a-. |
    \alternative {
      \volta 1 { bes='4( g | f='2) | }
      \volta 2 { bes='4(\> a | \af 2\! g='2) \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \minor
  R2 | d'='4(-\frBass fis | g2) | d4( fis | g2) | ees2~ | ees | d |
  bes'='2( | a | g | f) | ees4-. c-. | ees2 | d4( d | f2) | d4( fis | g='2) |
}
{{ end }}
