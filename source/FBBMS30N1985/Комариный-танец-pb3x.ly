{{ define "rh1" }}
  {{ .a }} fis16( e fis) e-. d8-. |
  \acc { cis'='''8 } d='''8-> g,16( fis {{ .b }} |
{{ end }}

{{ define "rh2" }}
  {{ .a }} d'-. fis,-. d'-. eis,-. cis'-. eis,-. cis'-. |
  e,=''16-. ais-. d(-> cis) d,-. fis-. cis'(-> b='') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key d \major
  \time 2/4
  \repeat volta 2 {
    {{ template "rh1" (w `fis''=''8->\mp` `e=''16) fis-. g-. b=''-.`) }}
    a=''16(-> b a b a) g-. fis-. e-. |
    d=''16( fis) cis-. fis-. b,-. g'-. a,-. g'-. |
    {{ template "rh1" (w `fis=''8->` `g=''16) fis-. e-. d=''-.`) }}
    \codaMark 1 \bar "||"
    cis=''16(-> d) e-. cis(-> d) e-. cis(-> d) |
    \alternative {
      \volta 1 { e=''16(-> fis) g-. b-. a(-> g) fis-. e=''-. | }
      \volta 2 {
        e=''16(-> fis) gis-. ais-. b8-> %
        \ottava #1 \acc { ais'='''8 } b='''-> \ottava #0 |
      }
    }
  }

  {{ template "rh2" (w `fis,=''16-.\pp`) }}
  cis,=''16-. e-. a-. g-. b-. ais-. cis-. b-. |
  d='''16(-> cis) e-. d-. cis(->\< <eis,='' fis>16) 16-. \af 16\! 16-. |
  {{ template "rh2" (w `fis=''16-.\mf`) }}
  a=''16-. cis, a'(-> b) a-. d,-. a'(-> b) |
  a=''16( ais) b-. d-. cis(-> <g='' a>16) 16-. 16-. \segnoDC \bar "||"

  e=''16(->^\segnoCoda fis) g(-> a) b(-> a) b-. a-. |
  <b='' cis d>16-> 16-. 16-. a-. \acc { a=''8 } d='''4-> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key d \major
  d'='8->-\frBass <a' b>-. a,-. <a' b>-. |
  \rep 2 { e='8-> <a b>-. cis,-. <a' b>-. | }
  d,='8-> <a' b>-. e-. <g a>-. | d-> <a' b>-. a,-. <a' b>-. |
  e='8-> <a b>-. cis,-. <a'=' b>-. |
  <g=' a b>16-> r8 16-> r8 16-> r16 | 16-> r16 r16 16-. <g a cis>-> r r8 |
  ais='8-> fis-. \duo { r8 d''=''8 | } { b'='4 | }

  <b=' d>8_\aSta 8 <b cis>8 8 | <ais cis> fis <b d> g |
  <g=' a>8 e <d fis>8 8 | <e g>-> b'-. <e, fis>-> r |
  <b'=' d>16_\aSta 16 16 r <b cis>16 16 16 r | <ais cis>16 16 r8 <b d>16 16 r8 |
  <g=' a>16 16 cis, r <fis a>16 16 d r | <g=' a>16-> 16-. r8 16-> r r8 |

  <g=' a b>16-> r8 16-. 16-> r r8 | r8. <g a cis>16-. r8 <cis='' d>8-> |
}
{{ end }}
