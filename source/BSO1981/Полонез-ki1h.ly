{{ define "rh1" }}
  {{ .a }} a16 e( fis gis a b c a) |
  \acc { b,='8 } b'=''4~ b16_\dCre e,( gis a b c d b) |
  \acc { c,=''8 } c'='''4~ c16 g( a b c d e c) |
  \acc { d,=''8 } d'='''4~ d16 g,( b c d e f d=''') |

  \acc { f='''8 } e='''8.[\f dis16( e8 f e d]) | c c16( b a4. c8) |
  b=''8 b16( e e,4. gis8) |
  \acc { b=''8 } a=''16( gis a b) c-. b-. c-. d-. e8-. c-. |
  b=''8 b16( e) e,4.( gis8) |
  \acc { b=''8 } a=''16-. gis-. c-. b-. <d, e gis b>4( <c='' e a>8) r |
{{ end }}

{{ define "lh1" }}
  {{ .a }} am!16 am am8 r r4 | e'8 e7!16 e7 e78 r r4 |
  c=8 cM!16 cM cM8 r r4 | g8 g7!16 g7 g78 r r4 |
  c=8.[ b16( c8 d c b]) | a am!16 am am8 am am am |
  e'=8 e7!16 e7 e78 e7 e7 e7 | a, am! am am am am |
  e'=8 e7!16 e7 e78 e7 e7 e7 | a+am! r r e+e7!-> \noBeam a+am! r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Tempo di pollaca"
  \clef treble
  \key a \minor
  \time 3/4
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      e''=''4.\p dis16( e) f8 e-. | c c16( b a4.) c8 |
      e=''8(-.\< e)-. a4.( \af 8\! e8) | g(-.\> fis)-. f4.( \af 8\! d8) |
      b'=''8.-> a16( gis8.) f16( e8.) d16( | e8.) d16 c4.( a8) |
      b='16( c b a b d f e d c b c) | a( c e a) c4.(-> a8) |
      b=''16(\< c b a b d f \af 16\! e d\> c b a) |
      gis=''16( a b \af 16\! gis) b4(->\p a=''8) r \fine |
    }

    \volta 2
    gis=''8-.\f b-. e4.(-> d8) | c4. f16( e d c b a) |
    gis=''16( e gis b  e4. d8) | c4(~ c16 a f' e d c b a |
    gis=''16) e,( b' a gis b d c b d f e |
    d=''16\< gis b a gis b d c b d f \af 16\! e) |
    \af 4.\! e='''4.\> e8(-.\< e-. \af 8\! e)-. |
    e,=''4.\>^\tRit e8(-.\< e-. %
    \af 8\! e='')-. \sRep "D.C. al Fine" "e poi Trio" \bar "||"

    {{ template "rh1" (w ` \acc { a,='8 } a'=''4~\mf^\sTrio`) }}

    \tempo "Piu mosso"
    \meter 1/4 1,1,1
    \repeat volta 2 {
      <e,=' g c>8\ff 16_ \aSta 16 8 8 <g b d>8 8 |
      <g=' c e>8 16 16 8 8 <g d' f>8 8 |
      <g=' e' g>8 16 16 8 8 <b d f>8 8 |
      <a=' c e>8_\dDim <e c' e>16 16  8 8 <e b' d>8 8 |
      <e=' a c>8 16 16 8 8 \duo { b'='8( e='') | } { e'='4 | }
      <e=' a c>8^\tRit 16 16 8 8 \duo { b'='8( e,=') | } { e'='4 | }

      {{ template "rh1" (w ` \acc { a='8 } a'=''4~\f^\tATem`) }}
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,8 am!16 am am8 am am am | a am!16 am am8 am am am |
  a=,8 am! a a7!16 a7 a78 a7 | d dm! dm dm dm dm |
  e,=,8 e7! e7 e7 e7 e7 | a am! am am am am |
  d=8 dm! dm dm e,[ e7!] | a am! am am am am |
  d=8 dm! dm dm e,=,[ e7!] | e+e7!4 r8 e+e78-> \noBeam a+am! r |

  e=,8 e7! e7 e7 e7 e7 | a am!16 am am8 am am am |
  e=,8 e7! e7 e7 e7 e7 | a am! am am am am |
  e+e7!8 r r4 r | R2. | e'=8 f e d c b | a c b a e'=4 |

  {{ template "lh1" (w `a,=,8`) }}

  \rep 2 { c=8 16 16 8 8 g16 a b g=, | }
  c=8 16 16 8 8 gis16 a b gis |
  \rep 3 { a=,8 16 16 8 8 gis16 a b e,=, | }

  {{ template "lh1" (w `a=,8`) }}
}
{{ end }}
