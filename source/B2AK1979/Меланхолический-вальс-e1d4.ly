{{ define "rh1" }}
  \autoLineBreaksOff
  g='8.\) \shape #'((0 . 0) (0 . 1) (0 . 4.5) (0 . 0)) PhrasingSlur %
  g='16\( bes d | <g, d' g>4\< 16 \af 16\! 16 |
  \duo { aes''=''4\f g16 f | f8. ees16\> d \af 16\! ees='' | }
  { <aes'=' d>4 8 | <g=' c>4 r8 | }
  \autoLineBreaksOn
  c=''8.\) c16\( d ees='' |
{{ end }}

{{ define "lh1" }}
  g=,8 gm! gm | bes[ g@m! gm8] | b[ g@7! g78] |
  c=8 cm! cm | c cm cm | d[ g@m! gm8] | d= d7! d7 |
{{ end }}

{{ define "lh2" }}
  a=,8[ f@7! f78] | a[ f@7 f78] | bes besM! besM | bes=, besM besM |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Sostenuto
  \clef treble
  \key g \minor
  \time 3/8
  <g'=' bes d g>8\mf 8 8 | 4 d'8\(\p \bar "||"
  \repeat segno 2 {
    \volta 1
    ees=''8. d16 cis d | bes'8.\) bes16\( a g |
    g=''8. fis16 g gis | a8.\) fis16\( d ees |
    d=''8. cis16 d ees | d8.\) c16\( bes a | c8. bes16 a bes |
    {{ template "rh1" }}
    ees=''8. d16 bes g | bes8. a16 e fis | g8.\) d16\( bes' a |
    {{ template "rh1" }}
    \set subdivideBeams = ##t
    d=''16 d' c bes a g | fis ees d c bes a |
    \set subdivideBeams = ##f
    g='8\)\> r \af 8\! r | r r \fine \bar "!!" %

    \volta 2
    g='8\(\mf | g8. f16 e f | d'8. c16 g a | c8. bes16 a g | f4\) f8\( |
    ges='8. f16 e f | g8. a16 bes c | cis4. | d8\) r d\( |
    ees=''8. d16 cis d | bes'8. a16 e fis | a8. g16 fis a | g4\) g,8 |
    <g=' cis g'>8\f 16 16 8 | <bes cis bes'> <a cis a'> <g cis g'> |
    <a=' d fis>8 <fis a d>8\> 8 |
    \af 4\! 4-\sSlur nf #'((wb . 2.5) (ws . 6)) ( d'=''8)\p \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  g,=,8-\stBass d' bes | g4 r8 | g( gm!) gm | g( gm) gm |
  a=,8[_\aSim d@7! d78] | fis[ d@7 d78] |
  d'=8 d7! d7 | fis,[ d@7 d78] | g gm! gm |
  {{ template "lh1" }} | g,[ gm! d@7!] |
  {{ template "lh1" }} | g, d' bes | g=, r r |

  \rep 2 { {{ template "lh2" }} }
  d=8 d7! d7 | fis,[ d@7 d78] | g gm! gm | g gm gm |
  ees'=4. | ees4. | d8 a' fis | d=4 r8 |
}
{{ end }}
