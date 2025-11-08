package catalog

import (
	"errors"
	"fmt"
	"io"
	"math/rand/v2"
	"os"
	"path/filepath"
	"regexp"
	"slices"
	"strings"

	"golang.org/x/text/collate"
	"golang.org/x/text/language"
	"gopkg.in/yaml.v3"
)

var metaSub = map[string]string{
  // Piece subtitle (sub)
  "ukrfs": "Українська народна пісня",
  "ukrfsvar": "Варіації на тему української народної пісні",
  "ukrfd": "Український народний танець",
  "rusfs": "Російська народна пісня",
  "rusfsvar": "Варіації на тему російської народної пісні",
  "rusfd": "Російський народний танець",
  "blrfs": "Білоруська народна пісня",
  "blrfd": "Білоруський народний танець",
  "hunfs": "Угорська народна пісня",
  "hunfd": "Угорський народний танець",
  "mdafs": "Молдавська народна пісня",
  "mdafd": "Молдавський народний танець",
  "roufs": "Румуньска народна пісня",
  "roufd": "Румунський народний танець",
  "polfs": "Польська народна пісня",
  "polfd": "Польський народний танець",
  "czefs": "Чеська народна пісня",
  "czefd": "Чеський народний танець",
  "svkfs": "Словацька народна пісня",
  "svkfd": "Словацький народний танець",
  "stu": "Етюд",
  // Piece arrangement type (art)
  "arr": "Обр. ", // обробка = arrangement (default)
  "ipr": "Пер. ", // переклад = interpretation
  "hrm": "Гарм. ", // гармонізація = harmonization
}

var metaDesc = map[string]string{
  // Origin
  "ukr": "Укр.",
  "rus": "Рос.",
  "blr": "Біл.",
  "hun": "Угор.",
  "mda": "Мол.",
  "pol": "Пол.",
  "cze": "Чес.",
  "svk": "Слов.",
  "svn": "Слов.",
  "lva": "Лат.",
  "ltu": "Лит.",
  "est": "Ест.",
  "aut": "Авст.",
  "deu": "Нім.",
  "dnk": "Дац.",
  "fra": "Фран.",
  "swe": "Швед.",
  // Style
  "flk": "нар.",
  "cus": "авт.",
  "cls": "клас.",
  // Genre
  "sng": "пісня.",
  "chd": "дитяча п'єса.",
  "lul": "колискова.",
  "ves": "веснянка.",
  "kol": "колядка.",
  "pry": "коломийка.",
  "rmc": "романс.",
  "mil": "віськ. пісня.",
  "dnc": "танець.",
  "plk": "полька.",
  "mzr": "мазурка.",
  "qdr": "кадриль.",
  "men": "менует.",
  "koz": "козачок.",
  "gop": "гопак.",
  "vls": "вальс.",
  "tng": "танго.",
  "mrc": "марш.",
  "pie": "п'єса.",
  "inv": "інвенція.",
  "can": "санон.",
  "pre": "прелюдія.",
  "gyp": "циг. п'єса.",
  "stu": "етюд.",
  // Bass
  "frb": "Виборна система.",
  "stb": "Готовий акорд.",
  "pub": "Чистий бас.",
  // Level
  "ela": "Рівень простий A",
  "elb": "Рівень простий B",
  "elc": "Рівень простий C",
  "ina": "Рівень середній A",
  "inb": "Рівень середній B",
  "inc": "Рівень середній C",
  "pra": "Рівень складний A",
  "prb": "Рівень складний B",
  "prc": "Рівень складний C",
  "via": "Рівень віртуозний A",
  "vib": "Рівень віртуозний B",
  "vic": "Рівень віртуозний C",
}

type StrSlice []string

func (ss *StrSlice) UnmarshalYAML(node *yaml.Node) error {
  var slc []string
  err := node.Decode(&slc) // Try decoding a string slice
  if err != nil {
    var str string
    err := node.Decode(&str) // Try decoding a single string
    if err != nil {
      return err
    }
    *ss = []string{str} // Convert the single string into a string slice
    return nil
  }
  *ss = slc // Return the string slice
  return nil
}

