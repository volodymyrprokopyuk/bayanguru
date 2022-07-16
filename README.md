# Music scores for bayan engraved with LilyPond

Stradella bass and free bass music quality engraving system for bayan (button
accordion) for web (HTML + SVG) and print (PDF + PS)

## Structure of the index.yaml

``` yaml
%YAML 1.2
---
sources:
  - &B0D1973
    title: Баян. Підготовча група, О. Денисов, Музична Україна, 1973
    dir: B0D1973
categories:
  - &ua_folk_song Українська народна пісня
scores:
  - title: Ой піду я до млина # mandatory
    subtitle: *ua_folk_song
    category: *ua_folk_song # mandatory for search
    composer: М. Різоль
    arranger: А. Авдієвський
    source: *B0D1973
    origin: ua
    style: [folk, classical, jazz, pop] # mandaroty (musical language)
    genre: [song, dance, piece, study] # mandatory (musical function)
    form: [melody, variations, study] # mandatory (musical structure)
    texture: [monophony, homophony, polyphony] # mandatory (number of voices)
    bass: [stradella, free_bass] # mandaroty
    level: [elementary, intermediary, advanced, virtuoso] # mandatory
    file: Ой-піду-я-до-млина-1kae # shuf -ern 4 {a..z} {0..9} | tr -d '\n'
books:
  - title: Українські народні пісні,
    subtitle: для баяна,
    file: Українські-народні-пісні-byup,
    pieces: ["1kae"]
```

