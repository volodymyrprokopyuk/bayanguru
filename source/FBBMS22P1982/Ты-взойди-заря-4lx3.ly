{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key a \minor
  \time 4/4
  \meter 1/4 1,1,1,1
  \repeat segno 2 {
    \volta 1
    \partial 4 { a'='8(\p a | }
    d=''4. f8 e d c e | \time 3/4 a,2) <f' a>8( 8 | 4. 8 <e g> <d f> |
    <e='' g>2) 8( <g bes> | \time 4/4 8 <f a>4 8 <e g> <f a>8 8 <e g> |
    \time 3/4 d=''2) <d f>8( <f a> | <e a> <c e>4 8 d <b e> |
    \time 4/4 <a=' a'>2.) \fine \bar "!!" %

    \volta 2
    r4\f | R1 | \time 3/4 r4 r a='8( a | <f a>4. 8 <e g> <d f> |
    <e=' g>2) 8( <e g bes> | \time 4/4 <f g bes> <c f a>4 8 <cis e g> <cis f a> %
    \duo { <f'=' a>8 <e=' g> | } { cis'='4 | } | \time 3/4 e2) <d f>8( <f a> |
    <f=' a>8 <c e>4 e8 d <b e> | <a= a'>2.) \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  \meter 1/4 1,1,1,1
  \partial 4 { r4 | } R1 | R2. | R2. | r4 r c''=''4( | a8 c4. c8 d cis a |
  <f=' a>2) a4( | c a b8 g | a='2.) \clef bass a,=8( a | d4. f8 e d c e |
  a,=2) a4( | d c b8 g | c2) c,8 d16 e | f4 f e8 a,4 a8 | d2 a'4( | c a b8 g |
  a=2.) %
}
{{ end }}
