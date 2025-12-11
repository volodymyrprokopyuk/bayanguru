{{ define "lh1" }}
  {{ .a }} besM! r besM] f[ bes@M! r8 besM] |
{{ end }}

{{ define "lh2" }}
  \rep 2 { {{ .a }} d') g,-. d'=-. } | g,=,8[ gm!] d'= g@m! %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key bes \major
  \time 4/4
  \repeat segno 2 {
    d'='8(->\mp\< ees) f-. g-. a(-> bes) c-. \af 8\! d-. |
    \duo { <bes'=' d f>4->\> <g bes d>-> <g=' bes d>4-- \af 4\! <g=' a c>-- | }
    { g'='4 f ees='2 | }
    c,='8(->\< d) ees-. f-. ees(-> f) g-. \af 8\! a-. |
    \duo { <g'=' a c>4->\> <ees g a>-> <c ees g>-- \af 4\! <d=' f>-- | }
    { ees'='4 c bes=2 | }
    d,='8(-> ees) f-. g-. a(-> bes) c-. d-. |
    \duo {
      <bes'=' d f>4->\> <g bes d>-> <c ees g>-> \af 4\! <bes c ees>-> \bar "||"
    } { g'='4 f bes g=' | }
    \alternative {
      \volta 1 {
        <g,=' bes d>8(-> f) f-. g-. a(-> g) a-. g-. |
        \duo { f'='4.->\> fis8~-> fis4 \af 4\! a='-> | }
        { r8 <g= bes d>8-. 8-. r <a c d>8-. 8-. r8 <c=' d fis>-. | }

        g='4(->\p\< d)-. bes'(-> \af 4\! g)-. |
        <bes=' d>8->\> 8 <a c> <g bes> <fis a>4(-> \af 4\! d)-. |
        a'='4(->\< d,)-. a'(-> \af 4\! c)-. |
        <c='' ees>8->\> 8 <bes d> <a c> <bes d>4(-> \af 4\! g)-. |
        bes='4(->\mf\< g)-. d'(-> g,)-. |
        <bes=' d>8(-> g) <c ees> <d f> <ees='' g>4-> \af 4\! 4-> |

        c=''8(->\f d16 ees) f8-> bes,-> a(-> bes16 c) d8-> g,-> |
        \rep 2 { <a=' c>8(-> g=') } <ees f>(-> g) f-. ees='-. \bar "||"
      }
      \volta 2 { \section \sectionLabel "Coda" }
    }
  }

  <g=' bes d>8(->\< f) a-. g-. <g bes d>(-> f) a-. f-. |
  <bes,= d f>8(-> g') <bes, d f>(-> \af 8\! g') <d=' f g bes>2->\sf \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key bes \major
  {{ template "lh1" (w `bes,=,8[-\stBass`) }}
  d'=8[ bes@M! r8 besM] ees c@m! g,8 c@m! |
  f=,8[ f7! r f7] c'[ f@7! r8 f7] |
  ees=8[ c@m! r8 cm] g, c@m! f8 bes@M! |
  {{ template "lh1" (w `bes=,8[`) }}
  d'=8[ bes@M! r8 besM] c=[ cm! r cm] |

  bes=,8[ g@m! r8 gm] c[ f@7! r8 f7] |
  bes=,8[ besM! besM] r a d@7! fis8 d@7! |
  {{ template "lh2" (w `g=,8(->`) }} d=8-> ees-. d-. c-. |
  \rep 2 { d=8(-> a) d-. a=,-. } |
  d=8[ d7!] fis, d@7! g8-> d'-. ees-. d-. |
  {{ template "lh2" (w `g,=,8(->`) }} c=8-> bes-. a-. g-. |
  f=,8[ f7!] bes besM! c[ cm!] bes g@m! |
  c=8[ f@7! r8 f7] f(-> ees) d-. c=-. |

  \rep 2 { bes=,8(-> f') bes,-. f'=-. } |
   bes,=,8(-> f') bes,(-> f'=) bes,=,2-> |
}
{{ end }}
