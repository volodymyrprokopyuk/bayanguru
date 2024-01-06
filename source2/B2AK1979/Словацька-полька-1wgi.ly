{{ define "rh1" }}
  \duo { cis''=''2~\sf | cis | d~\sf | d='' |
  } {
    cis''=''4.(\< \af 8\! a8 | fis4\> \af 4\1 e=') |
    d'=''4.(\< \af 8\! b8 | gis4\> \af 4\! fis=') |
  }
  e='4\mf e | <d fis> <d=' gis> |
{{ end }}

{{ define "lh1" }}
  {{ .a }} aM! e' a@M | a,8 aM! e' a@M | \rep 2 { b=,8( e@7!) e=8 e7 | }
{{ end }}

{{ define "lh2" }}
  \rep 2 { b=,8 e@7! e=8 e7 | } \rep 2 { a,=,( aM!) e'= a@M | }
{{ end }}

{{ define "lh3" }}
  \rep 2 { a,=,8 aM! e'= a@M | } \rep 2 { b=,8 e@7! e=8 e7 | }
{{ end }}

{{ define "lh4" }}
  gis,=,8 e@7! e'8 e7 | b e@7! e8 e7 | a, aM! e'= a@M |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \major
  \time 2/4
  <a'=' cis>4-.\mp 4-. | <cis e>4-. 4-. |
  \rep 2 { <b=' e>8( <b=' d>4) 8-. | }
  <gis=' b>4-. 4-. | <b d>4-. 4-. |
  \rep 2 { <a=' d>8( <a=' cis>4) 8-. | }
  <fis=' a>4-. 4-. | <a cis>4-. 4-. |
  \rep 2 { <fis=' cis'>8( <fis=' b>4) 8-. | }
  <gis=' e'>4-> e-> | <d fis>-> <d gis>-> |
  \rep 2 { <d=' b'>8( <cis=' a'>4) 8-. | }

  {{ template "rh1" }} \rep 2 { <d=' b'>8( <cis=' a'>4) 8-. | }
  {{ template "rh1" }} <d=' b'>8( <cis=' a'>4) 8-. |
  <d=' b'>8 <cis=' e a>8 8-> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \major
  {{ template "lh1" (w `a,=,8-\stBass`) }}
  {{ template "lh2" }}
  \rep 2 { fis=8 fism! cis= fis@m | } \rep 2 { b=,8( bm!) d= b@m | }
  {{ template "lh2" }}

  {{ template "lh3" (w `a,=,8`) }} {{ template "lh4" }} | a,8 aM! e' a@M |
  {{ template "lh3" (w `a,=,8`) }} {{ template "lh4" }} | a,=,8 aM! a+aM-> r |
}
{{ end }}
