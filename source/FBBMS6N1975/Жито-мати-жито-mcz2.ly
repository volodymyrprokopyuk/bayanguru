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
  r8 <a e'>4.-\frBass | r8 e[ fis g] | r <f c'>8[ r8 8] | r b[ c b] |
  a=4.( c8 | b a g4) | e gis8 e | a4 a,=, |
  r8 <g'= a c>8[ r8 8] | r <f a d>[ r <g b d>] |
  r8 <gis= c f>8[ r <gis d' e>] | r <a c f>[ r <a= c e>] |

  a=8 b c a | g4 e | c8 b a c | b4 e |
  c'='8 e e e | d d b g | e' d c b | a4 a,16 e' a8 |
  <b= c e>8 8 <bes c e>8 8 | <a c fis>8 8 <g b f'>8 8 |
  <gis= c f>8 8 <gis d' e>8 8 | <a c e> e a,=,4-- |
}
{{ end }}
