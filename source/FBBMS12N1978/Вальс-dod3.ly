{{ define "rh1" }}
  {{ .a }} fis e d cis b | a d cis b a \af 8\! gis |
  fis='8\> b a gis fis fisis=' |
{{ end }}

{{ define "rh2" }}
  {{ .a }} d e fis cis b | a b cis d a gis | fis8 gis a b gis e=' {{ .b }} |
{{ end }}

{{ define "rh3" }}
  \duo { <e'=' a>2. | } { d'='4( cis='2) | }
{{ end }}

{{ define "lh1" }}
  {{ .a }} cis8( d e4) | fis,4-> a8( b cis='4) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \major
  \time 3/4
  {{ template "rh1" (w `cis''=''8\(\mf\<`) }} | gis='4 \af 8\! e2\) |
  {{ template "rh2" (w `cis'=''8\(` ``) }} | a='2.\) |

  \repeat volta 2 {
    cis=''8 d cis4 a8 fis | \duo { b'='4 a gis=' | } { fis'='2 eis='4 | }
    <fis=' a>4 gis fis | <bis, fis' gis>2 <b eis>4 | r <fis' a cis>2 |
    \duo { cis''=''4 dis e | dis8 e dis4 bis=' | }
    { <e'=' gis>2 <gis cis>4 | <fisis cis'>2 fis='4 | }
    \alternative {
      \volta 1 { <e=' gis cis>2. | }
      \volta 2 { <e=' gis cis>2. | }
    }
  }

  \repeat volta 2 {
    {{ template "rh1" (w `cis'=''8\(\<`) }} | gis='4 \af 8\! e4\) e'8\( d |
    {{ template "rh2" (w `cis=''8` `\)`) }} |
    \alternative {
      \volta 1 { {{ template "rh3" }} }
      \volta 2 { {{ template "rh3" }} \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \major
  {{ template "lh1" (w `a=4->-\frBass`) }}
  d,=4-> fis8( gis a ais | b cis d cis d b) |
  {{ template "lh1" (w `a=4->`) }} | d,=4( dis e | fis e a,=,) |

  <fis'= cis'>2. | \duo { d'='4( cis b) | cis( b a) | gis=2. | }
  { fis=2. | e | dis4( d cis=) | } | cis'='8 d cis4 a8 fis |
  gis=2 b4 | ais2 a4 | gis e cis | gis' cis b= |

  \duo {
    r4 cis'='8( d e4) | r a,8( b cis4) | r fis,8( gis a ais |
    b=8 cis d cis d b) |  r4 cis8( d e4) | r a,8( b cis='4) |
  } { a=2 gis4 | fis2. | d | e | a2 gis4 | fis2 e=4 | }
  <d,= d'>4( <dis cis'> <e b'> | fis e a,) | <a=, e'>2. |
}
{{ end }}
