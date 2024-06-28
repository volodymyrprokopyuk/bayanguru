{{ define "rh1" }}
  <bes,= d g>8\< bes' <g, c ees> \af 16.\! a' <fis,= c' d>4~\> 8) \noBeam \af 8\! %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Andante cantabile"
  \clef treble
  \key g \minor
  \time 4/4
  \meter 1/4 1,1,1,1
  \partial 8 { bes'='8(\mp | }
  \repeat segno 2 {
    \volta 1
    {{ template "rh1" }} bes'='8( | {{ template "rh1" }} d''( |
    <d,=' f bes>8\< d' <bes, ees g> \af 16.\! c' %
    <a,= ees' f>4~\> 8) \noBeam \af 8\! d'( |
    <d,=' f bes>8\< d' <bes, ees g> c' <a, ees' f> \af 16.\! a' %
    <fis,= c' d>8)\> \af 8\! bes'='8( |
    \rep 2 { <bes,= d g>8\< \af 16.\! bes' <g, cis>)\> \af 16.\! bes'='( } %
    <bes,= d g>8)\>^\tRit bes'( <a, c fis>) \af 8\! a'( <bes,= d g>4~\p 8) r %
    \keyCancelBarChange
    \key d \minor
    \fine |

    % \volta 2
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
}
{{ end }}
