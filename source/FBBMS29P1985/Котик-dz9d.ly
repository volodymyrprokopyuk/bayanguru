{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 3/4
  c''=''4\p c d | e( c) c | R2. | R2. | c4\mp\< c4.( d8 |
  e=''4 c) \af 4\! c | d( g) g( | \af 2.\! c,2.)\> |
  <e,=' c'>8->\f r c'8(\< b c d | \af 8\! <g,=' e'>8)-> r %
  \duo {
    c''=''8(\< b c e | d=''8-> cis d f e \af 8\! d | c4-> g='8)\mf %
  } { s2 | f'='2.( | e='4.) } %
  g='8(\< a b | c-> b a b c \af 8\! d | e-> d c d e g |
  d=''8-> a' g f e d | c) r <e='' c'>2-> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  R2. | R2. | d''=''4-\frBass d e | c( g) g | a2( aes4 | g2.) | f( | e) |
  c='8-> r r4 r | bes8-> r r4 r | a(-> aes g | c4.)-> r8 r4 |
  <a= e'>4-> r <a f'>8 r | <g c>4-> r <g= cis>8 r \clef bass |
  \duo { d'='4(-> a b | c='8) } { f=2.( | e=8) } r8 \clef treble <c=' g'>2-> |
}
{{ end }}
