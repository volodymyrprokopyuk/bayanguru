{{ define "rh1" }}
  {{ .a }} <a c f> <bes d g> a'16 \af 16\! g |
  <c,=' f a>8\> <f a d> \af 4\! <e=' g c>4 |
{{ end }}

{{ define "rh2" }}
  <a,= c>8\< <a c f> <bes d g> a'16 \af 16\! g |
  <a,= c f>8\> d \af 4\! {{ .a }} |
{{ end }}

{{ define "rh3a" }}
  {{ .a }} c) d(-> \af 8\! c) | d(-- {{ .b }}\> c) \af 4\! f=''4-- |
{{ end }}

{{ define "rh3b" }}
  {{ .a }} <f a> | <e bes'> <a=' c> |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Moderato cantabile"
  \clef treble
  \key f \major
  \time 2/4
  {{ template "rh1" (w `<a= c>8\mf\<`) }}
  {{ template "rh2" (w `<bes= d c>4`) }}
  {{ template "rh1" (w `<a= c>8\<`) }}
  {{ template "rh2" (w `<a= c f>4`) }}

  \duo {
    {{ template "rh3a" (w `d''=''8(->\mp\>` `\mp`) }}
    d=''8(->\mp\> c) d(-> \af 8\! c) |
    g'=''8--\mp\> c,-- f-- \af 8\! c=''-- |
    {{ template "rh3a" (w `d=''8(->\p\>` `\p`) }}
    d=''8(->\p\> c) d(-> \af 8\! c) |
    g'=''8--\p\>^\tRit c,-- \af 4\! f=''4 \fermata \bar "|."
  } {
    {{ template "rh3b" (w `<e'=' bes'>4`) }}
    <e=' bes'>4 <f a> | <bes d>8 <bes d> <a c> <f=' a> |
    {{ template "rh3b" (w `<e=' bes'>4`) }}
    <e=' bes'>4 <f a> | <bes d>8 <bes d> <a=' c>4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
}
{{ end }}