type Piece struct {
  ID string `yaml:"id"`
  Tit string `yaml:"tit"`
  Sub string `yaml:"sub"`

  Com string `yaml:"com"`
  Arr string `yaml:"arr"`
  Art string `yaml:"art"`
  UkrArt string
  Aut string `yaml:"aut"`

  Src string `yaml:"src"`
  Lcs string `yaml:"lcs"`

  Org string `yaml:"org"`
  Sty string `yaml:"sty"`
  Gnr string `yaml:"gnr"`

  Ton StrSlice `yaml:"ton"`
  Frm StrSlice `yaml:"frm"`
  Bss StrSlice `yaml:"bss"`

  Lvl string `yaml:"lvl"`
  Ens string `yaml:"ens"`

  Desc string

  File string
  LyricsFile string
  URL string
  Meta bool
  // ens: sol
  RightHand, LeftHand string
  // ens: duo
  RightHandOne, LeftHandOne string
  RightHandTwo, LeftHandTwo string
  // ens: vc1
  Vocal string
  Lyrics string
  // ens: vc2
  VocalOne, VocalTwo string
  // publish
  AlphaLink string
}

func PrintPiece(w io.Writer, piece *Piece) {
  tit := piece.Tit
  com := fmt.Sprintf("%s %s%s", piece.Com, piece.UkrArt, piece.Arr)
  com = strings.TrimSpace(com)
  titLen, comLen := len([]rune(tit)), len([]rune(com))
  maxTit := 53 - comLen
  if titLen > maxTit {
    tit = string([]rune(tit)[:maxTit - 1]) + "…"
    titLen = maxTit
  }
  spaceLen := 53 - titLen - comLen
  _, _ = fmt.Fprintf(
    w, "%s %s %s %s %s %s %s %s %s\n",
    GreenTit("%s", piece.ID),
    YellowTit("%s", tit),
    strings.Repeat(" ", spaceLen),
    BlueTit("%s", com),
    YellowSub("%s", piece.Org),
    GreenSub("%s", piece.Sty),
    GreenSub("%s", piece.Gnr),
    RedSub("%s", bass(piece.Bss)),
    BlueSub("%s", piece.Lvl),
  )
}

var reCatFile = regexp.MustCompile(`^\w+-\w+\.yaml$`)

func listCatalogFiles(catDir, catQuery string) ([]string, error) {
  entries, err := os.ReadDir(catDir)
  if err != nil {
    return nil, err
  }
  files := make([]string, 0, 50)
  for _, entry := range entries {
    name := entry.Name()
    if entry.Type().IsRegular() && strings.HasSuffix(name, ".yaml") &&
      reCatFile.MatchString(name) && strings.Contains(name, catQuery) {
      files = append(files, name)
    }
  }
  return files, nil
}

func readCatalogFile(catFile string) ([]*Piece, error) {
  file, err := os.Open(catFile) //nolint:gosec,gocritic
  if err != nil {
    return nil, err
  }
  defer func() {
    _ = file.Close()
  }()
  var pieces struct { Pieces []*Piece `yaml:"pieces"` }
  err = yaml.NewDecoder(file).Decode(&pieces)
  if err != nil {
    return nil, err
  }
  return pieces.Pieces, nil
}

func FormQuery(form, query []string) bool {
  return slices.ContainsFunc(form, func(frm string) bool {
    return slices.Contains(query, frm)
  })
}

func FrmScale(frm []string) bool {
  scl := []string{"scl", "seq", "cro"}
  return FormQuery(frm, scl)
}

func FrmArpeggio(frm []string) bool {
  arp := []string{"arp", "lng", "srt", "brk"}
  return FormQuery(frm, arp)
}

func FrmInterval(frm []string) bool {
  inv := []string{"in3", "in4", "in5", "in6", "in7", "in8"}
  return FormQuery(frm, inv)
}

func FrmChord(frm []string) bool {
  crd := []string{"cr5", "cr7"}
  return FormQuery(frm, crd)
}

func FrmPolyphony(frm []string) bool {
  pph := []string{"vo2", "vo3"}
  return FormQuery(frm, pph)
}

func FrmPolyrhythm(frm []string) bool {
  prh := []string{"syn", "tu3", "tu5", "tu6"}
  return FormQuery(frm, prh)
}

