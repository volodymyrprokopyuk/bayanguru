{{ define "piece" }}

\header {
  logoURL = \logoURL
}

\paper {
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  oddFooterMarkup = \markup {
    \fill-line {
      \null
      \if \on-last-page \fromproperty #'header:logoURL
      \fromproperty #'page:page-number-string
    }
  }
  evenFooterMarkup = \markup {
    \fill-line {
      \fromproperty #'page:page-number-string
      \if \on-last-page \fromproperty #'header:logoURL
      \null
    }
  }
  scoreTitleMarkup = \markup {
    \fill-line {
      \fontsize #6 \bold \fromproperty #'header:tit
    }
    \fill-line {
      \fromproperty #'header:sub
    }
  }
}

\score {
  \header {
    tit = "{{ .Tit }}"
    sub = "{{ .Sub }}"
  }

  \new PianoStaff = bayan {
    <<
      \new Staff = rightHand { {{ template "rightHand" }} }
      \new Staff = leftHand { {{ .StradellaLeftHand }} }
    >>
  }
}
{{ end }}
