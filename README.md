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
    - **Flexible query langauge** that allows dynamic construction of
      fine-grained playlists for sheet music reading
    - **Built-in linter** to ensure source code quality and consistency

## Dependencies

- [Node.js](https://nodejs.org/)
- [LilyPond](https://lilypond.org/)
- [pdfcpu](https://pdfcpu.io/)

```zsh
yay -S ghostscript gsfonts fontforge t1utils texlive-langcyrillic pdfcpu
```

## CLI

Specifications and options
```bash
<catalog spec> = glob
<piece spec> = pid1 pid2 ... | --frbk bid1 bid2 ... | all
<piece select> = --org re1,^re2 --sty --gnr --frm --bss --lvl --tit --com --arr
<book spec> = bid1 bid2 ... | all
<engrave opts> = --nometa --lint --relax --dry --optimize
<play opts> = --cycle --random
<tobook spec> = --bid --btit --bsub
```

Initialize pieces

```bash
./index.js -c <catalog spec> -i <piece spec>
```

Engrave pieces

```bash
./index.js -c <catalog spec> <piece spec> <piece select> <engrave opts> -j
```

Play pieces

```bash
./index.js -c <catalog spec> -p <piece spec> <piece select> <play opts> --dry
```

Engrave books

```bash
./index.js -c <catalog spec> -b <book spec> <engrave opts> -j
./index.js -c <catalog spec> -p <piece spec> <piece select> <engrave opts> \
  --tobk <tobook spec> -j
```

Generate picece/book random ID

``` bash
shuf -ern 4 {a..z} {0..9} | tr -d '\n'
```

## Meta

``` yaml
meta:
  # ** Piece identification
  id: [mandatory, single] piece ID [a-z0-9]{4}
  org: [mandatory, single] piece or composer country [a-z]{3}
  com: [optional, single] piece composer
  arr: [optional, single] piece arranger
  art: [optional, single] arrangment type
    arr: Обр. = обробка = arrangment (default)
    ipr: Пер. = переклад = interpretation
    hrm: Гарм. = гармонізація = harmonization
  # ** Piece classification
  sty: [mandatory, single] style = group of genres
    msc: різне (default)
    flk: фолькльор
    cls: класика
    jaz: джаз
  gnr: [mandatory, single] gengre = specification of a style
    pie: п'єса (default)
    sng: пісня (group)
      chd: дитяча пісня, п'єса
      lul: колискова
      ves: веснянка
      mil: військова
      pry: припевки, частушки
      rmc: романс
    dnc: танець (group)
      plk: полька
      mzr: мазурка
      koz: козачок
      gop: гопак
      vls: вальс
      tng: танго
      mrc: марш
      gyp: циганська
    stu: етюд
  # ** Piece qualification
  frm: [mandatory, multiple] right hand
    mel: мелодія (default)
    var: варіації
    plp: поліфонія
    scl: гами
    arp: арпеджіо
    wrs: повороти кисті
    int: інтервали
      in3: терції
      in4: кварти
      in5: квінти
      in6: сексти
      in8: октави
    crd: акорди
      cr5: тризвуки
      cr7: септакорди
    lhn: ліва рука
    rep: репетиції
    orn: мелізми
    art: артикуляція
      leg: легато
      sta: стаккато
  bss: [mandatory, multiple] left hand
    stb: готовий аккорд = standard (Stradella) bass
    pub: чистий бас = pure bass
    frb: вибірна система = free bass
  lvl: [mandatory, single] piece difficulty
    el[a-c]: простий a, b, c = elementary
    in[a-c]: середній a, b, c = intermediate
    ad[a-c]: складний a, b, c = advanced
    vi[a-c]: віртуозний a, b, c = virtuoso
```
