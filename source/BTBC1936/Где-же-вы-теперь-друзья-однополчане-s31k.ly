{{ define "rh1" }}
  {{ .a }} g d' c) e,(\< g c e) d( gis, b \af 16\! f') |
  e=''8\mf b16( c a8)\> a16( b g a fis \af 32.\! b=') |
{{ end }}

{{ define "lh1" }}
  {{ .a }} cM! b | c a@m! b=,4 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 3/4 {{ template "rh1" (w `e'='16(\p`) }}
  \repeat volta 2 {
    \time 2/4
    b='8.(\p e,16) e8( fis) | e( b a' g) | fis2( b,2) |
    b'='8.( e,16 fis8 e) | <a c>( <g c> <fis a> d) |
    <g=' b>2~ | 4 r | e8( g d' c) | d4.( f,8 |
    e='8) e( d' b | c4 a) | b8. b16 b8( g) | a( g fis e) |
    \duo { b'='2 | r8 <a=' c>4( <g=' b>8) | }
    { <dis'=' fis>4 <e g> | <dis fis>8 dis='4. | }
    <fis=' a>8. d16 d8( e | d) d <a' c>\< \af 8\! <fis a> |
    <g=' b>4~( 16 a g fis) | \duo { e'='2 | } { c'='4( d8 c=') | }
    <fis=' a>8. d16 d8( e | d) d %
    \duo {
      c''=''8( b16 a) | b2 | b2 | e,8( g d' c |
      d=''4.) f,8( | e) e( d' b=') |
    } {
      a'='8 d, | dis[ b( g' fis] | f[) d( a' g]) |
      s2 | r8 gis='8[ d f='] | s2 |
    }
    <a'=' c>4 a | <g b> <e g> | <f a>4 <e fis> |
    <dis=' g>8. b'16 <dis, g>8( fis) | e='2 |
    \time 3/4 {{ template "rh1" (w `e='16(`) }}
  }
  e,='4(\p e'='') \fermata r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  {{ template "lh1" (w `c=4-\stBass`) }}
  e=4 em! | g, e@m! | a4 am! | b b7! |
  e=4 em! | a, d@7! | g4 gM! | g d'8 b |
  c=4 c7! | e e7! | gis, e@7! | a4 am! |
  e'=4 em! | f, fis@7! | b4 c@M! | b4 b7! |
  fis=,4 d@7! | d'4 d7! | g, gM! | c cM! |
  fis,=,4 d@7! | d'4 d7! | b bM! | g gM! |
  c=4 cM! | e e7! | gis, e@7! | a4 am! |
  e'=4 em! | f, fis@7! | b4 b7! | e em! |
  {{ template "lh1" (w `c=4`) }} | e=4 em! \fermata r |
}
{{ end }}