func FrmOrnament(frm []string) bool {
  orn := []string{"tre", "acc", "mor", "gru", "tri", "gli", "cad"}
  return FormQuery(frm, orn)
}

func FrmLeftHand(frm []string) bool {
  return slices.Contains(frm, "pub")
}

func pieceDesc(piece *Piece) string {
  desc := make([]string, 10)
  // Origin, style, genre
  desc = append(
    desc, metaDesc[piece.Org], metaDesc[piece.Sty], metaDesc[piece.Gnr],
  )
  // Bass
  for _, bss := range []string{"frb", "stb", "pub"}{
    if slices.Contains(piece.Bss, bss) {
      desc = append(desc, metaDesc[bss])
    }
  }
  // Study form
  if piece.Gnr == "stu" {
    frm := append([]string{}, piece.Frm...)
    frm = append(frm, piece.Bss...)
    if FrmScale(frm) {
      desc = append(desc, "Гами.")
    }
    if FrmArpeggio(frm) {
      desc = append(desc, "Арпеджіо.")
    }
    if FrmInterval(frm) {
      desc = append(desc, "Інтревали.")
    }
    if FrmChord(frm) {
      desc = append(desc, "Акорди.")
    }
    if FrmPolyphony(frm) {
      desc = append(desc, "Поліфонія.")
    }
    if FrmPolyrhythm(frm) {
      desc = append(desc, "Поліритмія.")
    }
    if FrmOrnament(frm) {
      desc = append(desc, "Орнамент.")
    }
    if FrmLeftHand(frm) {
      desc = append(desc, "Ліва рука.")
    }
  }
  // Level
  desc = append(desc, metaDesc[piece.Lvl])
  return strings.Join(desc, " ")
}

var reCleanTit = regexp.MustCompile(`[^- \pL\d]+`)

func scoreFile(tit, id string) string {
  tit = strings.ReplaceAll(
    reCleanTit.ReplaceAllLiteralString(tit, ""), " ", "-",
  )
  return fmt.Sprintf("%s-%s", tit, id)
}

func LyricsFile(tit string) string {
  tit = strings.ReplaceAll(
    reCleanTit.ReplaceAllLiteralString(tit, ""), " ", "-",
  )
  return tit + ".ly"
}

func addMetaToPieces(pieces []*Piece) {
  for _, piece := range pieces {
    // sub
    sub, exists := metaSub[piece.Sub]
    if exists {
      piece.Sub = sub
    }
    // art
    if len(piece.Arr) > 0 {
      if len(piece.Art) == 0 {
        piece.Art = "arr" // Default: arrangement
      }
      piece.UkrArt = metaSub[piece.Art]
    }
    // lcs
    if len(piece.Lcs) == 0 {
      piece.Lcs = "cpl" // Default: copyleft
    }
    // ens
    if len(piece.Ens) == 0 {
      piece.Ens = "sol" // Default: solo
    }
    // desc
    piece.Desc = pieceDesc(piece)
    // file
    piece.File = scoreFile(piece.Tit, piece.ID)
    piece.LyricsFile = LyricsFile(piece.Tit)
  }
}

var (
  reID = regexp.MustCompile(`^[a-z0-9]{4}$`)
  reArt = regexp.MustCompile(`^arr|ipr|hrm$`)
  reLcs = regexp.MustCompile(`^cpl|cpr$`)
  reOrg = regexp.MustCompile(
    `^ukr|rus|blr|hun|mda|pol|cze|svk|svn|lva|ltu|est|aut|deu|dnk|fra|swe$`,
  )
  reSty = regexp.MustCompile(`^flk|cus|cls$`)
  reGnr = regexp.MustCompile(
    `^sng|chd|lul|ves|kol|pry|rmc|mil` +
    `|dnc|plk|mzr|qdr|men|koz|gop|vls|tng|mrc` +
    `|pie|inv|can|pre|gyp|stu$`,
  )
  reTon = regexp.MustCompile(`^[a-g](?:es|is)?m[ij]$`)
  reFrm = regexp.MustCompile(
    `^mel|var|vo[23]|scl|seq|cro|arp|lng|srt|brk|in[3-8]|cr[57]` +
    `|syn|tu[356]|dot|rep|tre|acc|mor|gru|tri|gli|cad|fi1|fi5|jmp` +
    `|stb|pub|frb$`,
  )
  reLvl = regexp.MustCompile(`^(?:el|in|pr|vi)[abc]$`)
  reEns = regexp.MustCompile(`^sol|duo|vc1|vc2$`)
)

