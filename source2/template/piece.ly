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
  oddFooterMarkup = \markup \fill-line {
    \null \if \on-last-page \logoURL \fromproperty #'page:page-number-string
  }
  evenFooterMarkup = \markup \fill-line {
    \fromproperty #'page:page-number-string \if \on-last-page \logoURL \null
  }
}

{{ template "pieceScore" . }}

{{ end }}
