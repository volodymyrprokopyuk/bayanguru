{{ define "rh1" }}
  {{ .a }} a b | cis4. b8 a4) | e(_\dCre a b | cis2) cis4( |
  e=''4 e d8 cis | b2) b4( | {{ .b }} cis b | \af 2.\! {{ .c }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key a \major
  \time 3/4
  {{ template "rh1" (w `e'='4(\mp` `d\>` `a='2.)`) }}

  \duo {
    b=4(\mf e fis | gis4. fis8 e4) | b(_\dCre e fis | gis2) gis4( |
    b='4\f b a8 gis | fis2) fis4( | <cis a'>\> <b gis'> <a fis'> |
    \af 2.\! <gis= e'>2.) |
  } { s2. | dis'='2( cis4) | b2.~ | b | cis~ | cis=' | s2. | s2. | }


  {{ template "rh1" (w `e='4(\mp` `d\>^\tRit` `a='2.) \fermata`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \major
  <a= e'>2.~-\frBass | 2. | 2.~ | 2. | <ais fis'>( | <b fis'>) |
  <gis= e'>2.( | <a e'>) | gis2( a4 | b2 a4) | gis2( fis4 | e2.) |
  eis=4( gis cis,8 b | a4. gis8 a4) | b( cis dis | e2.) |

  r4 r e=4( a b cis~ | cis8 b a4) e( | a b cis~ | cis) cis( e~ |
  e='4 d8 cis b4~ | b) b( d | cis b a=) \fermata |
}
{{ end }}
