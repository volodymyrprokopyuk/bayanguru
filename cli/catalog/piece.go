package catalog

import (
	"fmt"
	"io"
	"os"
	"path/filepath"
	"regexp"
	"slices"
	"strings"
	"sync"

	"gopkg.in/yaml.v3"
)

// TODO
func FanIn(ins []chan error) <-chan error {
  out := make(chan error)
  var wg sync.WaitGroup
  for _, in := range ins {
    wg.Add(1)
    go func() {
      defer wg.Done()
      for val := range in {
        out <- val
      }
    }()
  }
  go func() {
    wg.Wait()
    close(out)
  }()
  return out
}

var meta = map[string]string{
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
  Lyr string `yaml:"lyr"`

  File string
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

func readCatalogFile(catFile string) ([]Piece, error) {
  file, err := os.Open(catFile)
  if err != nil {
    return nil, err
  }
  defer file.Close()
  var pieces struct { Pieces []Piece `yaml:"pieces"` }
  err = yaml.NewDecoder(file).Decode(&pieces)
  if err != nil {
    return nil, err
  }
  return pieces.Pieces, nil
}

var reCleanTit = regexp.MustCompile(`[^- \pL\d]+`)

func scoreFile(tit, ID string) string {
  tit = strings.ReplaceAll(reCleanTit.ReplaceAllLiteralString(tit, ""), " ", "-")
  return fmt.Sprintf("%s-%s", tit, ID)
}

func addMetaToPieces(pieces []Piece) {
  for i := range pieces {
    piece := &pieces[i]
    // sub
    sub, exists := meta[piece.Sub]
    if exists {
      piece.Sub = sub
    }
    // art
    if len(piece.Arr) > 0 {
      if len(piece.Art) == 0 {
        piece.Art = "arr" // Default: arrangement
      }
      piece.UkrArt = meta[piece.Art]
    }
    // lcs
    if len(piece.Lcs) == 0 {
      piece.Lcs = "cpl" // Default: copyleft
    }
    // ens
    if len(piece.Ens) == 0 {
      piece.Ens = "sol" // Default: solo
    }
    // file
    piece.File = scoreFile(piece.Tit, piece.ID)
  }
}

var (
  reID = regexp.MustCompile(`^[a-z0-9]{4}$`)
  reArt = regexp.MustCompile(`^arr|ipr|hrm$`)
  reLcs = regexp.MustCompile(`^cpl|cpr$`)
  reOrg = regexp.MustCompile(
    `^ukr|rus|blr|hun|mda|pol|cze|svk|svn|lva|est|aut|deu|dnk|fra|swe$`,
  )
  reSty = regexp.MustCompile(`^flk|cus|cls$`)
  reGnr = regexp.MustCompile(strings.Join([]string{
    `^sng|chd|lul|ves|kol|pry|rmc|mil`,
    `|dnc|plk|mzr|qdr|men|koz|gop|vls|tng|mrc`,
    `|pie|pre|inv|can|gyp|stu$`}, ""),
  )
  reTon = regexp.MustCompile(`^[a-g](?:es|is)?m[ij]$`)
  reFrm = regexp.MustCompile(strings.Join([]string{
    `^mel|var|vo[23]|scl|seq|cro|arp|lng|srt|brk|in[3-8]|cr[57]`,
    `|tu[356]|dot|syn|rep|tre|acc|mor|gru|tri|gli|cad|fi1|fi5|jmp`,
    `|stb|pub|frb$`}, ""),
  )
  reLvl = regexp.MustCompile(`^(?:el|in|pr|vi)[a-c]$`)
  reEns = regexp.MustCompile(`^sol|duo|vc1|vc2$`)
  reLyr = regexp.MustCompile(`^lyr$`)
)

func validatePieces(pieces []Piece) error {
  for _, piece := range pieces {
    errors := make([]string, 0, 5)
    if !reID.MatchString(piece.ID) {
      errors = append(errors, fmt.Sprintf("invalid id %v", piece.ID))
    }
    if len(piece.Art) > 0 && !reArt.MatchString(piece.Art) {
      errors = append(errors, fmt.Sprintf("invalid art %v", piece.Art))
    }
    if !reLcs.MatchString(piece.Lcs) {
      errors = append(errors, fmt.Sprintf("invalid lcs %v", piece.Lcs))
    }
    if !reOrg.MatchString(piece.Org) {
      errors = append(errors, fmt.Sprintf("invalid org %v", piece.Org))
    }
    if !reSty.MatchString(piece.Sty) {
      errors = append(errors, fmt.Sprintf("invalid sty %v", piece.Sty))
    }
    if !reGnr.MatchString(piece.Gnr) {
      errors = append(errors, fmt.Sprintf("invalid gnr %v", piece.Gnr))
    }
    for _, ton := range piece.Ton {
      if !reTon.MatchString(ton) {
        errors = append(errors, fmt.Sprintf("invalid ton %v", ton))
      }
    }
    for _, frm := range piece.Frm {
      if !reFrm.MatchString(frm) {
        errors = append(errors, fmt.Sprintf("invalid frm %v", frm))
      }
    }
    for _, bss := range piece.Bss {
      if !reFrm.MatchString(bss) {
        errors = append(errors, fmt.Sprintf("invalid bss %v", bss))
      }
    }
    if !reLvl.MatchString(piece.Lvl) {
      errors = append(errors, fmt.Sprintf("invalid lvl %v", piece.Lvl))
    }
    if !reEns.MatchString(piece.Ens) {
      errors = append(errors, fmt.Sprintf("invalid ens %v", piece.Ens))
    }
    if len(piece.Lyr) > 0 && !reLyr.MatchString(piece.Lyr) {
      errors = append(errors, fmt.Sprintf("invalid lyr %v", piece.Lyr))
    }
    if len(errors) > 0 {
      return fmt.Errorf(
        "invalid piece %v\n%v", piece.ID, strings.Join(errors, "\n"),
      )
    }
  }
  return nil
}

func readPieces(catDir, catQuery string) (map[string]Piece, []string, error) {
  files, err := listCatalogFiles(catDir, catQuery)
  if err != nil {
    return nil, nil, err
  }
  if len(files) == 0 {
    return nil, nil, fmt.Errorf("no catalog files selected")
  }
  pieceMap := make(map[string]Piece, 1000)
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
  query = strings.ReplaceAll(query, ",", "|")
  query = fmt.Sprintf("(?i:%v)", query)
  reQuery, err := regexp.Compile(query)
  if err != nil {
    return nil, err
  }
  return func(value string) bool {
    m := reQuery.MatchString(value)
    if invert {
      return !m
    }
    return m
  }, nil
}

func makeMatchPiece(queries map[string]string) (func(piece Piece) bool, error) {
  ms := make([]func(piece Piece) bool, 0, len(queries))
  for name, query := range queries {
    match, err := makeMatchStr(query)
    if err != nil {
      return nil, err
    }
    switch name {
    case "tit":
      ms = append(ms, func(piece Piece) bool { return match(piece.Tit) })
    case "com":
      ms = append(ms, func(piece Piece) bool { return match(piece.Com) })
    case "arr":
      ms = append(ms, func(piece Piece) bool { return match(piece.Arr) })
    case "art":
      ms = append(ms, func(piece Piece) bool { return match(piece.Art) })
    case "aut":
      ms = append(ms, func(piece Piece) bool { return match(piece.Aut) })
    case "lcs":
      ms = append(ms, func(piece Piece) bool { return match(piece.Lcs) })
    case "org":
      ms = append(ms, func(piece Piece) bool { return match(piece.Org) })
    case "sty":
      ms = append(ms, func(piece Piece) bool { return match(piece.Sty) })
    case "gnr":
      ms = append(ms, func(piece Piece) bool { return match(piece.Gnr) })
    case "ton":
      ms = append(ms, func(piece Piece) bool {
        for _, ton := range piece.Ton {
          if match(ton) {
            return true
          }
        }
        return false
      })
    case "frm":
      ms = append(ms, func(piece Piece) bool {
        for _, frm := range piece.Frm {
          if match(frm) {
            return true
          }
        }
        return false
      })
    case "bss":
      ms = append(ms, func(piece Piece) bool {
        for _, bss := range piece.Bss {
          if match(bss) {
            return true
          }
        }
        return false
      })
    case "lvl":
      ms = append(ms, func(piece Piece) bool { return match(piece.Lvl) })
    case "ens":
      ms = append(ms, func(piece Piece) bool { return match(piece.Ens) })
    case "lyr":
      ms = append(ms, func(piece Piece) bool { return match(piece.Lyr) })
    }
  }
  return func(piece Piece) bool {
    for _, match := range ms {
      if !match(piece) {
        return false
      }
    }
    return true
  }, nil
}

func QueryPieces(pieces []Piece, queries map[string]string) ([]Piece, error) {
  match, err := makeMatchPiece(queries)
  if err != nil {
    return nil, err
  }
  selected := make([]Piece, 0, 200)
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

func PrintPiece(w io.Writer, piece Piece) {
  tit := piece.Tit
  com := fmt.Sprintf("%s %s%s", piece.Com, piece.UkrArt, piece.Arr)
  com = strings.TrimSpace(com)
  titLen, comLen := len([]rune(tit)), len([]rune(com))
  maxTit := 53 - comLen
  if titLen > maxTit {
    tit = fmt.Sprintf("%s…", string([]rune(tit)[:maxTit - 1]))
    titLen = maxTit
  }
  spaceLen := 53 - titLen - comLen
  fmt.Fprintf(
    w, "%s %s %s %s %s %s %s %s %s\n",
    GreenTit(piece.ID), YellowTit(tit), strings.Repeat(" ", spaceLen), BlueTit(com),
    GreenSub(piece.Org), GreenSub(piece.Sty), GreenSub(piece.Gnr),
    RedTit(bass(piece.Bss)), BlueSub(piece.Lvl),
  )
}
