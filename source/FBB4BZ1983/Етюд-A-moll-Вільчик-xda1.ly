{{ define "rh1" }}
  {{ .a }} gis a b c \af 16\! e | e\> d c b a \af 16\! gis=') |
{{ end }}

{{ define "lh1" }}
  {{ .a }} gis-. g-. | fis-. f-. e=-. |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 3/8
  \set subdivideBeams = ##t
  {{ template "rh1" (w `a'='16(\p\<`) }}
  {{ template "rh1" (w `a='16(\mp\<`) }}
  a='16(\mf b c g' f e | d a d f e d | gis e gis e gis e='') |

  \repeat volta 2 {
    a=''16\(\f e a b c b | a f d a a' b | gis e b gis b' a |
    \alternative {
      \volta 1 { gis=''16\> gis, gis' gis, gis' \af 16\! gis,='\) | }
      \volta 2 { gis'=''16(\>^\tRit gis, e' gis, d' \af 16\! gis,=') | }
    }
  }

  {{ template "rh1" (w `a='16(\p\<^\tATem`) }}
  {{ template "rh1" (w `a='16(\mp\<`) }}
  a='16(\p gis a b c e | a\> gis a b c \af 16\! e=''') |
  \duo { a'''='''4. \bar "|." } { r8 <c'''=''' e>4 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  \set subdivideBeams = ##t
  {{ template "lh1" (w `a=8-.-\frBass`) }}
  {{ template "lh1" (w `a=8-.`) }}
  a=8[-. e']-. d16( c | b f b d c b) | e[( d] c8 b=) |

  a=8-. g-. fis-. | f-- r d(-- | e)-- r f'-- | \rep 2 { e='16[( d] c8 b=) | }

  \rep 3 { {{ template "lh1" (w `a=8-.`) }} | }
  \duo { r8 <e= c'>4 | } { a,=,4. | }
}
{{ end }}
