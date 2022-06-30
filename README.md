# Music scores for bayan engraved with LilyPond

## Structure of the index.yaml

``` yaml
%YAML 1.2
---
sources:
  - &bayan_0_1973 Баян. Підготовча група, О. Денисов, Музична Україна, 1973
categories:
  - &ua_folk_song Українська народна пісня
scores:
  - title: Ой піду я до млина # mandatory
    from: Скарбниця народних пісень
    composer: М. Різоль
    arranger: А. Авдієвський
    category: *ua_folk_song
    source: *bayan_0_1973
    origin: ua
    style: [folk, classical, jazz, pop] # mandaroty (musical language)
    genre: [song, dance, piece, study] # mandatory (musical function)
    form: [melody, variations, study] # mandatory (musical structure)
    texture: [monophony, homophony, polyphony] # mandatory (number of voices)
    bass: [stradella, free_bass] # mandaroty
    level: [elementary, intermediary, advanced, virtuoso] # mandatory
    file: Ой-піду-я-до-млина-1kae # shuf -ern 4 {a..z} {0..9} | tr -d '\n'
```

