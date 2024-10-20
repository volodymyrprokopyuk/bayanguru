{{ define "rh1" }}
  \stemDown
  b='4( <a f'>8 <b d> <c e>4\> <b d> | \af 1\! a'=''1) \stemUp |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Moderato cantabile"
  \clef treble
  \key a \minor
  \time 4/4
  \duo {
    e''=''1~\p | e | d4. e8 f e16 f g8 f | e1 \stemDown |
    <e='' g>4.(\mp <d f>8 <c e>4 <b d>8 <c e>16 <b d> \stemUp |
    a='4. b8 c b a4) | {{ template "rh1" }}
    g=''1 | f2 e | {{ template "rh1" }}
  } {
    e''=''4. d8 c d b c16 b | a4. b8 c b a4~ | a1~ | a |
    s1 | a='2~ a8 e a4 | s1 | a1 |
    <e'='' g>4. <d f>8 <c e>4 <b d>8 <c e>16 <b d> |
    <a=' c>4. <b d>8 <c e> <b d> <a c>4 | s1 | a='1 |
  }

  e''=''4.( d8 c d b c16 b | a4. b8 c b a='4) |
  \trio { \stemDown d''=''4.( e8 f e16 f g8 f \stemUp | e=''1) | }
  { s1 | r4 g'='8 a bes4 a8 g=' | } { s1 | s4 c''=''4 d cis='' | }
  \duo {
    g''=''4. f8 s2 | a1 | s4 f8 d s2 | a'1 |
    g=''4.\f f8 <c e>4 <b d>8 <c e>16 <b d> |
    <c='' a'>4.\ff <d b'>8 <e c'> <d b'> <c a'>4 | b\p f'8 d s2 \stemDown |
    \time 2/4 \af 2\! <a=' c a'>2\> \fermata \stemUp |
    \time 4/4 e'=''1\pp | a,~ | a=' \fermata \bar "|."
  } {
    a'='4 b <c e> <b d>8 <c e>16 <b d> | <a c>4. <b d>8 <c e> <b d> <a c>4 |
    b='4 a <c e> <b d> | c2~ c8\< a b \af 8\! c |
    <a=' d>2 gis | g fis | f4. a8 <g c e>4 <g b d> | s2 |
    e'=''4.( d8 c d b c16 b) | e,4.( d8 c d b^\tRit c16 b | a=1) |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  \rep 12 { R1 | }
  a@m!2 e@7!2 | c@M!2 d@7!2 | f@M!2 g@7!2 | c@M!2 g@m!4 a@7!4 |
  d=8( dm!4) dm8 e( e7!4) e78 | f( fM!4) fM8 d( d7!4) d78 |
  g,=,8_\aSim g7!4 g78 a[( cM!]) g( gM!) |
  \duo { r8 am!4 r8 r2 | } { a,=,4.( g8 f4 e=,) | }
  d'=8 dm!4 dm8 e e7!4 e78 | a, am!4 am8 d d7!4 d78 |
  g,=,8 g7!4 g78 c[( cM!]) g( gM!) |
  a=,4-- am! \fermata | \rep 2 { R1 | } R1 \fermata |
}
{{ end }}
