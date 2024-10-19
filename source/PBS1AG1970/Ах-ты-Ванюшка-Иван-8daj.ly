{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  c''=''4\mf c | d d | e8 d c b | a4. b8 | c4 c | d d | e8 d c b | a4 a8 b |
  c=''8 a b gis | a4 a8 b | c a b gis | a='2 |

  <e=' c'>4\mf \duo { c''=''4 | } { a'='8 g=' | }
  <f=' d'>4 \duo { d''=''4 | } { a'='8 b=' | }
  <c'='' e>8 <b d> <a c> <e b'> | \duo { a'='4. b='8 } { a'='8[ g f d='] | }
  <e=' c'>4 4 | <d a' d>4 4 | \duo { <c''='' e>8 <b d> <a c> <gis=' b> | } { e'='2 | }
  <c=' f a>4 \duo { a'='8\p b | c a b gis=' | } { <c'=' f>4 | dis d=' | }
  <dis=' a'>4 a'8 b | \duo { c''=''8\> a b gis | \af 2\! <c,=' a'>2 \bar "|." }
  { ees'='4 d=' | s2 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,4-\stBass g | f d@m! | e'4 d | c b | a g | fis d@M! | e'4 d | c a@m! |
  b+b7!4 e+e7! | a+am! g=, | f+f7! r8 e+e7!8 | a=, am! r am |

  a=,8 am! r am | a d@m! r8 dm | a e@7! r8 e7 | a am! g g7! |
  c=8 b a g | fis d@M! f8 d@m! | e'8 e7! r e7 | d f@M! r8 gM |
  b+b7!4 e+e7! | b+b7! r | f, e | a=,2 |
}
{{ end }}
