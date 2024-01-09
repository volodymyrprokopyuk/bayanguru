# High quality sheet music for bayan

Bayan is an engraving system that produces high quality sheet music in PDF for
bayan. The system uses [LilyPond](https://lilypond.org/) for engraving
and supports Stradella bass and free bass

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
    - **Flexible query language** that allows dynamic construction of
      fine-grained playlists for sheet music reading
    - **Built-in linter** to ensure source code quality and consistency
    - **Clean codebase** for easy maintenance and flexible extension

## Dependencies

- [LilyPond](https://lilypond.org/)
- [Go](https://go.dev/)

```fish
yay -S ghostscript gsfonts fontforge t1utils \
  texlive-metapost texlive-langcyrillic
```

## Meta

```yaml
meta:
  # ** Piece identification
  id: [mandatory, single] [a-z0-9]{4} piece ID
  org: [mandatory, single] [a-z]{3} piece or composer country
  com: [optional, single] piece composer
  arr: [optional, single] piece arranger
  art: [optional, single] arrangment type
    arr: Обр. = обробка = arrangment (default)
    ipr: Пер. = переклад = interpretation
    hrm: Гарм. = гармонізація = harmonization
  # ** Piece classification
  sty: [mandatory, single] style = group of genres
    msc: різне (default) = miscellaneous
    flk: фолькльор = folk
    cls: класика = classical
    jaz: джаз = jazz
    aut: авторська п'єса = author piece
  gnr: [mandatory, single] gengre = specification of a style
    pie: п'єса (default) = piece
    sng: пісня (group) = song
      chd: дитяча пісня, п'єса = child
      lul: колискова = lullaby
      ves: веснянка
      pry: припевки, частушки
      rmc: романс = romance
      mil: військова = military
    dnc: танець (group) = dance
      plk: полька = polka
      mzr: мазурка = mazurka
      koz: козачок
      gop: гопак
      vls: вальс = valse
      tng: танго = tango
      mrc: марш = march
      gyp: циганська = gypsy
    stu: етюд = study
  # ** Piece qualification
  ton: [mandatory, multiple] тональність = tonality
    [a-g](is|es)j: дієз/бемоль мажор = sharp/flat major
    [a-g](is|es)i: дієз/бемоль мінор = sharp/flat minor
  frm: [mandatory, multiple] права рука = right hand
    mel: мелодія (default) = melody
    var: варіації = variation
    prh: поліритмія = polyrithm
      tu3: тріолі = triplet
      tu5: квінтолі = quintuplet
      dot: пунктирний ритм = dotted rhythm
      syn: синкопа = syncopation
    orn: мелізми = ornamentation
      rep: репетиція = repetition
      tre: тремоло = tremolo
      acc: форшлаг = acciaccatura
      mor: мордент = mordent
      gru: групето = gruppetto
      tri: трель = trill
      gli: глісандо = gissando
    pph: поліфонія = polyphony
      vo2: двоголосся
      vo3: триголосся
    scl: гами = scales
    arp: арпеджіо = arpeggio
    int: інтервали = invervals
      in3: терції = thirds
      in4: кварти = forths
      in5: квінти = fifths
      in6: сексти = sixths
      in8: октави = eighths
    crd: акорди = chords
      cr5: тризвуки = triads
      cr7: септакорди = seventh chords
    wrs: повороти кисті = wrist movements
      fi1: перший палець = first finger
      fi5: п'ятий палець = fifth finger
      jmp: скачки = jumps
  bss: [mandatory, multiple] ліва рука = left hand
    stb: готовий аккорд = standard (Stradella) bass
    pub: чистий бас = pure bass
    frb: виборна система = free bass
  lvl: [mandatory, single] piece difficulty
    el[a-c]: простий a, b, c = elementary
    in[a-c]: середній a, b, c = intermediate
    ad[a-c]: складний a, b, c = advanced
    vi[a-c]: віртуозний a, b, c = virtuoso
```
