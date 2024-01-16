{{ define "lh1" }}
  {{ .a }} bm!4 bm8 d4 b@m | e8 em!4 em8 g,=,4 e@m |
{{ end }}

{{ define "lh2" }}
  b=,8 bm!4 bm8 d4 b@m | e8( em!4) em8 g,=,8( e@m4) em8 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Sostenuto
  \clef treble
  \key b \minor
  \time 4/4
  \duo { s2\p cis'''='''4 b | b cis8 b fis'4 e | s2 <f, b>4 <e='' ais> | }
  { <b'=' d fis>2 <d fis> | <e g> <g b> | b,4 \rest <b d fis>8 8 cis=''2 | }
  \af 2.\! <d''='' fis b>2.\> \fermata r4 |

  <b='~ d_~ fis ~>2(\mp 8 d cis b | g4 e2.) |
  \duo { fis'='4.( fis8 gis4 ais | cis2 b='2) | } { e'='2 f4 e | <d=' fis>1 | }
  <fis=' b d>2(~ 8 d' cis b | g4 e <a cis> <g b>) |
  r4 <d=' fis>8\< 8 <e gis>4. \af 8\! <fis ais>8 |
  <d='~ fis_~ cis' ^(>2\> \af 4.\! <d=' fis b) > |

  \repeat volta 2 {
    <b'='~ d_~ fis ~>2(\mf 8 d cis b | g4~ <g b e>2.) |
    <g=' b e>2(~ 8 cis b a | <fis a d>2\> \af 2\! <fis ais cis>) |
    \duo { <fis'=' b_~ d ~>2 <b d>8 d cis b | } { s2 fis'=' | }
    \alternative {
      \volta 1 {
        g='4 e <a cis> <g b> | r4 <d fis>8\< 8 <e gis>4. \af 8\! <fis ais>8 |
        \duo { cis''=''4(\> \af 2\! b2) b='4 \rest | } { <d'=' fis>2. s4 | }
      }
      \volta 2 {
        \duo { g''=''4( e=''2.) | } { <b'=' cis>1 | }
        r4\f^\tRit <b=' d fis>8 8 <cis eis gis>4 <e fis ais> |
        <d='' fis cis'>2 <d='' fis b> \fermata \bar "|."
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
  {{ template "lh1" (w `b,=,8-\stBass`) }}
  fis=,4 b@m! cis+cis7!4 fis+fis7! | b=,8 bm!4 bm8 bm4 \fermata r |

  {{ template "lh1" (w `b=,8`) }}
  fis=,8 fis7!4 fis78 cis+cis7!4 fis+fis7! | b8 bm!4 bm8 d4 b@m |
  {{ template "lh2" (w `b=,8`) }}
  fis=,8 b@m!4 bm8 fis4 fis7! | b8 bm!4 bm8 d=4 b@m |

  {{ template "lh1" (w `b=,8`) }}
  a=,8 a7!4 a78 a4 a7 | d8 dM!4 dM8 fis,4 fis7! |
  {{ template "lh2" }}
  fis=,8 b@m!4 bm8 fis4 fis7! | b8 bm!4 bm8 b4 bm |
  e=8 em!4 em8 e4 em | fis, b@m! cis+cis7!4 fis+fis7! |
  b=,8 bm!4 bm8 b+bm2 \fermata |
}
{{ end }}
