# Sheet music for bayan engraved with LilyPond

Engraving system for high quality bayan sheet music in PDF with support for
Stradella bass and free bass

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
