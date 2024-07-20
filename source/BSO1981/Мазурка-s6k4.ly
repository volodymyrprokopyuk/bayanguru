{{ define "rh1" }}
  \acc { e='8 } e'=''8[( dis a c {{ .a }} | b8 fis a gis e='4) {{ .b }} |
{{ end }}

{{ define "rh2" }}
  {{ .a }} g'16 f4 <f, g d'>-> | <e g c>8. d'16 e4 <e, g c>-> |
  <f=' a>8. d'16 a4 <f=' g b>-> |
{{ end }}

{{ define "rh3" }}
  {{ .a }} \af 8\! f'8) r e d | c8.\> \prall \af 16\! b16 a4 r8 {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key a \minor
  \time 3/4
  e'='8.->\p 16 4 4 | 4 4 4 | \acc { f='8 } e8.-> 16 4 4 | \acc { f='8 } e4 4 4 |
  {{ template "rh1" (w `b='8 \prall a]` ` \fermata`) }}
  {{ template "rh1" (w `b='8. \prall a16]` ` \fermata`) }}
  \tempo Moderato
  {{ template "rh1" (w `b='8. \prall a16]` ``) }}
  {{ template "rh1" (w `b='8. \prall a16]` ` \fermata`) }} \bar "||"

  \repeat segno 2 {
    \tempo "Tempo di mazurka"
    \repeat volta 2 {
      {{ template "rh2" (w `<b'=' d a'>8.\f`) }}
      <e=' g c>8. e'16 <c a'>4 <c e g>-> |
      {{ template "rh2" (w `<b=' d a'>8.`) }}
      <e=' g c>4 <c'='' e g c>\ff r |
    }

    \repeat volta 2 {
      {{ template "rh3" (w `e,='4(\p\<` `a='`) }}
      d=''8(\< \af 8\! f) \acc { f=''8 } a4.(\f\> \fermata \af 8\! f8) |
      e=''8.( \prall dis16 e4 c) |
      {{ template "rh3" (w `e,='4(\p\<` `ais='`) }}
      ais='8( b) \acc { b='16 dis } cis8 b cis dis |
      \acc { dis=''16 e f } %
      \afterGrace 11/16 \af 2.\! e2._(\< \trill { dis=''16 e='') } |
    }

    % \alternative {
    %   \volta 1 {
    %     %
    %   }

    %   \volta 2 { \section \sectionLabel "Coda" } %
    % }
  }

  % Coda
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
