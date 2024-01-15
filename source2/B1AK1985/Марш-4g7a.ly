{{ define "rh1" }}
  {{ .a }} c8. d16 | e4 c8. d16 | e4-. <c a'>-. | <c g'>2-- |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Con moto"
  \clef treble
  \key c \major
  \time 2/4
  {{ template "rh1" (w `e''=''4\mf`) }}
  \duo { f''=''4( e8. e16 | d4 c='') | } { a'='2~ | a=' | }
  b='8-. r a-. r | g='4\< \af 4\! r |

  {{ template "rh1" (w `e='4\f`) }}
  \duo { f'='4( e8. e16 | d4 a'=') | } { a=2~ | a= | }
  <b= g'>8. f'16 e8-. d-. | c='4-- r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c@M!8-\stBass r8 f@M! r8 | c@M!8 r8 f@M! r8 | c@M!4 f@M!4 | c@M!2 |
  d=4 e | f d | g,8-. r d'-. r | g[-. f-. e-. d=]-. |

  \rep 2 { c+cM!8 r f+fM! r | } c+cM!4 f= | e2-- |
  d=4 e | f d= | g+gM! r | c+cM! r |
}
{{ end }}
