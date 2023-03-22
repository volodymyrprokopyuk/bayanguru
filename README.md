# Sheet music for bayan engraved with LilyPond

Engraving system for high quality bayan sheet music in PDF with support for
Stradella bass and free bass

## Sheet music library

- **Purpose** (the reason to exist, why?). Promote and support the art of bayan
  music through free and open source sheet music content of the highest quality
- **Vision** (the goal of the purpose, what?). Become the most complete and
  comprehensive sheet music library for bayan
- **Mission** (the path to the purpose, how?). Combine the community effort to
  sheet music production with the best music engraving tools
  ([LilyPond](https://lilypond.org/))
- **Features**
    - **Free and open source** sheet music content for bayan
    - **The highest quality** engraving sheet music for Stradella system and
      free bass
    - **The most complete and comprehensive** bayan sheet music library
    - **Community effort** to sheet music production (curated list of verified
      and the most wanted pieces)
      - Platform for top quality sheet music **distribution on the web** (HTML)
      and **for print** (PDF)
    - **Indexed database** of individual sheet music pieces for sheet music
      browsing, searching and visualization
    - **Built-in linter** to ensure source code quality and consistency

## Dependencies

- [Node.js](https://nodejs.org/)
- [LilyPond](https://lilypond.org/)
- [pdfcpu](https://pdfcpu.io/)

## Catalog

``` bash
shuf -ern 4 {a..z} {0..9} | tr -d '\n' # picece / book random ID
```

## Meta

``` yaml
meta:
  # Style (sty)
  flk: фолькльор
  cls: класика
  jaz: джаз
  msc: різне
  # Genre (gnr)
  sng: пісня
  chd: дитяча пісня
  dnc: танець
  pie: п'єса
  vls: вальс
  plk: полька
  mzr: мазурка
  rmc: романс
  stu: етюд
  # Form (frm)
  mel: мелодія
  var: варіації
  plp: поліфонія
  scl: гами
  arp: арпеджіо
  wrs: повороти кисті
  rep: репетиція
  crd: аккорди
  orn: мелізми
  art: артикуляція
  lhn: ліва рука
  # Bass (bss)
  stb: готовий аккорд
  pub: чистий бас
  frb: вибірна система
  # Level (lvl)
  elm: простий
  int: середній
  adv: складний
  vir: віртуозний
  # Arrangment type (aty)
  arr: Обр. # обробка, arrangment
  ipr: Пер. # переклад, interpratation
  hrm: Гарм. # гармонізація, harmonization
```
