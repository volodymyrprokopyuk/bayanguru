{{ define "rh1" }}
  {{ .a }} <e c'>16) 16( {{ .b }} <c g'>16) 16( {{ .b }} <g e'>) <e c'>-. <g d'>-. |
{{ end }}

{{ define "rh2" }}
  {{ .a }} <g d'>) <c e>-. g'-. <b, g'>-. <d a'>-. <g b>-. <f d'>-. |
{{ end }}

{{ define "rh3" }}
  {{ .a }} <g d'> <e c'> <g d'> <e c'> <g d'>) <e' c'>-. <g='' d'>-. |
{{ end }}

{{ define "rh4" }}
  {{ .a }} <e c'>16) 16( {{ .b }} <c g'>) <e, c'>( {{ .b }} <g d'>) <c e>-. g'='-. |
{{ end }}

{{ define "rh5" }}
  {{ .a }} <e c'>) <d b'>(-> <c a'>) <b gis'>-.-> <gis e'>-. <a f'>-. <gis e'>-. |
  <f=' d'>16(-> <e c'>) <d b'>(-> <c a'>) <b gis'>-.-> <gis e'>-. <e' c'>-. <d=' b'>-. |
{{ end }}

{{ define "rh6" }}
  <c=' a'>16( <e b'> <c a'> <e b'> <c a'> <e b'>) <e c'>-. <a e'>-. |
  <c='' a'>16( <e b'>) <e c'>( <a e'>) <a e'>( d) <a f'>-. e'='''-. |
{{ end }}

{{ define "rh7" }}
  <c=' a'>16( <e b'>) <e c'>( <a e'>) <c a'>16( <e b'>) <e c'>-. <a='' e'>-. |
{{ end }}

{{ define "lh1" }}
  {{ .a }} e7!16 e7 e78 d@m! | e=8 e7!16 e7 e78 e7 |
{{ end }}

{{ define "lh2" }}
  e'=8 16 16 8 8 | 8 16 16 e8 e7! | a,=, am!16 am am8 {{ .a }} |
{{ end }}

{{ define "lh3" }}
  c=16 16 8 8 8 | 16 16 16 16 8 8 | c=8 cM! g g7! |
{{ end }}

{{ define "lh4" }}
  \rep 2 { \duo { r8 cM!16 cM cM8 cM | } { c=4 r } } c8( cM!)-. g=,( g7!)-. |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro moderato"
  \clef treble
  \key c \major
  \time 2/4
  {{ template "rh1" (w `<g''='' e'>16(\p` ``) }}
  {{ template "rh1" (w `<g=' e'>16(` ``) }}
  {{ template "rh2" (w `<e= c'>16(`) }}
  {{ template "rh3" (w `<e=' c'>16(`) }}
  {{ template "rh1" (w `<g='' e'>16(` ``) }}
  {{ template "rh4" (w `<g=' e'>16(` ``) }}
  {{ template "rh2" (w `<e=' c'>16(`) }}
  <e='' c'>16( <g d'> <e c'> <g d'> <e='' c'>8) r |

  {{ template "rh1" (w `<g='' e'>16(->\mf` `->`) }}
  {{ template "rh1" (w `<g=' e'>16(->` `->`) }}
  {{ template "rh2" (w `<e= c'>16(\p`) }}
  {{ template "rh3" (w `<e=' c'>16(_\dCre`) }}
  {{ template "rh1" (w `<g='' e'>16(->` `->`) }}
  {{ template "rh4" (w `<g=' e'>16(->` `->`) }}
  {{ template "rh2" (w `<e=' c'>16(`) }}
  <e='' c'>16(\>^\tRit <g d'> <e c'> <g d'> \af 16\! <e c'>) %
  <gis='' c>16[-.\f <a f'>-. <gis='' e'>]-. |

  {{ template "rh5" (w `<f='' d'>16(->^\tATem`) }} {{ template "rh6" }}
  {{ template "rh5" (w `<f,='' d'>16(->`) }} {{ template "rh7" }}
  <a='' c e a>16 \arpeggio <c e a>16 \arpeggio %
  <c=''' e a>16 \arpeggio 16 \arpeggio 16 \arpeggio %
  <gis='' e'>16[-.\p <a f'>-. <gis='' e'>]-. |

  {{ template "rh5" (w `<f='' d'>16(->`) }} {{ template "rh6" }}
  {{ template "rh5" (w `<f,='' d'>16(->`) }} {{ template "rh7" }}
  \ottava #1
  <a='' c e a>16 \arpeggio <c e a>16 \arpeggio %
  <c=''' e a>16 \arpeggio 16 \arpeggio %
  <d=''' f b>16^\tRit \arpeggio <d f g>16 \arpeggio %
  <d=''' f g>16 \arpeggio 16 \arpeggio |

  {{ template "rh1" (w `<g=''' e'>16(^\tATem` ``) }}
  \ottava #0
  {{ template "rh1" (w `<g='' e'>16(` ``) }}
  {{ template "rh2" (w `<e=' c'>16(`) }}
  <e='' c'>16( <g d'> <e c'> <g d'> <e c'> <g d'>) <e c'>-. <g d'>-. |
  {{ template "rh1" (w `<g='' e'>16(` ``) }}
  {{ template "rh1" (w `<g=' e'>16(_\dCre` ``) }}
  {{ template "rh2" (w `<e= c'>16(`) }}
  <e=' c'>16( <g d'>) <e' c'>-. <g d'>-. <e='' c'>8 r |

  {{ template "rh1" (w `<g='' e'>16(->\ff` `->`) }}
  {{ template "rh1" (w `<g=' e'>16(->` `->`) }}
  {{ template "rh2" (w `<e= c'>16(`) }}
  {{ template "rh3" (w `<e=' c'>16(`) }}
  {{ template "rh1" (w `<g='' e'>16(->` `->`) }}
  {{ template "rh4" (w `<g=' e'>16(->` `->`) }}
  {{ template "rh2" (w `<e=' c'>16(`) }}
  <e='' c'>16(-> <g e'>) <f b>(-> <g d'>) <e='' c'>4->\sf \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=8-\stBass r r4 | c8 r r4 | c8 r g r | c r c r |
  c=8 r r4 | c8 r r4 | c8 r g r | c=[ cM! cM] r |

  c=8[( cM!)-. cM] r | c[( cM!)-. cM] r | c cM! g g7! | c[ cM! cM] r |
  c=8[ cM! cM] r | c cM! r4 | c8 cM! g g7! | c=[ cM! cM16] r r8 |

  {{ template "lh1" (w `e=8`) }} a,=,8 am!16 am am8 am | a am!16 am am8 am |
  {{ template "lh1" (w `e'=8`) }} a,=,8 am!16 am am8 am | a+am!8 r r4 |

  {{ template "lh2" (w `am`) }} | a am!16 am16 am8 r |
  {{ template "lh2" (w `r`) }} | a+am!8 r g+g7! r |

  {{ template "lh3" }} | c cM!16 cM cM8 cM |
  {{ template "lh3" }} | c cM! c+cM r |

  {{ template "lh4" }} \duo { r8 cM!16 cM cM8 cM | } { c=4 r | }
  {{ template "lh4" }} c+cM!8 c+g@7! c+cM!4 |
}
{{ end }}
