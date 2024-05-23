{{ define "rh1" }}
  {{ .a }} <a f'> <f a>8\< \af 8\! <g=' bes>) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 3/4
  \meter 1/4 1,1,1
  {{ template "rh1" (w `<a'=' c>4(\mp`) }}
  {{ template "rh1" (w `<a=' c>4(`) }}
  <a=' c>4( <bes d>8 <a c> <g bes> <f a>) | 4(->\> \af 4\! <e g>) r |
  \repeat volta 2 {
    <e=' g>8(\< <f a> \af 8.\! <g bes>4 <e g>8 8) |
    <f=' a>8(\< <g bes> \af 8.\! <a c>4 <f a>8 8) |
    <bes=' d>8( 8 <c a>4.\> <g bes>8) | 4(-> \af 4\! <f=' a>) r |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key f \major
  f'='4-\frBass 4 8 8 | 4 4 8 8 | 4 4 e8 f | c4-> c r |
  c='8 8 4 8 8 | f8 8 4  8 8 | bes, bes c4. c8 | c4-> f=' r |
}
{{ end }}
