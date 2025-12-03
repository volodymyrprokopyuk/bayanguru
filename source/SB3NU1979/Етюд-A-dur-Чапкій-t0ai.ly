{{ define "rh1" }}
  {{ .a }} b cis d e fis gis a | | b16-> cis d cis b a gis fis\) |
{{ end }}

{{ define "rh2" }}
  {{ .a }} fis gis fis e d cis b | | a16-> b cis b a-> b cis b\) |
{{ end }}

{{ define "rh3" }}
  {{ .a }} b cis b a-> b cis a | | b16-> cis d cis b a gis fis\) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} r aM! r | a r b@m! r8 | gis r e@7! r8 | a=, r aM! r |
{{ end }}

{{ define "lh2" }}
  {{ .a }} gis a gis fis8) r | b16(-> cis d cis b8) r |
  e,=,16(-> fis gis fis e8) r | a16(-> b cis b a8) r |
  fis=,16(-> gis a gis fis8) r | b16(-> cis d cis b=,8) r |
{{ end }}

{{ define "lh3" }}
  a=,8 r aM! r | d r b@m! r8 | e=8 r e7! r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \major
  \time 2/4
  {{ template "rh1" (w `a=16\(->\f`) }}
  {{ template "rh2" (w `e='16\(->`) }}
  {{ template "rh1" (w `a=16\(->`) }}
  e='16\(-> fis gis fis e d cis b | a-> b cis d dis e fis gis\) |
  {{ template "rh3" (w `a='16\(->`) }}
  {{ template "rh2" (w `e='16\(->`) }}
  {{ template "rh3" (w `a=16\(->`) }}
  e=16\(-> fis gis fis e fis gis e | a8\)-> r <a= cis e a>-> r |

  r4\f r8 \clef bass <fis= a cis fis>8 | r4 r8 <fis b d fis> |
  r4 r8 \clef treble <b= d e gis>8 | r4 r8 <cis e a cis> |
  r4 r8 <fis=' a cis fis>8 | r4 r8 <fis b d fis> |
  R2 | r4 <a=' cis e a>8 r | r4\p r8_ \dCre <fis a cis fis> |
  r4 r8 <fis=' b d fis>8 | r4 r8 <b d e gis> |
  r4 r8 <cis='' e a cis>8 | r4 r8 <fis a cis fis> |
  r4 r8 <fis='' b d fis>8 | r4 r8 <d e gis> |
  <cis='' e a>8 r \ottava #1 <a'='' cis e a> \ottava #0 r |

  \ottava #1
  {{ template "rh1" (w `a=''16\(->\f`) }}
  {{ template "rh2" (w `e='''16\(->`) }}
  \ottava #0
  {{ template "rh3" (w `a=''16\(->`) }}
  e=''16\(-> fis gis fis e d cis b | a b cis b a8\) r |
  {{ template "rh1" (w `a='16\(->\p`) }}
  {{ template "rh2" (w `e=''16\(->_\dCre`) }}
  {{ template "rh3" (w `a='16\(->`) }}
  e='16\(-> fis gis fis e d cis b | a8\)\f r <a= cis e a> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \major
  {{ template "lh1" (w `a,=,8-\stBass`) }}
  {{ template "lh3" }} | a+aM! r r4 |
  {{ template "lh1" (w `a,=,8`) }}
  a=,8 r aM! r | d+b@m! r8 r4 | e8 r r e( | a)-> r a=,-> r |

  {{ template "lh2" (w `fis=,16(->-\puBass`) }}
  e,=,16(-> fis gis fis e d' cis b | a8) r a+aM! r |
  {{ template "lh2" (w `fis=,16(->`) }}
  e,=,16(-> fis gis fis e8) r | a=,8 r a+aM! r |

  {{ template "lh1" (w `a=,8-\stBass`) }}
  {{ template "lh3" }} | a, r aM! r |
  {{ template "lh3" }} | a, r aM! r |
  a=,8 r aM! r | b r bm! r | e r e7! r | a,=, r a+aM! r |
}
{{ end }}
