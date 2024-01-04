{% from "util.lys" import
   prelude, logo, scoreConfig, voiceConfig, paperLayout, pieceTitleMarkup, pieceScore %}

{{ prelude() }}

{% macro bookHfMarkup() %}
  oddHeaderMarkup = \markup { }
  oddFooterMarkup = \markup {
    \if \on-first-page
      \fill-line { \null \fromproperty #'header:tagline \null }
    \if \on-last-page
      \fill-line { \null \fromproperty #'header:tagline \null }
    \fill-line { \null \fromproperty #'page:page-number-string }
  }
  evenHeaderMarkup = \markup { }
  evenFooterMarkup = \markup {
    \if \on-page #2 \fill-line { \null }
    \if \on-last-page
      \fill-line { \null \fromproperty #'header:tagline \null }
    \unless \on-page #2
      \fill-line { \fromproperty #'page:page-number-string \null }
  }
{% endmacro %}

{% macro bookTitleMarkup(book) %}
  bookTitleMarkup = \markup \column {
    {% if book.aut %}
      \vspace #2
      \fill-line { \fontsize #6 \bold "{{ book.aut }}" }
      \vspace #6
    {% else %}
      \vspace #8
    {% endif %}
    \fill-line { \fontsize #8 \bold \fromproperty #'header:title }
    \vspace #2
    \fill-line { \fontsize #4 \bold \fromproperty #'header:subtitle }
    {% if book.yr %}
      \vspace #28
      \fill-line { \fontsize #2 \bold "{{ book.yr }}" }
    {% endif %}
  }
{% endmacro %}

{% macro tocMarkup() %}
  tocTitleMarkup = \markup \column {
    \vspace #2
    \fill-line {
      \fontsize #4 \bold
      {% if args.lang == "eng" %} "Contents"
      {% else %} "Зміст"
      {% endif %}
    }
    \vspace #1
  }
  tocSectionMarkup = \markup \column {
    \fill-with-pattern #0.5 #RIGHT .
      \fontsize #1 \caps \fromproperty #'toc:text \fromproperty #'toc:page
  }
  tocItemMarkup = \markup \column {
    \fill-with-pattern #0.5 #RIGHT .
      \fromproperty #'toc:text \fromproperty #'toc:page
  }
{% endmacro %}

{% macro pieceTocItem(piece) %}
  \tocItem \markup {
    "{{ piece.tit }}"
    {% if piece.com %}
      \italic "{{ piece.com }}"
    {% endif %}
    {% if piece.arr %}
      \italic "{{ piece.art }} {{ piece.arr }}"
    {% endif %}
    \caps id: {{ piece.id }}
  }
{% endmacro %}

{% macro sectionTitleMarkup(sec) %}
  \pageBreak
  \markup \column {
    \fill-line { \fontsize #5 \bold \caps "{{ sec }}" }
    \vspace #1
  }
  \tocSection "tocSec{{ loop.index }}" \markup { {{ sec }} }
{% endmacro %}

\layout {
  {{ scoreConfig() }}
  {{ voiceConfig() }}
}

\paper {
  {{ paperLayout() }}
  {{ bookHfMarkup() }}
  {{ bookTitleMarkup(book) }}
  {{ tocMarkup() }}
  {{ pieceTitleMarkup() }}
}

\header {
  title = "{{ book.tit }}"
  subtitle = "{{ book.sub }}"
  pdftitle = "{{ book.tit }} {{ book.sub }}"
  {% if args.nologo %}
    tagline = #f
  {% else %}
    tagline = \markup { {{ logo(0.5) }} \with-url \bayanUrl \bayanUrl }
  {% endif %}
}
\pageBreak \markup \null \pageBreak

{% for bpiece in book.pieces %}
  {% if bpiece.sec %}
    {{ sectionTitleMarkup(bpiece.sec) }}
    {% for spiece in bpiece.pieces %}
      {{ pieceTocItem(spiece) }}
      {{ pieceScore(spiece, args) }}
    {% endfor %}
  {% else %}
    {{ pieceTocItem(bpiece) }}
    {{ pieceScore(bpiece, args) }}
  {% endif %}
{% endfor %}
\pageBreak
\markuplist \table-of-contents
