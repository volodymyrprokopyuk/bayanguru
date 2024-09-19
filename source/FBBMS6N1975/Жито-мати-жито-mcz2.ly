{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 2/4
  a'='8\mf b c a | g4 e | a8 b c a | g4 e |
  c='8 e e e | d d b g | e' d c b | a4 a' |
  c=''8 e e e | d d b g | e' d c b | a4 a=' |

  \duo { e''=''2~ | e | <f, e'>4 4 | e'8 fis g e='' | }
  { <a'=' c>4 8 8 | e( fis g e) | a b c a | <a c>4 <g=' b> | }
  r8 \acc { fis'=''8 } <bes,=' g'>8[ r8 \acc { fis'=''8 } <bes, g'>8] |
  r8 \acc { fis'=''8 } <b,=' g'>8[ r8 \acc { fis'=''8 } <b, g'>8] |
  r8 \acc { dis=''8 } <b=' e>8[ r8 \acc { dis=''8 } <gis, e'>8] |
  \duo { <d''='' e>4 a'='' | } { fis'='8 gis <a=' c>4 | }
  c=''16 d e8 e e | d e16 d b8 g | e' d16 e c8 b | a4-- <c='' e a>-- \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
