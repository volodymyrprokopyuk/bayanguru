{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key g \major
  \time 2/4
  d'='8\mf\< g g \af 8\! b | d16(\> e d c b8) \af 8\! g |
  \rep 2 { c=''8\< e g \af 8\! e | d16(\> e d c b8) \af 8\! g=' | }
  a='16(\< b a g fis8) d | g b \af 4\! d=''4 |
  \repeat volta 2 {
    c=''16(->\p\< d c b a8) c | b16(-> c b a g8) b |
    a='16(-> b a g fis8) \af 8\! d |
    \alternative {
      \volta 1 { g='8-> b-> d=''4-> | }
      \volta 2 { g,='8-> b-> g='4-> \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g=8-\frBass <b d>8 8 g | b a g b | \rep 2 { e,=8 <g c> c, <g' c> | b a g b= | }
  c='8 cis d c | <g b> d <g b> f= | e <a c>8 8 e | d <g b>8 8 d |
  fis=8 <c' d> d, <c' d> | d, <g b>8 8 f | g-> <b d>-> <g= b d>4-> |
}
{{ end }}
