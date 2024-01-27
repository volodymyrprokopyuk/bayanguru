{{ define "rh1" }}
  {{ .a }} c'8 a | b4 a8 g | fis[ a g fis='] |
{{ end }}

{{ define "rh2" }}
  {{ .a }} fis | g4 fis8 e | dis[ fis e b=] |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key e \minor
  \time 2/4
  {{ template "rh1" (w `e'='4\(\p`) }} | g4 e\) |
  {{ template "rh1" (w `e='4\(`) }} | g4\) g8\( b=' |

  \repeat volta 2 {
    e=''4. d8 | c4. b16 c | d8[ d d e] | b4 a8 g\) |
    {{ template "rh1" (w `fis='4\(`) }}
    \alternative {
      \volta 1 {
        e='4\) g8 \sSlur nf #'((wb . 3) (ws . 1.5) (ww . 1.5)) ( b=') %
        \sSlur nb #'((wb . -0.5) (ws . 8)) ( |
      }
      \volta 2 { \hSpace e,='2) \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  {{ template "rh2" (w `e'='4\(-\frBass a8`) }} | e2\) |
  {{ template "rh2" (w `e='4\( a8`) }} | e4\) e8_\( g=' |

  c=''4. b8 | a4. g16 a | b4. a8 | g4 fis8 e\) |
  {{ template "rh2" (w `b=4\( a'8`) }} | e4\) e8 %
  \sSlur uf #'((wb . 3) (ww . 1.8)) ( g) %
  \sSlur ub #'((wb . 3) (ws . 8)) ( | e='2) |
}
{{ end }}
