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
  a=''16( ais) b-. d-. cis(-> <g='' a>16) 16-. 16-. %
  \sRep \markup { D.C. al \coda } "e poi la Coda" \bar "||"

  e=''16(->^\sCoda fis) g(-> a) b(-> a) b-. a-. |
  <b='' cis d>16-> 16-. 16-. a-. \acc { a=''8 } d='''4-> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
}
{{ end }}
