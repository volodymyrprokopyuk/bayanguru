{{ define "rh1" }}
  {{ .a }} 8-. <fis d'>4-> | a16(-- b a g) fis8-. a=''-. |
{{ end }}

{{ define "rh2" }}
  {{ .a }} 8-. <d b'>4-> | fis16(-- g fis e) d8-. fis=''-. |
{{ end }}

{{ define "rh3" }}
  {{ .a }} <cis,=' e a>-. r8 8-. | r <d=' fis a>-. r8 8-. |
{{ end }}

{{ define "rh4" }}
  {{ template "rh2" (w .a) }}
  e=''8-. e-. cis-. e-. | d16(--\> e d cis \af 4\! b4) |
  {{ template "rh2" (w `<d='' fis>8-.\pp`) }}
  e=''16(-- fis e d) cis8-. e-. | d16(--\> e d cis \af 4\! b='4) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} 8-. <b, fis'>4-> | R2 | <fis' ais>4 <fis, cis'='> |
{{ end }}

{{ define "lh2" }}
  g=16(-- a g fis) e8-. g-. | fis16(-- g fis e {{ .a }} |
{{ end }}

{{ define "lh3" }}
  {{ template "lh1" (w `<fis''=' b>8-.`) }} | r r8 <fis' b>-. |
  {{ template "lh1" (w `<fis=' b>8-.`) }} | r4 <b= d> |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \major
  \time 2/4
  R2\f\> | \af 2\! R2 | {{ template "rh1" (w `<fis''='' a>8-.\mf`) }}
  g=''8-. g-. e-. g-. | fis16(--\> g fis e \af 4\! d4) |
  {{ template "rh1" (w `<fis='' a>8-.\mf`) }}
  g=''16(-- a g fis) e8-. g-. | fis16(-- g fis e d=''4) |

  {{ template "rh4" (w `<d='' fis>8-.\pp`) }}

  {{ template "rh3" (w `r8\f`) }}
  r8 <cis=' e a>8-. r8 8-. | r <d fis a>-. r8 <fis' a d>-. |
  {{ template "rh3" (w `r8`) }}
  r8 <cis=' e a>8-. r <cis g' a>-. | r8 <d fis a>-. <fis=' a d>4-- |

  {{ template "rh4" (w `<d'='' fis>8-.\pp`) }}

  d=''16(--\p e d cis b4) | d16(-- e d cis b4) |
  d=''16(--\< e d cis b4) | d16(-- e d cis \af 4\! b4) |
  e=''16(--\>^\tRit fis e d \af 4\! cis=''4) | R2 |

  {{ template "rh1" (w `<fis='' a>8-.\ff`) }}
  g=''16(-- a g fis) e8-. g-. | fis16(-- g fis e d4) |
  {{ template "rh1" (w `<fis='' a>8-.`) }}
  g=''16(-- a g fis) e8-. fis-. |
  d=''4-> \acc { a'=''16 b cis } <fis,='' d'>4-> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  d,=,8-.-\frBass a'-. d,-. a'-. | d,_\aSim a' d, a' |
  \rep 7 { d,=,8 a' d, a'=, | } | d,=, a' d,=,4 \clef treble |

  {{ template "lh3" }} \clef bass |

  {{ template "lh2" (w `) d=8-. fis-.`) }}
  {{ template "lh2" (w `d=4)`) }}
  {{ template "lh2" (w `) d=8-. fis-.`) }}
  g=16(-- a g fis) e8-. e-. | d4 d,=,-- \clef treble |

  {{ template "lh3" }} | g'='4.-> b,8 | fis'4.-> b,8 |
  <eis=' gis>4.-> b8 | <e g>4.-> b8 | <a= cis g'>2-- | R2 \clef bass |

  <d,= a'>8-. 8-. <d, a'>4-> | R2 | <a''= cis g'>8-. 8-. 4 |
  r4 r8 <d,= a'>8-. | 8-. 8-. <d, a'>4-> | R2 |
  <a''= cis g'>8-. 8-. 4 | r8 <d, a'>-> <d,=, a'>4-> |
}
{{ end }}
