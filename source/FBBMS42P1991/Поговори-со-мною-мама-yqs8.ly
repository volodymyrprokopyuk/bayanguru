{{ define "rh1a" }}
  r8 {{ .a }} f e g f f e | d( c) b=2. |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Tranquillo
  \clef treble
  \key d \minor
  \time 4/4
  r8\p a'='8( f' d a' e f d) | r a( f' d a' e f d) |
  \repeat volta 2 {
    \duo {
      {{ template "rh1a" (w `f'='8`) }} | r8 e='8 e d f e e d |
      r4 a'='8( f b b, g' f) | {{ template "rh1a" (w `f='8`) }}
      r8 f'='8 e d f e e d | a4 a'8( g cis a cis g'='') |
    } { a=1 | e | gis2 a4 cis | d1 | a | e | gis | cis=' }
    fis=''8 <fis, a>[( <g bes> <a c>] 8 <fis a> <a c> <bes d>) |
    <a=' c>4(~ \tuplet 3/2 { 8 <bes d> <a c> } <g bes>2) |
    r8 \duo { <g'=' bes>8 <a c> <g bes>8 <g bes>8 <f a> g bes=' | }
    { s4. s4 e'='4 | } | <f=' a>2( <fis=' c'>) |

    r8 \duo {
      d'='8( <e c'> <d bes'> <c a'> <bes g'> f' e) | f( e d2.) |
      bes'='8 \rest <g bes>( <d a'> <bes g'> f' e cis e=') |
    } { s4. s4 bes=4 | g d'8( c bes=2) | s2 a= | }
    \alternative {
      \volta 1 {
        \time 3/4
        \meter 1/4 1,1,1
        \duo { d'='2. | } { d'='8 <a' f'>8 8( <bes g'>8) 8( <a=' f'>) | }
        <cis'='' a'>8( <bes g'>8) 8( <a f'>) <bes g'>( <g e'>) |
        r8 <a=' f'>8 8( <g e'>) <bes g'>( <a f'>) |
        <a=' f'>( <g e'>8) 8( <f d'>) <g e'>( <e=' cis'>) |
      }
      \volta 2 {
        \time 4/4
        \meter 1/2 1,1
        \duo { d'='1 | } { r8 a'='8( f' d a' e f d='') | }
        r8 <fis=' a>8( <g bes> <a c>8 8 <fis a> <a c> <bes=' d>) |
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
}
{{ end }}
