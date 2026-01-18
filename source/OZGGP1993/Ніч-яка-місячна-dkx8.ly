{{ define "rh1" }}
  {{ .a }} <a c>4 4 | 4 b a | <f a d> <a d>4 4 | 4 e' {{ .b }} |
{{ end }}

{{ define "lh1" }}
  \duo { c'='4 e e | e d c | d f f | f g a | }
  { <a,=, e'>2.~ {{ .a }} | 2. | <d= a'>2.~ | 2. | }
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
  <f=' gis d'>4 <e gis c> <d gis b> | <c=' e a>2.~ | 2. |

  \repeat volta 2 {
    {{ template "rh1" (w `<e=' a c>4\<` ` \af 4\! f=''`) }}
    <e,=' a e'>4\> 4 4 | <e gis e'> b' <e, gis c>4 |
    <c=' e a>2.~ | \af 2.\! 2. |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `- \frBass`) }}
  <e= a c>2. | <e e'>2 <e d'>4 | a e c | a=,2. |
  \rep 2 { a=,4 e' c'=' | } \rep 4 { a,=,4 e' gis= | }
  a,=,4 e' f | e c b=, |

  {{ template "lh1" (w ``) }} | <e= a c>2. | <e d'>2 4 | a2 e4 | a,=,2. |
}
{{ end }}
