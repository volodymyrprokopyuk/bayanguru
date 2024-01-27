{{ define "lh1" }}
  {{ .a }} r g+c@M! r8 | c= cM! c+cM r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  \partial 4 { r16 g'='16\(\mf a b | }
  \repeat volta 2 {
    c=''16\< b c d e c e \af 16\! f | g8\) g g16\mf g,\(\< a b |
    c=''16 g c d e c e \af 16\! f | g8\) g g16_\dDim e( g a |
    f=''16) d( f g e) c( e g | d) b( d e c) a( c e |
    d=''16) a( b e d c b a |
    \alternative {
      \volta 1 {
        g='8) g' g16 g, %
        \sSlur nf #'((wb . 0) (ww . 2.2) (wh . 2.8) (wd . 2)) ( a='16 b |
      }
      \volta 2 {
        \hSpace g='8)\mf \sSlur nb #'((wb . 0)) ( g') c,='' r \bar "|."
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \partial 4 { r4 | }
  {{ template "lh1" (w `c+cM!8-\stBass`) }}
  {{ template "lh1" (w `c+cM!8`) }}
  b+g@M!8 r8 c+cM! r | b+e@7! r8 a+am! r |
  f+d@m!8 r8 fis+d@M! r8 | g gM! g+gM r | g=,8 gM! c+cM! r |
}
{{ end }}
