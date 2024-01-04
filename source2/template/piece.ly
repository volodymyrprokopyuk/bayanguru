{% from "util.lys" import
   prelude, logo, scoreConfig, voiceConfig, paperLayout, pieceTitleMarkup,
   pieceScore %}

{{ prelude() }}

{% macro pieceHfMarkup() %}
  print-first-page-number = ##t
  oddHeaderMarkup = \markup { }
  oddFooterMarkup = \markup {
    \if \on-last-page
      \fill-line {
        \null \fromproperty #'header:tagline
        \fromproperty #'page:page-number-string
      }
    \fill-line { \null \fromproperty #'page:page-number-string }
  }
  evenHeaderMarkup = \markup { }
  evenFooterMarkup = \markup {
    \if \on-last-page
      \fill-line {
        \null \fromproperty #'header:tagline
        \fromproperty #'page:page-number-string
      }
    \fill-line { \null \fromproperty #'page:page-number-string }
  }
{% endmacro %}

\layout {
  {{ scoreConfig() }}
  {{ voiceConfig() }}
}

\paper {
  {{ paperLayout() }}
  {{ pieceHfMarkup() }}
  {{ pieceTitleMarkup() }}
}

\header {
  pdftitle = "{{ piece.tit }}"
  {% if piece.com and piece.arr %}
    pdfauthor = "{{ piece.com }} {{ piece.art }} {{ piece.arr }}"
  {% elif piece.com %}
    pdfauthor = "{{ piece.com }}"
  {% elif piece.arr %}
    pdfauthor = "{{ piece.art }} {{ piece.arr }}"
  {% endif %}
  {% if piece.sub %}
    pdfsubject = "{{ piece.sub }}"
  {% endif %}
  {% if args.nologo %}
    tagline = #f
  {% else %}
    tagline = \markup { {{ logo(0.5) }} \with-url \bayanUrl \bayanUrl }
  {% endif %}
}

{{ pieceScore(piece, args) }}