func validatePieces(pieces []*Piece) error {
  for _, piece := range pieces {
    errs := make([]string, 0, 5)
    if !reID.MatchString(piece.ID) {
      errs = append(errs, "invalid id " + piece.ID)
    }
    if len(piece.Art) > 0 && !reArt.MatchString(piece.Art) {
      errs = append(errs, "invalid art " + piece.Art)
    }
    if !reLcs.MatchString(piece.Lcs) {
      errs = append(errs, "invalid lcs " + piece.Lcs)
    }
    if !reOrg.MatchString(piece.Org) {
      errs = append(errs, "invalid org " + piece.Org)
    }
    if !reSty.MatchString(piece.Sty) {
      errs = append(errs, "invalid sty " + piece.Sty)
    }
    if !reGnr.MatchString(piece.Gnr) {
      errs = append(errs, "invalid gnr " + piece.Gnr)
    }
    for _, ton := range piece.Ton {
      if !reTon.MatchString(ton) {
        errs = append(errs, "invalid ton " + ton)
      }
    }
    for _, frm := range piece.Frm {
      if !reFrm.MatchString(frm) {
        errs = append(errs, "invalid frm " + frm)
      }
    }
    for _, bss := range piece.Bss {
      if !reFrm.MatchString(bss) {
        errs = append(errs, "invalid bss " + bss)
      }
    }
    if !reLvl.MatchString(piece.Lvl) {
      errs = append(errs, "invalid lvl " + piece.Lvl)
    }
    if !reEns.MatchString(piece.Ens) {
      errs = append(errs, "invalid ens " + piece.Ens)
    }
    if len(errs) > 0 {
      return fmt.Errorf(
        "invalid piece %s\n%s", piece.ID, strings.Join(errs, "\n"),
      )
    }
  }
  return nil
}

func readPieces(catDir, catQuery string) (map[string]*Piece, []string, error) {
  files, err := listCatalogFiles(catDir, catQuery)
  if err != nil {
    return nil, nil, err
  }
  if len(files) == 0 {
    return nil, nil, errors.New("no catalog files selected")
  }
  pieceMap := make(map[string]*Piece, 1000)
  pieceIDs := make([]string, 0, 1000) // Piece order
  for _, catFile := range files {
    catFile = filepath.Join(catDir, catFile)
    pieces, err := readCatalogFile(catFile)
    if err != nil {
      return nil, nil, err
    }
    addMetaToPieces(pieces)
    err = validatePieces(pieces)
    if err != nil {
      return nil, nil, err
    }
    for _, piece := range pieces {
      pieceMap[piece.ID] = piece
      pieceIDs = append(pieceIDs, piece.ID)
    }
  }
  return pieceMap, pieceIDs, nil
}

func makeMatchStr(query string) (func(value string) bool, error) {
  invert := strings.HasPrefix(query, "^")
  query = strings.ReplaceAll(query, "^", "")
  query = strings.ReplaceAll(query, ",", "|") // --org ukr,rus => ukr || rus
  query = fmt.Sprintf("(?i:%s)", query) // Case insensitive
  reQuery, err := regexp.Compile(query)
  if err != nil {
    return nil, err
  }
  return func(value string) bool {
    m := reQuery.MatchString(value)
    if invert { // --org ^ukr,rus => not (ukr || rus)
      return !m
    }
    return m
  }, nil
}

