{{ define "rh1" }}
  {{ .a }} f bes {{ .b }} f c' {{ .b }} f, %
  des'=''16 {{ .b }} f, c' {{ .b }} f, bes {{ .b }} f |
  aes='16 {{ .c }} f bes f c' f, des' f, c' f, bes f) |
  aes='16( f f' f, ees' f, des' f, c' f, bes f=' |
{{ end }}

{{ define "rh2" }}
  \rep 2 {
    {{ .a }} r f(\p c g' c,] aes' c, bes' c, c') r |
    <des,=' g c>16[->\mf r bes'(\p des, aes' des,] g des f des ees=') r |
  }
{{ end }}

{{ define "rh3" }}
  aes='16 c, g' c, f b, e c g' c, c') r |
  {{ template "rh1" (w `aes='16(` `` ``) }}
  g='16 ees ees' ees, des' ees, c' ees, bes' ees, aes ees) |
  f='16( des des' des, c' des, bes' des, aes' des, g des |
  f='16 c c' c, e c f[) r g( aes bes c=''] |
{{ end }}

{{ define "lh1" }}
  f,=,8-\puBass g_\aSta aes bes aes g | f g aes bes aes g |
  f=,8 des' c bes aes g | f ees' des c r r |
  \rep 2 { f,=,8 g aes bes aes g=, | }
  f=,8 g a bes c des | ees, f g aes bes c |
  des,=,8 ees f g aes bes | c+f@m! r8 c+c7! f+fm! r r |
  bes=,8 f ges g aes bes=, |

{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Agitato
  \clef treble
  \key f \minor
  \time 6/8
  {{ template "rh1" (w `aes'='16(->\f` `->` `_ \aSim`) }}
  {{ template "rh3" }}
  ees=''16[) r des( des, c' des,] bes' des, aes' des, g des |
  f='16 c des c e c f='8) r r |

  {{ template "rh2" (w `<c=' ees>16[->\mf`) }}
  <c=' ges' aes>16[\mf r c'(\p aes des aes] ees' aes, f' aes, ees') r |
  <f,=' ees'>16[\sf r des'(\p f, c' f,] des' f, ees' f, des') r |
  <d,=' aes' bes>16[\sf r d'(\p bes ees bes] f' bes, g' bes, f') r |
  <g,=' des' f>16[\sf r ees'(\p g, d' g,] des'\> g, bes des, \af 16\! g=') r |

  {{ template "rh2" (w `<c,=' ees>16[->\mf`) }}
  <c=' ges' aes>16[\sf r c'(\p aes des aes] ees' aes, f' aes, ees' aes,) |
  ees'=''16( f, des' f, c' f, ees' f, des' f, bes f) |
  aes='16( ees g ees aes ees <g c> ees g ees <g bes> ees |
  aes='16 ees aes ees c' ees, aes='8) r r |

  r8 \ff des,='16( c e c g' c, c' c, des c) |
  r8 des='16( c f c aes' c, c' c, des c) |
  r8 <e c'>16( c des c) r8 <f c'>16( c des c) |
  r8 <e=' c'>16( c des c des^\tRit c d e f g=') |

  {{ template "rh1" (w `aes='16(->\f^\tATem` `` ``) }}
  {{ template "rh3" }}
  ees=''16[) r des( des, c' des,] bes' des, aes' des, g) r |
  <des=' f>16( bes des bes <c e> bes <aes= c f>8) r r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \minor
  {{ template "lh1" }} | c+f@m! r8 c+c7! f+fm! f=, r |

  aes=,8->-\stBass aesM! aesM aesM aesM aesM |
  ees'=8-> eesM! eesM eesM eesM eesM |
  aes,=,8_\aSim aesM! aesM aesM aesM aesM |
  ees'=8 eesM! eesM eesM eesM eesM |
  aes,=,8 aes7! aes7 aes7 aes7 aes7 |
  des=8 desM! desM desM desM desM |
  bes=,8 bes7! bes7 bes7 bes7 bes7 |
  ees=8 eesM! eesM eesM4. |

  \rep 2 {
    aes,=,8 aesM! aesM aesM aesM aesM |
    ees'=8 eesM! eesM eesM eesM eesM |
  }
  aes,=,8 aes7! aes7 aes7 aes7 aes7 |
  des=8 desM! desM bes@m![ besm8 besm] |
  ees=8[ aes@M! aesM8] ees ees7! ees7 |
  aes@M!8 r8 ees( aes,=,) r r |

  c=8 cM! cM cM cM cM | c[ f@m! fm8] fm fm fm |
  c@7!4. f@m!4. | c@M!8 r8 r r4. |

  {{ template "lh1" }} | c=8 r8 c+c7! f+fm! f,=, r |
}
{{ end }}
