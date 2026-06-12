{{ define "rh1" }}
  {{ .a }} a b8)-. a16( b c8)-. | b16( c d8)-. g,-. b-. |
  a='16( b c8)-. b-. a='-. |
{{ end }}

{{ define "rh2" }}
  <b=' d>4->\f <g b>-> | <b d>-> <g b>-> | a16(\p b c8)-. b-. a='-. |
{{ end }}

{{ define "lh1" }}
  {{ .a }} <b d>-. fis-. <c' d>-. | g-. <b d>-. b-. d-. |
  fis,=8-. <c' d>-. a-. <c=' d>-. |
{{ end }}

{{ define "lh2" }}
  \rep 2 { g=8-. b-. d='4-> | } | <c=' d>4-> 8-. 8-. |
{{ end }}

{{ define "lh3" }}
  \rep 2 { g=16( a b c d='4) | } | <c=' d>8-. 8-. 8-. 8-. |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Gaio
  \clef treble
  \key g \major
  \time 2/4
  {{ template "rh1" (w `g'='16(\p`) }} | g='-.\f b-. a4-> |
  {{ template "rh1" (w `g='16(\p`) }} | g='4. r8 |

  {{ template "rh2" }} | g='16( a b8)-. a-. g-. |
  {{ template "rh2" }} | g='4. r8 |
  {{ template "rh2" }} | g='16( a b c d4) |
  {{ template "rh2" }} | g='4. b='8\p |

  a='8-. r r <a c>-. | <g b>-. r r <g b>-. | a-. r r <a c>-. |
  <g=' b>8-. r r b-. |
  {{ template "rh1" (w `g='16(\f`) }} | g='16(^\tAcc a b8)-. a-. d-. |
  g,='16( a b8)-. a-. d-. | g,4\sf r | <g b>\sf r | g='2\sf \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \major
  {{ template "lh1" (w `g=8-.-\frBass`) }} | b=4-> d16( c b a) |
  {{ template "lh1" (w `g=8-.`) }} | b=8-. d-. g,=-. r |

  {{ template "lh2" }} | <b= d>4-> 8-. 8-. |
  {{ template "lh2" }} | b=8-. d-. g,=-. r |
  {{ template "lh3" }} | <b= d>8-. 8-. d16( c b a) |
  {{ template "lh3" }} | b=8-. d-. g,=-. r |

  \rep 4 { r8 d'='8[-. d=']-. r | }
  <g,= b d>4-> <g c d>-> | <g b d>4-> 8-. 8-. | <g c d>4-> 8-. 8-. |
  \rep 2 { <g= b d>4-> <g= c d>8-. 8-. | } | <g= b d>4 r4 | 4 r4 | 2 \fermata |
}
{{ end }}
