{{ define "rh1" }}
  {{ .a }} <a c>4 4 | 4 b a | <f a d> <a d>4 4 | 4 e' {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 3/4
  {{ template "rh1" (w `<e'=' a c>4\p\<` `f=''`) }}
  <e,=' a e'>4 <e e'>4 \af 4\! 4 | <e gis e'>\> b' <e, gis c> |
  <c=' e a>2.~ | \af 2.\! 2. |

  <a'=' c e>4\p <b d> <a c> | <e a c> b' <e, a> |
  <d=' b'>4 4 4 | 4 gis <d e>4 | 4 <d gis> <d b'> |
  <f=' gis d'> <e gis c> <d gis b> | <c=' e a>2.~ | 2. |

  \repeat volta 2 {
    {{ template "rh1" (w `<e=' a c>4\<` `\af 4\! f=''`) }}
    <e,=' a e'>4\> 4 4 | <e gis e'> b' <e, gis c>4 |
    <c=' e a>2.~ | \af 2.\! 2. |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
