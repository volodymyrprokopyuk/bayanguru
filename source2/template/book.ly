{{ define "book" }}

\header {
  pdftitle = "{{ .Tit }} {{ .Sub }}"
  pdfsubject = \bayanURL
}

\paper {
  oddFooterMarkup = \markup \fill-line {
    \null \if \on-last-page \logoURL
    \unless \on-page #1 \fromproperty #'page:page-number-string
  }
  evenFooterMarkup = \markup \fill-line {
    \unless \on-page #2 \fromproperty #'page:page-number-string
    \if \on-last-page \logoURL \null
  }
}

\book {
  \header {
    tit = "{{ .Tit }}"
    sub = "{{ .Sub }}"
  }
  \pageBreak \markup \null \pageBreak

  {{ if len .Sections }} % book with sections
    {{ range $i, $sec := .Sections }}
      \pageBreak
      \markup \column {
        \fill-line { \fontsize #6 \bold \caps "{{ .Tit }}" }
        \vspace #1
      }
      \tocSection "tocSec{{ $i }}" \markup "{{ .Tit }}"
      {{ range .Pieces }}
        {{ template "pieceScore" . }}
      {{ end }}
    {{ end }}
  {{ else }} % book without sections
    {{ range .Pieces }}
      {{ template "pieceScore" . }}
    {{ end }}
  {{ end }}

  \pageBreak
  \markuplist \table-of-contents
}

{{ end }}
