{{ define "book" }}
  {{ range .Sections }}
    {{ range .Pieces }}
      {{ .RightHand }}
      {{ .LeftHand }}
    {{ end }}
  {{ end }}
{{ end }}
