{{ define "piece" }}

\header {
  pdftitle = "{{ .Tit }}"
  {{ if and .Com .Arr }}
    pdfauthor = "{{ .Com }} {{ .Art }}{{ .Arr }}"
  {{ else if .Arr }}
    pdfauthor = "{{ .Art }}{{ .Arr }}"
  {{ else }}
    pdfauthor = "{{ .Com }}"
  {{ end }}
  pdfsubject = \bayanURL
}

\paper {
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  oddFooterMarkup = \markup \fill-line {
    \null \if \on-last-page \logoURL \fromproperty #'page:page-number-string
  }
  evenFooterMarkup = \markup \fill-line {
    \fromproperty #'page:page-number-string \if \on-last-page \logoURL \null
  }
  scoreTitleMarkup = \markup \column {
    \fill-line { \fontsize #6 \bold "{{ .Tit }}" }
    \vspace #0.2
    \fill-line { \fontsize #2 "{{ .Sub }}" }
    \vspace #0.2
    {{ if .Meta }}
      \fill-line {
        \line {
          \caps { id: } "{{ .ID }},"
          \caps { org: } "{{ .Org }},"
          \caps { sty: } "{{ .Sty }},"
          \caps { gnr: } "{{ .Gnr }},"
          \caps { ton: } "{{ .Ton | join ` ` }},"
          \caps { frm: } "{{ .Frm | join ` ` }},"
          \caps { bss: } "{{ .Bss | join ` ` }},"
          \caps { lvl: } "{{ .Lvl }}"
        }
      }
      \vspace #0.2
    {{ end }}
    \fill-line {
      \fontsize #1 \italic "{{ .Art }}{{ .Arr }}"
      \fontsize #1 \italic "{{ .Com }}"
    }
  }
}

\score {
  \new PianoStaff = bayan {
    <<
      \new Staff = rightHand { {{ template "rightHand" }} }
      \new Staff = leftHand { {{ .StradellaLeftHand }} }
    >>
  }
}
{{ end }}
