{{ define "rh1" }}
  {{ .a }} bes ees g f8 \trill ees | ees,16 g bes ees d8 \trill c='' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} eesM! bes ees@M | g8 ees@M! bes=,8 ees@M |
{{ end }}

{{ define "lh2" }}
  c=8 cm! g c@m! | aes8 f@m! c=8 f@m |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key ees \major
  \time 2/4
  \repeat volta 2 {
    {{ template "rh1" (w `g'='16\mf`) }}
    d=''16(-> c <f aes>8)-. c16(-> bes <ees g>8)-. |
    bes='16(-> aes <d f>8)-. <c ees> <d f> |
    {{ template "rh1" (w `g,='16`) }}
    d=''16(-> c <f aes>8)-. <bes, g'> <aes f'> \codaMark 1 \bar "||"
    \alternative {
      \volta 1 { <g=' ees'>8 <bes g'> <aes f'> <aes=' bes> | }
      \volta 2 {
        <g=' ees'>8 <bes g'> \duo { g''=''8(-> f='') | } { b'='4 | }
      }
    }
  }

  \repeat volta 2 {
    <ees='' g>16(->_\markup \dAlt p f <f aes> <ees g>8)-. r8 8 |
    \rep 2 { <g='' bes>8(-> <f aes>) aes,16( bes aes='8) | }
    <f'='' aes>8(->\< <ees g>) c16 d ees \af 16\! f |
    <ees='' g>16(->_\markup \dAlt f p <f aes> <ees g>8)-. r8 8 |
    <g='' bes>8(-> <f aes>) aes,16( bes aes8) |
    <g'='' bes>8 <f aes> g16 f ees d |
    \alternative {
      \volta 1 {
        c=''8-> <ees g>-> \duo { g''=''8( f='') | } { b'='4 | }
      }
      \volta 2 {
        ees=''8-> <ees g>-> d16 c bes aes=' %
        \sRep \markup { D.C. al \coda } "e poi la Coda" \bar "||"
      }
    }
  }
  <g=' ees'>8^\sCoda <bes g'> <g=' ees'> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key ees \major
  {{ template "lh1" (w `ees=8-\stBass`) }}
  f=,8 fm! bes ees@M! | d8 bes@7! f,8 bes@7 |
  {{ template "lh1" (w `ees'=8`) }}
  f=,8 fm! bes bes7! | ees eesM! f, bes@7! | ees'8 eesM! d= g@7! |

  {{ template "lh2" }} aes=,8 f@m! c=8 f@m | g8 c@m! ees'8 c@m |
  {{ template "lh2" }} aes=,8 f@m! g8 g7! | c cm! d g@7! |
  c=8 cm! bes bes7! | ees eesM! ees= r |
}
{{ end }}
