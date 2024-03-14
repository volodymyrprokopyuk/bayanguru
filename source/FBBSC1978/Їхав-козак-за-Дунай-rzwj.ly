{{ define "rh1" }}
  {{ .a }} e c e a b c b | a b c e d c b a |
{{ end }}

{{ define "rh2" }}
  gis=''16 a b gis e d' c b | a c b a g f e d=''\) |
{{ end }}

{{ define "rh3a" }}
  {{ .a }} | a8[ e-> d-> c='']-> |
{{ end }}

{{ define "rh4b" }}
  r8 {{ .a }} <c dis>16 e) | a <a, c> e' <e, a> d' <e, a> c' <e,=' a> |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  \meter 1/2 #'(1)
  a'='8\p a a a | a( c b a | gis) gis gis gis | gis( b a gis) |
  a='8 a a a | a\( c b a | gis b e gis, | a c16 b a8[\) b]( |
  \repeat volta 2 {
    c=''8)\mf c c c | c( e d c | b) b b b | b(\> d c \af 8\! b) |
    a='8\p a a a | a\( c b a |
    \alternative {
      \volta 1 {
        gis='8 b  e gis, | a c16 b a8[\) b='] \sSlur nf #'((wb . 1)) ( |
      }
      \volta 2 {
        gis='8)^\tRit b  e gis, \sSlur nb #'((wb . 1.5) (ww . 4.5) (wh . 2)) ( |
        \duo { a'='8[ c16( b]) a='8 } { e'='8[ f] e=' } %
      }
    } r8) \fermata
  }

  \meter 1/4 1,1
  {{ template "rh1" (w `<c,=' a'>16\(\f^\tATem`) }}
  gis='16 a b gis e fis gis a | b c d e c e b e\) |
  {{ template "rh1" (w `<c='' a'>16\(`) }} {{ template "rh2" }}
  \repeat volta 2 {
    <e,=' c'>16\( g e g a b c d | e f g e f e d c |
    b='16 c d b g a b c | b c d e c e b e\) |
    {{ template "rh1" (w `<c='' a'>16\(`) }}
    \alternative {
      \volta 1 { {{ template "rh2" }} }
      \volta 2 {
        gis=''16 a b gis e d' c b | a8 %
        \sSlur nb #'((wb . 4) (ww . 8) (wh . 3)) ( r) <a='' c e a> r |
      }
    }
  }

  \duo {
    {{ template "rh3a" (w `a''=''2~\ff`) }}
    <gis=' b>8.( a16 gis a b c | d e f8 e gis) |
    {{ template "rh3a" (w `a=''2~`) }}
    \stemDown <d,=' gis b>8[-> <a' b f'>-> <a c e>-> <b d gis>]-> |
    \stemUp a'=''4. b8-> |
    c='''2~ | c2 | g(~ | g4.^\tRit gis8)-- |
    {{ template "rh3a" (w `a=''2~^\tATem`) }}
    \stemDown <d,=' gis b>8[-> <f a f'>-> <e a e'>-> <gis b d gis>]-> |
    <a=' c e a>4 \stemUp <b, f' g b>8 <d f g d'> |
    c'=''2~ | c | g~ | g4. <e gis>8 | a2~ | <c,=' f a>8 %
  } {
    {{ template "rh4b" (w `<c''=''~ e>4(`) }} s2 | r8 a4( b8) |
    {{ template "rh4b" (w `<c=''~ e>4(`) }} s2 | r4 <c' e>8 <d f> |
    r8 <e='' g>4.~\sf | 16 f( g8 f e) | d16( e d c b c d e | d e f8) e <d e> |
    {{ template "rh4b" (w `<c=''~ e>4(`) }} s2 | s2 |
    r8 <c=' e>4~ 8 | e16( f g8) a( g) | f16( e d c b c d e | f e d8 c) b |
    r8 <c='~ e>4( <c=' dis>16 e) | s8 %
  }
  r8 \clef bass <e,,= a>4->^\tRit |
  <dis= fis b>4-> <dis= a' c>-> \clef treble \barFermata |
  \tempo Allegro
  \omit TupletBracket
  \tuplet 6/4 { gis=32(\f a b c d e } <a, f'>8) <a e'>-> <b d gis>-> |
  \duo { r4 <c''='' e a>8 } { a'='4~ a8 } r8 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  <a= c>4\(-\frBass <b d> | <c e>2 | <b d>4 <c e> | <d f> <c e>8 <b d>\) |
  <c=' e>4\( <d f> | <dis fis>2 | <d f>4 <c e>8 <b d> | <a c>4.\) <g d'>8( |
  <c=' e>4) <d f> | <e g^~>2( | <f=' g>) |
  \duo {
    gis'='2\( | <c, e>4( <e g>) | fis fis | <d f> <c e>8 <b g> | <a= c>4\) %
  } { e'='4. d8 | s2 | dis='2 | s2 | s4. } %
  <g,= d'>8( | <d' f>4 <c e>8 <b d> | <a c> <gis d'> %
  <a= c>8) r \fermata \clef bass |
}
{{ end }}
