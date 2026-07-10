{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \major
  \time 2/4
  \partial 8 { d''=''16(\mf b | }
  g='4.) d'16( b | g4.) d'16( b | g8) d'16[( b] c b c a |
  b='8)-. c-. d-. d16[(\p b] | g4.) d'16( b | g4.) c16\< d |
  e=''16 d e \af 32.\! fis g d b g |
  <c='' e>8-.^\tRit <c fis>-. <b=' g'>4--\f \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \major
  \partial 8 { r8 | }
  r8 d''=''16(-\frBass b g4~ | g8) d'16[( b] g4) | d4( e8 fis | g)-. a-. b-. r |
  r8 d=''16( b g4~ | g8) d'16[( b] g8) r | c-> r b-> r | a-. aes-. g='4-- |
}
{{ end }}
