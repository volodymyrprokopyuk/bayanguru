{{ define "rh1" }}
  \acc { e='8 } e'=''8[( dis a c {{ .a }} | b8 fis a gis e='4) {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key a \minor
  \time 3/4
  e'='8.->\p 16 4 4 | 4 4 4 | \acc { f='8 } e8.-> 16 4 4 | \acc { f='8 } e4 4 4 |
  {{ template "rh1" (w `b \prall a]` `\fermata`) }}
  {{ template "rh1" (w `b8. \prall a16]` `\fermata`) }}
  \tempo Moderato
  {{ template "rh1" (w `b8. \prall a16]` ``) }}
  {{ template "rh1" (w `b8. \prall a16]` `\fermata`) }} \bar "||"

  \repeat segno 2 {
    %

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
