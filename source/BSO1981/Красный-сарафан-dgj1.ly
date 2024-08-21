{{ define "t4" }}
  \tuplet 3/2 { {{ .a }} } \tuplet 3/2 { {{ .b }} } %
  \tuplet 3/2 { {{ .c }} } \tuplet 3/2 { {{ .d }} } |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro moderato"
  \clef treble
  \key g \major
  \time 2/4
  <b= d>8(\p <d b'> <cis b'> <c a'>) |
  \duo { g'='8 fis16 e d8 e16 fis=' | } { b=4 c=' | }
  <b= g'>8( <d b'> <e c'> <d b'>) | <c a'>4( <c e>) |
  <c=' e>8( <e c'> <dis c'> <d b'>) |
  \duo { b'='8( a g e | <b d> <b g'> <c a'> <d fis b> | <b= d g>4) } %
  { <c'=' e>4 bes= | s2 | s4 } r4 |

  <g=' b g'>8( 8 <g b fis'> <g b e> | <d' a' d>4 <c a' c>8 8) |
  <b=' dis fis>8 8 <b dis b'>8. <a dis a'>16 | <a e' a>4( <g e' g>) |
  <b=' e b'>8 8 <b e a> <b e g> | <a c g'>4 <a c fis>8 8 |
  <g=' b>8 <g b e> <b dis g>8. <a b fis'>16 | <g=' b e>4. r8 |

  \duo {
    \mergeDifferentlyDottedOn
    g''=''8(\pp g fis e | d'4 c8 c) | fis,\( fis b8. * 10/9 a16 * 6/9 |
    a=''4 g | b8 b a g | g4 fis8 fis\) |
    b,='8 b'='' \ottava #1 g'='''8. * 10/9 fis16 * 6/9 | e='''4 s8 \ottava #0 %
  } {
    \meter Voice 1/8 1,1,1,1
    {{ template "t4" (w `g''=''16 b, g` `g' b, g` `fis' b, g` `e' b g`) }}
    \omit TupletNumber
    {{ template "t4" (w `d''='''16 a fis` `c fis a` `c a fis` `c' e, c`) }}
    {{ template "t4" (w `fis=''16 dis b` `fis' b, dis` `b' fis dis` `b dis a'`) }}
    {{ template "t4" (w `a=''16 e c` `g c e` `g e c` `g c e`) }}
    {{ template "t4" (w `b'=''16 e, b` `b' e, b` `a' e b` `g' e b`) }}
    {{ template "t4" (w `g'=''16 e c` `a c e` `fis c a` `fis' e c`) }}
    {{ template "t4" (w `b='16 e g` `b dis e='''` `\ottava #1 g=''' a, b` `dis b fis'`) }}
    \tuplet 3/2 { e='''16 g, b } \tuplet 3/2 { e g b } e=''''8 \ottava #0 %
  } r8 |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
}
{{ end }}
