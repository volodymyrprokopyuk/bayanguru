{{ define "rh1" }}
  b='8 d4 d8 | d c4 fis,8 | b4. b8 | ais g' fis e='' |
{{ end }}

{{ define "rh2" }}
  c=''16 gis a b c b c e | d a' fis e d c a ais |
  b='16 fis g a b ais b d | d c b c fis e c a |
  a='16 g fis g fis' e b g | fis g' fis e dis cis dis e='' |
{{ end }}

{{ define "rh3" }}
  <c='' d fis>8 <c d g>16 <c d fis> <c d e>8 <c='' d fis> |
{{ end }}

{{ define "lh1" }}
  a,=,4 am! | d d7! | g, gM! | a am! | b=, e@m! |
{{ end }}

{{ define "lh2" }}
  fis=,4 fis7! | b bM! | e= e7! {{ .a }} |
{{ end }}

{{ define "lh3" }}
  a,=,8 am! am am | d d7! d7 d7 | g, gM! gM gM | a am! am am |
  b=,8 e@m! em8 em | fis fis7!4 fis78 | b bM! bM bM | e= e7! e7 e7 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key e \minor
  \time 2/4
  R2\p | r4 r8 b'='8 | b4 g' | fis4. e8 | d4. c8 |
  {{ template "rh1" }} dis=''4. dis8 | e4 d | c4. e8 | d4. c8 |
  {{ template "rh1" }} dis=''4. \af 8\! <a=' b dis>8\< |

  \af 8.\! <gis=' b e>4\< \af 4\! <d' gis b>\> \fermata |
  <c='' e a>4. <c e g>8 | {{ template "rh3" }}
  <b=' d a'>4 <b d g>8. 16 | <a c fis>8 <a c e> <e a c> fis |
  <g=' b>4. 8 | <fis ais cis>4 <a b dis> | <g b e>4. b='8 |

  b='16 b' a g fis e ais, b | {{ template "rh2" }}
  fis=''16 b, cis dis e fis g a | b a gis f e d c b |
  {{ template "rh2" }} fis=''16 a, ais b c\< cis d \af 16\! dis='' |

  <gis,=' b e>4\f <d' gis b> | <c e a>4. <c e g>8 |
  {{ template "rh3" }}
  <b=' d a'>4\< \af 8\! <b d g>8 r16 \fermata 16\p |
  <a=' c fis>8 <a c e> <e a c> fis | <g b>4. 8 |
  <fis=' ais cis>4^\tRit <a b dis> |
  <g=' b e>2 | <g'='' b e>4 \fermata r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  e=4-\stBass em! \rep 2 { e=4 em | }
  {{ template "lh1" }} {{ template "lh2" (w ``) }}
  {{ template "lh1" }} {{ template "lh2" (w ` \fermata`) }}

  {{ template "lh1" }} fis=,4 b | e= em! |

  e=8 em! em em | {{ template "lh3" }} {{ template "lh3" }}

  a,=,8 am! am am | d d7! d7 d7 |
  g,=,8 gM! gM r \fermata | a am! am am |
  b=,8 e@m! em8 em | fis fis7! b b7! |
  e=8 em! em em | e@m!4-\fermata r4 |
}
{{ end }}
