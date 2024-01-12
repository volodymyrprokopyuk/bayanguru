{{ define "book" }}

\header {
  pdftitle = "{{ .Tit }} {{ .Sub }}"
  pdfsubject = \bayanURL
}

\paper {
  page-breaking = #ly:minimal-breaking
  ragged-right = ##f
  ragged-last-bottom = ##f

  oddFooterMarkup = \markup \fill-line {
    \null \if \on-last-page \logoURL
    \unless \on-page #1 \fromproperty #'page:page-number-string
  }
  evenFooterMarkup = \markup \fill-line {
    \unless \on-page #2 \fromproperty #'page:page-number-string
    \if \on-last-page \logoURL \null
  }

  bookTitleMarkup = \markup \column {
    \vspace #12
    \fill-line { \fontsize #7 \bold \fromproperty #'header:tit }
    \vspace #1
    \fill-line { \fontsize #5 \bold \fromproperty #'header:sub }
    \vspace #3
    \fill-line { \logoURL }
  }

  tocTitleMarkup = \markup \column {
    \fill-line { \fontsize #4 \bold "Зміст" }
    \vspace #1
  }

  tocSectionMarkup = \markup \column {
    \vspace #0.5
    \line { \fontsize #1 \bold \caps \fromproperty #'toc:text }
    \vspace #0.3
  }

  tocItemMarkup = \markup \fill-line {
    \fill-with-pattern #0.5 #RIGHT .
    \fromproperty #'toc:text \fromproperty #'toc:page
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
        {{ template "pieceTocItem" . }}
        {{ template "pieceScore" . }}
      {{ end }}
    {{ end }}
  {{ else }} % book without sections
    {{ range .Pieces }}
      {{ template "pieceTocItem" . }}
      {{ template "pieceScore" . }}
    {{ end }}
  {{ end }}

  \pageBreak
  \markuplist \table-of-contents
}

{{ end }}