func makeMatchPiece(
  queries map[string]string,
) (func(piece *Piece) bool, error) {
  ms := make([]func(piece *Piece) bool, 0, len(queries))
  for name, query := range queries {
    match, err := makeMatchStr(query)
    if err != nil {
      return nil, err
    }
    switch name {
    case "tit":
      ms = append(ms, func(piece *Piece) bool {
        return match(piece.Tit)
      })
    case "com":
      ms = append(ms, func(piece *Piece) bool {
        return match(piece.Com)
      })
    case "arr":
      ms = append(ms, func(piece *Piece) bool {
        return match(piece.Arr)
      })
    case "art":
      ms = append(ms, func(piece *Piece) bool {
        return match(piece.Art)
      })
    case "aut":
      ms = append(ms, func(piece *Piece) bool {
        return match(piece.Aut)
      })
    case "lcs":
      ms = append(ms, func(piece *Piece) bool {
        return match(piece.Lcs)
      })
    case "org":
      ms = append(ms, func(piece *Piece) bool {
        return match(piece.Org)
      })
    case "sty":
      ms = append(ms, func(piece *Piece) bool {
        return match(piece.Sty)
      })
    case "gnr":
      ms = append(ms, func(piece *Piece) bool {
        return match(piece.Gnr)
      })
    case "ton":
      ms = append(ms, func(piece *Piece) bool {
        return slices.ContainsFunc(piece.Ton, match)
      })
    case "frm":
      ms = append(ms, func(piece *Piece) bool {
        return slices.ContainsFunc(piece.Frm, match)
      })
    case "bss":
      ms = append(ms, func(piece *Piece) bool {
        return slices.ContainsFunc(piece.Bss, match)
      })
    case "lvl":
      ms = append(ms, func(piece *Piece) bool {
        return match(piece.Lvl)
      })
    case "ens":
      ms = append(ms, func(piece *Piece) bool {
        return match(piece.Ens)
      })
    }
  }
  return func(piece *Piece) bool {
    for _, match := range ms { // --org && --bss
      if !match(piece) {
        return false
      }
    }
    return true
  }, nil
}

func QueryPieces(pieces []*Piece, queries map[string]string) ([]*Piece, error) {
  match, err := makeMatchPiece(queries)
  if err != nil {
    return nil, err
  }
  selected := make([]*Piece, 0, 200)
  for _, piece := range pieces {
    if match(piece) {
      selected = append(selected, piece)
    }
  }
  return selected, nil
}

func bass(bss []string) string {
  for _, b := range []string{"frb", "pub", "stb"} { // Bass priority
    if slices.Contains(bss, b) {
      return b
    }
  }
  return "___"
}

func SortByTit(piece *Piece) string {
  // Sort studies by composer, then by title
  if piece.Gnr == "stu" {
    return SortByCom(piece)
  }
  // Sort by title, then by composer or arranger
  return piece.Tit + SortByCom(piece)
}

func SortByCom(piece *Piece) string {
  // Sort by composer or arranger, then by title
  if len(piece.Com) > 3 {
    return string([]rune(piece.Com)[3:]) + piece.Tit
  }
  if len(piece.Arr) > 3 {
    return string([]rune(piece.Arr)[3:]) + piece.Tit
  }
  return piece.Tit
}

func SortByLvl(piece *Piece) string {
  // Sort by level, then by title
  return piece.Lvl + SortByTit(piece)
}

var sortKeys = []string{"tit", "com", "lvl", "rnd"}

var sortBy = func() map[string]func(piece *Piece) string {
  key := make(map[string]func(piece *Piece) string, 4)
  key["tit"] = SortByTit
  key["com"] = SortByCom
  key["lvl"] = SortByLvl
  return key
}()

var collator = collate.New(language.Und)

func SortPieces(pieces []*Piece, sortKey func(piece *Piece) string) {
  slices.SortStableFunc(pieces, func(a, b *Piece) int {
    return collator.CompareString(sortKey(a), sortKey(b))
  })
}

func RandPieces(pieces []*Piece) {
  rand.Shuffle(len(pieces), func(i, j int) {
    pieces[i], pieces[j] = pieces[j], pieces[i]
  })
}

func ArrangePieces(pieces []*Piece, sortKey string) error {
  if !slices.Contains(sortKeys, sortKey) {
    return fmt.Errorf("invalid sort key %s", sortKey)
  }
  if sortKey == "rnd" {
    RandPieces(pieces)
  } else {
    SortPieces(pieces, sortBy[sortKey])
  }
  return nil
}
