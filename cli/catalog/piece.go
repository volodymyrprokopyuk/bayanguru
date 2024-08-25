package catalog

import (
	"fmt"
	"io"
	"os"
	"path/filepath"
	"regexp"
	"strings"
	"sync"

	"github.com/volodymyrprokopyuk/bayanguru/cli/style"
	"gopkg.in/yaml.v3"
)

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
  // Piece arrangment type (art)
  "arr": "Обр. ", // обробка = arrangment (default)
  "ipr": "Пер. ", // переклад = interpratation
  "hrm": "Гарм. ", // гармонізація = harmonization
}

type StrSlice []string

func (ss *StrSlice) UnmarshalYAML(node *yaml.Node) error {
  var slc []string
  err := node.Decode(&slc) // try a string slice
  if err != nil {
    var str string
    err := node.Decode(&str) // try a single string
    if err != nil {
      return err
    }
    *ss = []string{str} // convert a single string into a string slice
    return nil
  }
  *ss = slc // return a string slice
  return nil
}

type Piece struct {
  ID string `yaml:"id"`
  Tit string `yaml:"tit"`
  Sub string `yaml:"sub"`

  Com string `yaml:"com"`
  Arr string `yaml:"arr"`
  Art string `yaml:"art"`
  ArtUkr string
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

type PieceMap map[string]Piece

type MatchStr func(str string) bool

func makeMatchStr(pattern string) (MatchStr, error) {
  isNeg := strings.HasPrefix(pattern, "^")
  pattern = regexp.QuoteMeta(strings.TrimPrefix(pattern, "^"))
  pattern = fmt.Sprintf("(?i:%v)", strings.ReplaceAll(pattern, ",", "|"))
  re, err := regexp.Compile(pattern)
  if err != nil {
    return nil, err
  }
  match := func(str string) bool {
    if isNeg {
      return !re.MatchString(str)
    }
    return re.MatchString(str)
  }
  return match, nil
}

type MatchPiece func(piece Piece) bool

func makeMatchPiece(queries PieceQueries) (MatchPiece, error) {
  matches := make(map[string]MatchStr, len(queries))
  for opt, query := range queries {
    match, err := makeMatchStr(query)
    if err != nil {
      return nil, err
    }
    matches[opt] = match
  }
  matchSlice := func(slc StrSlice, match MatchStr, negMatch bool) bool {
    if negMatch {
      for _, str := range slc {
        if !match(str) {
          return false // first false on negative match e.g. ^frb
        }
      }
      return true
    }
    for _, str := range slc {
      if match(str) {
        return true // first true on positive match e.g. frb
      }
    }
    return false
  }
  matchPiece := func(piece Piece) bool {
    for opt, match := range matches {
      switch opt {
      case "tit":
        if !match(piece.Tit) {
          return false
        }
      case "com":
        if !match(piece.Com) {
          return false
        }
      case "arr":
        if !match(piece.Arr) {
          return false
        }
      case "art":
        if !match(piece.Art) {
          return false
        }
      case "aut":
        if !match(piece.Aut) {
          return false
        }
      case "lcs":
        if !match(piece.Lcs) {
          return false
        }
      case "org":
        if !match(piece.Org) {
          return false
        }
      case "sty":
        if !match(piece.Sty) {
          return false
        }
      case "gnr":
        if !match(piece.Gnr) {
          return false
        }
      case "ton":
        negMatch := strings.HasPrefix(queries["ton"], "^")
        if !matchSlice(piece.Ton, match, negMatch) {
          return false
        }
      case "frm":
        negMatch := strings.HasPrefix(queries["frm"], "^")
        if !matchSlice(piece.Frm, match, negMatch) {
          return false
        }
      case "bss":
        negMatch := strings.HasPrefix(queries["bss"], "^")
        if !matchSlice(piece.Bss, match, negMatch) {
          return false
        }
      case "lvl":
        if !match(piece.Lvl) {
          return false
        }
      case "ens":
        if !match(piece.Ens) {
          return false
        }
      case "lyr":
        if !match(piece.Lyr) {
          return false
        }
      default:
        panic(fmt.Sprintf("catalog: unknown query option %v", opt))
      }
    }
    return true
  }
  return matchPiece, nil
}

func listCatalogFiles(catDir, catQuery string) ([]string, error) {
  entries, err := os.ReadDir(catDir)
  if err != nil {
    return nil, err
  }
  match, err := makeMatchStr(catQuery)
  if err != nil {
    return nil, err
  }
  files := make([]string, 0, 50)
  for _, entry := range entries {
    if !entry.IsDir() && strings.HasSuffix(entry.Name(), ".yaml") &&
      match(strings.TrimSuffix(entry.Name(), ".yaml")) {
      files = append(files, entry.Name())
    }
  }
  return files, nil
}

func readCatalogFile(catalogFile string) ([]Piece, error) {
  file, err := os.Open(catalogFile)
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

func addMetaToPieces(pieces []Piece) {
  for i := range pieces {
    piece := &pieces[i]
    // sub
    if sub, exists := meta[piece.Sub]; exists {
      piece.Sub = sub
    }
    // art
    if len(piece.Arr) > 0 {
      if len(piece.Art) == 0 {
        piece.Art = "arr" // default: arrangement
      }
      piece.ArtUkr = meta[piece.Art]
    }
    // lcs
    if len(piece.Lcs) == 0 {
      piece.Lcs = "cpl" // default: copyleft
    }
    // ens
    if len(piece.Ens) == 0 {
      piece.Ens = "sol" // default: solo
    }
    // file
    piece.File = scoreFile(piece.Tit, piece.ID)
  }
}

func reCompile(reParts []string) []*regexp.Regexp {
  res := make([]*regexp.Regexp, 0, len(reParts))
  for _, re := range reParts {
    res = append(res, regexp.MustCompile(re))
  }
  return res
}

var (
  validID = regexp.MustCompile(`^[a-z0-9]{4}$`)
  validArt = regexp.MustCompile(`^arr|ipr|hrm$`)
  validLcs = regexp.MustCompile(`^cpl|cpr$`)
  orgParts = []string{
    `^ukr|rus|blr|hun|mda|pol|cze|svk|lva`,
    `|aut|deu|dnk|fra|swe$`,
  }
  validOrg = regexp.MustCompile(strings.Join(orgParts, ""))
  validSty = regexp.MustCompile(`^flk|cus|cls$`)
  gnrParts = []string{
    `^sng|chd|lul|mil|pry|rmc|ves`,
    `|dnc|gop|koz|mrc|plk|mzr|qdr|tng|vls`,
    `|pie|pre|inv|gyp|stu$`,
  }
  validGnr = regexp.MustCompile(strings.Join(gnrParts, ""))
  validTon = regexp.MustCompile(`^[a-g](?:es|is)?m[ij]$`)
  frmParts = []string{
    `^vo[23]|stb|pub|frb$`,
    `^mel|var$`,
    `^scl|seq|arp|lng|srt|brk|in[3-8]|cr[57]$`,
    `^tu[356]|dot|syn$`,
    `^rep|tre|acc|mor|gru|tri|gli|cad$`,
    `^fi1|fi5|jmp$`,
  }
  validFrm = reCompile(frmParts)
  validLvl = regexp.MustCompile(`^(?:el|in|pr|vi)[a-c]$`)
  validEns = regexp.MustCompile(`^sol|duo|vc1|vc2$`)
)

func validateFrm(frms []string, frmName string) string {
  frmSeq := "pph, bss, mel, scl, arp, int, crd, prh, orn, wrs"
  i, j := 0, 0
  for {
    if i == len(frms) {
      return ""
    }
    if j == len(validFrm) && i < len(frms) {
      return fmt.Sprintf(
        "* Unordered or invalid %v, expected %v,\n  got %v",
        frmName, frmSeq, strings.Join(frms, " "),
      )
    }
    frm, re := frms[i], validFrm[j]
    if re.MatchString(frm) {
      i++
    } else {
      j++
    }
  }
}

func validatePieces(pieces []Piece, catalogFile string) error {
  for _, piece := range pieces {
    errors := make([]string, 0, 5)
    if !validID.MatchString(piece.ID) {
      errors = append(errors, fmt.Sprintf(
        "* Invalid id, expected [a-z0-9]{4}, got %v", piece.ID),
      )
    }
    if len(piece.Art) > 0 && !validArt.MatchString(piece.Art) {
      errors = append(errors, fmt.Sprintf(
        "* Invalid art, expected arr, ipr, hrm, got %v", piece.Art),
      )
    }
    if !validLcs.MatchString(piece.Lcs) {
      errors = append(errors, fmt.Sprintf(
        "* Invalid lcs, expected cpl, cpr, got %v", piece.Lcs),
      )
    }
    if !validOrg.MatchString(piece.Org) {
      errors = append(errors, fmt.Sprintf(
        "* Invalid org, expected 3-letter country code, got %v", piece.Org),
      )
    }
    if !validSty.MatchString(piece.Sty) {
      errors = append(errors, fmt.Sprintf(
        "* Invalid sty, expected flk, cus, cls, got %v", piece.Sty),
      )
    }
    if !validGnr.MatchString(piece.Gnr) {
      errors = append(errors, fmt.Sprintf(
        "* Invalid gnr, expected sng, dnc, pie, stu, got %v", piece.Gnr),
      )
    }
    for _, ton := range piece.Ton {
      if !validTon.MatchString(ton) {
        errors = append(errors, fmt.Sprintf(
          "* Invalid ton, expected [a-g](es|is)?m[ij], got %v", ton),
        )
      }
    }
    if err := validateFrm(piece.Frm, "frm"); len(err) > 0 {
      errors = append(errors, err)
    }
    if err := validateFrm(piece.Bss, "bss"); len(err) > 0 {
      errors = append(errors, err)
    }
    if !validLvl.MatchString(piece.Lvl) {
      errors = append(errors, fmt.Sprintf(
        "* Invalid lvl, expected (el|in|pr|vi)[a-c], got %v", piece.Lvl),
      )
    }
    if !validEns.MatchString(piece.Ens) {
      errors = append(errors, fmt.Sprintf(
        "* Invalid ens, expected sol, duo, vos, vod, got %v", piece.Ens),
      )
    }
    if len(errors) > 0 {
      return fmt.Errorf(
        "validation: file %v, piece %v\n%v",
        catalogFile, piece.ID, strings.Join(errors, "\n"),
      )
    }
  }
  return nil
}

func readPieces(catDir, catQuery string) (PieceMap, []string, error) {
  catFiles, err := listCatalogFiles(catDir, catQuery)
  if err != nil {
    return nil, nil, err
  }
  pieceMap := make(PieceMap, 1000)
  pieceIDs := make([]string, 0, 1000) // ordered pieces for all
  for _, catFile := range catFiles {
    catalogFile := filepath.Join(catDir, catFile)
    pieces, err := readCatalogFile(catalogFile)
    if err != nil {
      return nil, nil, err
    }
    addMetaToPieces(pieces)
    err = validatePieces(pieces, catalogFile)
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

func QueryPieces(pieces []Piece, queries PieceQueries) ([]Piece, error) {
  match, err := makeMatchPiece(queries)
  if err != nil {
    return nil, err
  }
  selPieces := make([]Piece, 0, 200)
  for _, piece := range pieces {
    if match(piece) {
      selPieces = append(selPieces, piece)
    }
  }
  return selPieces, nil
}

func Bss(bss []string, ID string) string {
  for _, b := range bss {
    switch b {
    case "stb", "pub", "frb":
      return b
    }
  }
  err := fmt.Sprintf(
    "catalog: piece %v missing bass type, expected: stb, pub, frb", ID,
  )
  panic(err)
}

func PrintPiece(w io.Writer, piece Piece) {
  tit := piece.Tit
  com := fmt.Sprintf("%v %v%v", piece.Com, piece.ArtUkr, piece.Arr)
  com = strings.TrimSpace(com)
  titLen, comLen := len([]rune(tit)), len([]rune(com))
  maxTit := 53 - comLen
  if titLen > maxTit {
    tit = fmt.Sprintf("%v…", string([]rune(tit)[:maxTit - 1]))
    titLen = maxTit
  }
  spaceLen := 53 - titLen - comLen
  fmt.Fprintf(
    w, "%v %v %v %v %v %v %v %v %v\n",
    style.ID(piece.ID), style.Tit(tit),
    strings.Repeat(" ", spaceLen), style.Com(com),
    style.Org(piece.Org), style.Org(piece.Sty), style.Org(piece.Gnr),
    style.Bss(Bss(piece.Bss, piece.ID)), style.Lvl(piece.Lvl),
  )
}
