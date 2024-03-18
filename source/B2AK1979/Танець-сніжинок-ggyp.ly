{{ define "rh1" }}
  <a='' a'>8-. r <a g'>-. r <a f'>-. r |
  <bes='' e>2. | <bes d>2. | <bes c>8-. r %
  \duo { c'''='''8-. d-. c-. d='''-. | } { bes''=''2 | }
  <bes='' c>8 r <bes='' g'>2-> |
{{ end }}

{{ define "rh2" }}
  <a='' c>8-. r %
  \duo { c'''='''8-. d-. c-. d='''-. | } { a''=''2 | }
  <a='' c>8 r <a='' f'>2-> |
{{ end }}

{{ define "lh1" }}
  {{ .a }} r fM! r fM r | c' r f@M! r8 fM r |
  g=,8 r gm! r gm r | f r g@m! r8 gm r |
  e=,8 r c@7! r8 c7 r | c' r c7! r c7 r |
  f,=,8 r fM! r fM r | f r fM! r fM r |
  f+fM!8 r d' r c r | f,=, r r4 r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key f \major
  \time 3/4
  c'='4-.\p e-._\dCre fis-. | gis-. bes-. b |
  c=''4-. e-. fis-. | gis-.^\tRit bes-. b='' |

  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      c='''8-.\mf^\tATem r a( bes b c) |
      {{ template "rh1" }}
      \alternative {
        \volta 1 { {{ template "rh2" }} }
        \volta 2 {
          <a='' f'>2.~ | <a='' f'>8 r \fine \bar "!!" %
          \volta 2
          <a='' d>8-.\p r <a='' dis>-. r |
        }
      }
    }

    \key a \minor
    \repeat volta 2 {
      <a='' e'>8-. r r4 <a a'>4~ | 8 r <a e'>-. r <a dis>-. r |
      <a='' e'>8-. r r4 <a a'>4~ | 8 r <a d>-. r <a dis>-. r |
      <c=''' e>2. | <aes g'>2. |
      \duo { e'''='''2.~ | e='''8 } %
      { c'''='''8 b, \rest a' b, \rest g' b, \rest | fis'='' } %
      r8 <fis='' d'>8-. r <fis c'>-. r |
      <f='' d'>8-. r r4 <f f'>4~ | 8 r <f d'>-. r <f c'>-. r |
      <f='' d'>8-. r r4 <f f'>4~ | 8 r <f d'>-. r <f c'>-. r |
      <aes='' bes>2. | <d, gis>2. |
      \alternative {
        \volta 1 { <c='' a'>2.~ | 8 r <a' d>-. r <a='' dis>-. r | }
        \volta 2 { <c,='' a'>2.~ | 8 r r4 r | }
      }
    }

    \key f \major
    \repeat volta 2 {
      c'='''8-> r a(-. bes-. b-. c)-. |
      {{ template "rh1" }}
      \alternative {
        \volta 1 { {{ template "rh2" }} }
        \volta 2 {
          <a='' f'>2.~ | <a='' f'>8 r \ottava #1 %
          aes'='''8-.\pp r <des,=''' des'>-. r |
        }
      }
    }

    \key des \major
    \repeat volta 2 {
      <c=''' ges' c>8-. r r4 <c ges' bes>8-. r |
      <bes='' c ees>8-. r r4 <c ges' bes>8-. r |
      <des=''' f bes>8-. r r4 <des f aes>8-. r |
      <f,='' aes des>8-. r <aes des f>-. r <des f aes>-. r |
      <bes='' ees aes>8-. r r4 <bes ees ges>8-. r |
      \alternative {
        \volta 1 {
          <ges='' bes c>8-. r <ges bes ees>-. r <bes ees ges>-. r |
          <des=''' f bes>8-. r r4 <des f aes>8-. r |
          <aes='' des f>8-. r <des f aes>-. r <f=''' aes des>-. r |
        }
        \volta 2 {
          <ges=''' bes ees>8-. \ottava #0 r r4 <ges,='' bes f'>8-. r |
          <f='' aes des>2.~ | 8 r r4 r \bar "||"
        }
      }
    }
    \keyChangeBeforeBar
    \key f \major
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  c@7!8-\stBass r8 r4 r | R2. | c@7!8 r8 r4 r | R2. |

  {{ template "lh1" (w `f,=,8`) }}

  \key a \minor
  a=,8 r am! r am r | gis r a@m! r8 am r |
  g=,8 r a@m! r8 am r | fis r a@m! r8 am r |
  a=,8 r am! r am r | bes r bes7! r bes7 r |
  a=,8 r am! r am r | d r dM! r dM r |
  bes=,8 r besM! r besM r | a r bes@M! r8 besM r |
  aes=,8 r bes@M! r8 besM r | g r bes@M! r8 besM r |
  bes=,8 r bes7! r bes7 r | e, r e7! r e7 r |
  a+am!8 r c'=8 r f, r | e+a@m!8 r8 r4 r |
  a+am!8 r f=,8 r e r | a=,8 r r4 r |

  \key f \major
  {{ template "lh1" (w `f=,8`) }}

  \key des \major
  aes=,8 r aes7! r aes7 r | c r aes@7! r8 aes7 r |
  des=8 r desM! r desM r | aes r des@M! r8 desM r |
  ees'=8 r eesm! r eesm r | aes, r aes7! r aes7 r |
  des=8 r desM! r desM r | R2. | aes8 r aes7! r aes7 r |
  des+desM!8 r bes=,8 r aes=, r | des+desM! r r4 r |
  \key f \major
}
{{ end }}
