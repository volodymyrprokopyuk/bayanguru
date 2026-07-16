{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key c \major
  \time 4/4
  \repeat volta 2 {
    <c''='' e>4\(\mf <d f> <c e> <b d> | <a c>2 <b d> | <c e> <c a'> | <c g'>2.\) %
    \duo { e''=''4( | f e g2) | d4( c e=''2) | } { c''=''4 | c2 c | gis g=' | }
    <f,=' d'>2-- <g a>-- |
    \alternative {
      \volta 1 { <g=' c e>2-- <gis=' d' e>-- | }
      \volta 2 { <e=' c'>2.-- r4 \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  a=4\(-\frBass e' fis gis | a a gis gis | g g f f |
  e='4-- e-- e\)-- a( | gis gis g g) | f( f c e) |
  b=4 d g, g | c c b b | c='2. r4 |
}
{{ end }}
