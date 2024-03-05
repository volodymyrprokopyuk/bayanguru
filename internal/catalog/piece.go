package catalog

import (
  "fmt"
  "strings"
  "regexp"
  "io"
  "path/filepath"
  "os"
  "gopkg.in/yaml.v3"
  sty "github.com/volodymyrprokopyuk/bayan/internal/style"
)

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
  Src string `yaml:"src"`
  Org string `yaml:"org"`
  Sty string `yaml:"sty"`
  Gnr string `yaml:"gnr"`
  Ton StrSlice `yaml:"ton"`
  Frm StrSlice `yaml:"frm"`
  Bss StrSlice `yaml:"bss"`
  Lvl string `yaml:"lvl"`
  File string
  Meta bool
  RightHand, LeftHand string
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

func reCompile(reParts []string) []*regexp.Regexp {
  res := make([]*regexp.Regexp, 0, len(reParts))
  for _, re := range reParts {
    res = append(res, regexp.MustCompile(re))
  }
  return res
}

var (
  validID = regexp.MustCompile(`^[a-z0-9]{4}$`)
  orgParts = []string{
    `^ukr|rus|blr|hun|mda|pol|cze|svk|lva`,
    `|aut|deu|dnk|fra|swe$`,
  }
  validOrg = regexp.MustCompile(strings.Join(orgParts, ""))
  validSty = regexp.MustCompile(`^flk|cus|cls$`)
  gnrParts = []string{
    `^sng|chd|lul|mil|pry|rmc|ves`,
    `|dnc|gop|koz|mrc|plk|tng|vls`,
    `|pie|gyp|stu$`,
  }
  validGnr = regexp.MustCompile(strings.Join(gnrParts, ""))
  validTon = regexp.MustCompile(`^[a-g](?:es|is)?[ij]$`)
  validLvl = regexp.MustCompile(`^(?:el|in|pr|vi)[a-c]$`)
  frmParts = []string{
    `^stb|pub|frb$`,
    `^mel|var$`,
    `^scl|arp|in[3-8]|cr[57]|vo[23]$`,
    `^tu[356]|dot|syn$`,
    `^rep|tre|acc|mor|gru|tri|gli$`,
    `^fi1|fi5|jmp$`,
  }
  validFrm = reCompile(frmParts)
)

func validateFrm(frms []string, frmName string) string {
  frmSeq := "bss, mel, scl, arp, int, crd, pph, prh, orn, wrs"
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
          "* Invalid ton, expected [a-g](es|is)?[ij], got %v", ton),
        )
      }
    }
    if !validLvl.MatchString(piece.Lvl) {
      errors = append(errors, fmt.Sprintf(
        "* Invalid lvl, expected (el|in|pr|vi)[a-c], got %v", piece.Lvl),
      )
    }
    if err := validateFrm(piece.Frm, "frm"); len(err) > 0 {
      errors = append(errors, err)
    }
    if err := validateFrm(piece.Bss, "bss"); len(err) > 0 {
      errors = append(errors, err)
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

func readCatalogFile(catDir, catFile string) ([]Piece, error) {
  catalogFile := filepath.Join(catDir, catFile)
  file, err := os.Open(catalogFile)
  if err != nil {
    return nil, err
  }
  defer file.Close()
  dec := yaml.NewDecoder(file)
  var pieces struct { Pieces []Piece `yaml:"pieces"` }
  err = dec.Decode(&pieces)
  if err != nil {
    return nil, err
  }
  err = validatePieces(pieces.Pieces, catalogFile)
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
      if len(piece.Art) > 0 {
        piece.Art = meta[piece.Art]
      } else {
        piece.Art = meta["arr"] // default: arrangement
      }
    }
    // file
    piece.File = scoreFile(piece.Tit, piece.ID)
  }
}

func readPieces(catDir, catQuery string) (PieceMap, []string, error) {
  catFiles, err := listCatalogFiles(catDir, catQuery)
  if err != nil {
    return nil, nil, err
  }
  pieceMap := make(PieceMap, 1000)
  pieceIDs := make([]string, 0, 1000) // ordered pieces for all
  for _, catFile := range catFiles {
    pieces, err := readCatalogFile(catDir, catFile)
    if err != nil {
      return nil, nil, err
    }
    addMetaToPieces(pieces)
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

var studyType = regexp.MustCompile(`^(scl|arp|in|cr|vo)\d?$`)

func Stu(frmOrBss []string, ID string) string {
  for _, s := range frmOrBss {
    if m := studyType.FindStringSubmatch(s); m != nil {
      switch m[1] {
      case "in":
        return "int"
      case "cr":
        return "crd"
      case "vo":
        return "pph"
      default:
        return m[1]
      }
    }
  }
  err := fmt.Sprintf(
    "catalog: piece %v missing study type, expected: scl, arp, in, cr, vo",
    ID,
  )
  panic(err)
}

func PrintPiece(w io.Writer, piece Piece) {
  tit := piece.Tit
  com := fmt.Sprintf("%v %v%v", piece.Com, piece.Art, piece.Arr)
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
    sty.ID(piece.ID), sty.Tit(tit),
    strings.Repeat(" ", spaceLen), sty.Com(com),
    sty.Org(piece.Org), sty.Org(piece.Sty), sty.Org(piece.Gnr),
    sty.Bss(Bss(piece.Bss, piece.ID)), sty.Lvl(piece.Lvl),
  )
}
