{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \major
  \time 2/4
  e'='8\mf 8 8 gis | a a a b | cis d cis b | a4 e'8 d |
  cis=''8 cis cis16 b a gis | fis8 fis a cis | b a gis fis | e4 e |
  <e=' e'>8 8 8 <gis e'> | <a e'>8 8 8 <b e> | <cis e> <d e> <cis e> <b e> |
  \duo { e''=''4 e | e8 e eis4 | fis8 fis4. | fis2 | e4 e='' 4 | }
  { a'='8 a cis <b d> | cis cis cis16 b a gis | fis8 fis a cis | b a gis fis | e4 e=' | }

  \repeat volta 2 {
    e=''4~ e16 d cis b | a e fis gis a b cis d |
    e=''16 fis e8~ e16 d cis b | a e fis gis a b cis d |
    \alternative {
      \volta 1 {
        cis=''4~ cis16 b a gis | fis cis dis eis fis gis a cis |
        b='16 cis b8~ b16 a gis fis | e fis gis a b cis d dis='' |
      }
      \volta 2 {
        cis=''4~ cis16\< dis e eis | fis gis a b \af 8\! <a='' cis>8 r \fermata |
      }
    }
  }
  b,='16(\< cis dis e fis gis a ais | b bis cis dis \af 8\! e='''8)\f r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \major
  a@M!8-\stBass r8 r e@7! | a@M!8 r8 r e@7! |
  \rep 2 { a@M!8[ b@m!8] a@M!8[ e@7!8] | }
  a@M!8 r8 r cis@7! | fis@m!8 r8 r a@M! |
  e@M!8[ fis@m!8] e@M!8[ fis@m!8] | e@M!8[ a@M!8] e@M!8[ e@M!8] |
  e=8 eM! d e@M! | cis8 a@M! b8 e@7! | a8 aM! gis e@M! | fis8 a@M! e8 e7! |
  a=,8 aM! gis cis@7! | fis8 fism! e fis@m! | dis8 b@7! b'8 b7! | e d cis b=, |

  \meter 1/2 #'(1)
  \rep 3 { a=,8 aM! aM e'= | } a, aM! aM gis | cis cis7! cis7 cis |
  fis,=,8 fism! fism fis | b b7! b7 b |
  \meter 1/4 1,1
  e=8 d cis b | cis b a gis | fis e dis=, r \fermata |
  b+b7!2 | r8 b+b7!8 e+eM! r |
}
{{ end }}
